package it.polimi.db2.project.services;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.lang3.time.DateUtils;
import org.joda.time.DateTimeComparator;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.entities.QuestionnaireResponse;
import it.polimi.db2.project.entities.User;
import it.polimi.db2.project.exceptions.ApplicationErrorException;
import it.polimi.db2.project.exceptions.InvalidActionException;
import it.polimi.db2.project.exceptions.ProductException;

/**
 * 
 * Service QuestionnaireAdminService: this service has been created in order to let the administrators of the system inspect 
 * data (speaking about a given questionnaire, retrieving the list of users who submitted the questionnaire or cancelled it, + 
 * the questionnaire answer of each user) or delete the questionnaire data (and related responses + points) relatives to a 
 * specific product.
 *
 */
@Stateless
public class QuestionnaireAdminService {
	/**
	 * JPA Entity Manager
	 * it is extended in order to let it live until the user calls the "remove" method.
	 */
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	/**
	 * This is used to erase all the questionnaire data (and the product) related to a specific product
	 * note that all the responses are erased and the points of the users are removed by triggers
	 * @param productId the Id of the product to erase all it's questionnaire data. 
	 * @throws InvalidActionException if the id of the product passed to this method is an ID relative to a product which is 
	 * more recent than the current date (product date need to be lower than the current one, neither equal!).
	 * @throws ProductException when not able to retrieve the product with id equal to the parameter productId
	 */
	public Product deleteQuestionnaires(Integer productId) throws InvalidActionException, ProductException{
		
		//Initializing the date before retrieving it with a query;
		Date dateOfTheProduct = null;
		
		//Retrieving the product via entity manager
		Product p = null;
		
		try {
			p = em.find(Product.class, productId);
		}catch(IllegalArgumentException e) {
			//e.printStackTrace();
			throw new ProductException("Unable to retrieve the product relative. Error trying to perform find method.");
		}
		
		/**
		 * Checking that we were able to actually retrieve the product by id, otherwise we need to raise an exception because 
		 * we cannot proceed. If the entity instance is not found is returned "null".
		 */
		if(p == null) {
			throw new ProductException("Product with id = "+productId+" does not existing!");
		}
		
		//If we are here, then the retrieving of a product has been correctly done, we can assign the date
		dateOfTheProduct = p.getDate();
		
		//Retrieving the date of today
		Date todayDate = Calendar.getInstance().getTime();
		
		/**
		 * Comparing the two dates. This variable will be negative if the date of the product is in the past with respect to 
		 * the current date
		 */
		int dateComparisonResult = DateTimeComparator.getDateOnlyInstance().compare(dateOfTheProduct, todayDate);
		
		/**
		 * Checking if the date is in the past with respect to today's date (not today or in the future).
		 * Defensive programming: checking also that the day is not the same!
		 */
		if( (dateComparisonResult < 0) && (!DateUtils.isSameDay(dateOfTheProduct, todayDate)) ) {
			
			/**
			 * If we are here, we can perform the deletion of all the data related to the product, we just need to remove it with
			 * the entity manager. Triggers will subtract points.
			*/
			em.remove(p);
		}else {
			
			/**
			 * If we are here, the date is either today, or a date after today, we need to throw an exception in order to inform 
			 * the front end that the operation failed because of the product id selected
			 */
			throw new InvalidActionException("You cannot remove the questionnaires of this product, this is caused by a product "
					+ "scheduled as product of the day either today, or in the future.");
		}
		
		return p;
	}
	
	/**
	 * This method is used to retrieve people which has submitted or canceled the questionnaire relative to a defined productId
	 * (you have the possibility to retrieve everyone who has submitted the questionnaire or canceled it by setting input parameters).
	 * Hence this method can be used to retrieve either the list of user who submitted the questionnaire relative to a certain 
	 * product, or to retrieve the list of users who cancelled the questionnaire relative to a certain product.
	 * @param productID is the integer id of the product from which the questionnaires you are retrieving are about
	 * @param subOrCanc is a boolean needed in order to know which users return: the ones who cancelled the questionnaire, or the 
	 * ones who submitted it
	 * @return a list of User type MAY BE NULL
	 * @throws ApplicationErrorException when unable to perform the named query
	 */
	public List<User> getListUserCompiledQuestionnaire(Integer productID, boolean subOrCanc) throws ApplicationErrorException{
		
		//Initializing a temporary list of users.
		List<User> users = null;
		
		/**
		 * We need to retrieve the list of users of users who compiled the questionnaire, but we don't have to return all of them, 
		 * only the ones with the parameter submitted as the one passed in the method. we need to perform a 
		 * check on the parameter "submitted", which is the one passed.
		 */
		try {
			/**
			 * This query retrieves the list of users from the table questionnaire_response which have canceled their 
			 * questionnaire response about the product of the day given as id by the parameter
			 */
			
			users = em.createNamedQuery("QuestionnaireResponse.UsersWhoCompiledQuestionnaires", 
					User.class)
					.setParameter("idOfTheProduct", productID)
					.setParameter("submitted", subOrCanc)
					.getResultList();
			
		}catch(IllegalArgumentException e) {
			throw new ApplicationErrorException("Unable to return the users who compiled the questionnaire of the product with id = "+
					productID +" and parameter submitted = "+ String.valueOf(subOrCanc) );
		}
		
		//Returning the list of users
		return users;
	}
	
	/**
	 * This method retrieve all the questionnaire responses answered by a specific user chosen at front end by the administrator.
	 * The questionnaire retrieved could be both submitted or cancelled. N.B.: the list returned could be null, need to be 
	 * checked at front end
	 * @param userID is the user of which you want to retrieve the questionnaires
	 * @param productID is the product from which you want to retrieve the questionnaire
	 * @return return the questionnaire response submitted by the user about the specific product, it can be either submitted 
	 * or cancelled, this is not filtered looking at the parameter "submitted". The returned object could be null if the user did 
	 * not answered the questionnaire relative to a specific product
	 * @throws ApplicationErrorException if unable to retrieve questionnaire answered by a specific user while calling the named query or if
	 * the questionnaire response is multiple: you cannot have more than one answer per user to a product
	 */
	public QuestionnaireResponse getAllQuestionnaireAnsweredBySpecificUserAndProduct(Integer userID, Integer productID) throws ApplicationErrorException {
		
		//Initializing a temporary list. This list will be filled by the query
		List<QuestionnaireResponse> responses = null;
		
		//Initializing an object Questionnaire response, this will be the returned one
		QuestionnaireResponse response = null;
		
		//We need to query the database retrieving all the questionnaireResponses responded by a specific user.
		try {
			
			/**
			 * The following query is a named query which retrieve all the questionnaire responses answered to the specific user 
			 * passed as parameter, named userID, and about a specific product given its id passed as parameter productID to 
			 * this method.
			 */
			responses = em.createNamedQuery("QuestionnaireResponse.RetrieveSpecificQuestionnaire",
						QuestionnaireResponse.class)
					.setParameter("userID", userID)
					.setParameter("productID", productID)
					.getResultList();
			
		}catch(IllegalArgumentException e) {
			throw new ApplicationErrorException("Unable to return questionnaire responded by user with id = "+userID+" and about the "
					+ "product with id ="+productID);
			
		}
		
		if(responses.size() > 1) {
			//If I am here, I got more than one element. This should not have happened
			throw new ApplicationErrorException("There is more than one element satisfying the query with parameters userID = "
					+userID+" and productID = "+productID+".\n This should not happen: a person should be able to answer only\n"+
					"a questionnaire relative to a product (either none)");
		}
		
		/**
		 * Returning the response: if the method found more than a result, something went wrong, otherwise we can return the first 
		 * element of the list. This check is performed in order to ensure that the inserting part went well
		 */
		if(responses == null || responses.isEmpty() || responses.size()==0) {
			//If I am here, the list is empty, so I directly return the "response element" as initialized, which is null
			return response;
		}
		
		//If I am here, I got only one element, i return that one
		response = responses.get(0);
		return response;
	}

}
