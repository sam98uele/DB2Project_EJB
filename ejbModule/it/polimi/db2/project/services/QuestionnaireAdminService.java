package it.polimi.db2.project.services;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.openjpa.persistence.PersistenceException;
import org.joda.time.DateTimeComparator;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.entities.QuestionnaireResponse;
import it.polimi.db2.project.entities.User;
import it.polimi.db2.project.exceptions.InvalidActionException;
import it.polimi.db2.project.exceptions.ProductException;
import it.polimi.db2.project.exceptions.QueryException;

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
	 * This is used to erase all the questionnaire data related to a specific product
	 * note that all the responses are erased and the points of the users are removed by triggers (TODO: triggers)
	 * @param productId the Id of the product to erase all it's questionnaire data. 
	 * @throws InvalidActionException if the id of the product passed to this method is an ID relative to a product which is 
	 * more recent than the current date (product date need to be lower than the current one, neither equal!).
	 * @throws ProductException when not able to retrieve the product with id equal to the parameter productId
	 */
	public void deleteQuestionnaires(Integer productId) throws InvalidActionException, ProductException{
		
		/**
		 * Initializing the date before retrieving it with a query;
		 */
		Date dateOfTheProduct = null;
		
		/**
		 * Retrieving the product via entity manager
		 */
		Product p = null;
		
		try {
			
			p = em.find(Product.class, productId);
		}catch(IllegalArgumentException e) {
			
			e.printStackTrace();
			throw new ProductException("Unable to retrieve the product relative. Error trying to perform find method.");
		}
		
		/**
		 * Checking that we were able to actually retrieve the product by id, otherwise we need to raise an exception because 
		 * we cannot proceed. If the entity instance is not found is returned "null".
		 */
		if(p == null) {
			throw new ProductException("Product with id = "+productId+" not existing!");
		}
		
		/**
		 * If we are here, then the retrieving of a product has been correctly done, we can assign the date
		 */
		dateOfTheProduct = p.getDate();
		
		/**
		 * Retrieving the date of today
		 */
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
			 * If we are here, we can perform the deletion, we just need to set as null the list of questionnaire responses, and 
			 * settings of the relationship will do the rest, and will delete all the children (triggers will perform subtraction 
			 * of points). This will be scheduled for update in the database
			 */
			p.setQuestionnaireResponses(null);
		}else {
			
			/**
			 * If we are here, the date is either today, or a date after today, we need to throw an exception in order to inform 
			 * the front end that the operation failed because of the product id selected
			 */
			throw new InvalidActionException("You cannot remove the questionnaires of this product, this is caused by a product "
					+ "scheduled as product of the day either today, or in the future.");
		}
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
	 * @throws QueryException when unable to perform the named query
	 */
	public List<User> getListUserCompiledQuestionnaire(Integer productID, boolean subOrCanc) throws QueryException{
		
		/**
		 * Initializing a temporary list of users.
		 */
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
			
			users = em.createNamedQuery("QuestionnaireResponse.GetUsersWhoCompiledQuestionnaireGivenParameterSubmitted", 
					User.class)
					.setParameter("idOfTheProduct", productID)
					.setParameter("submitted", subOrCanc)
					.getResultList();
			
		}catch(IllegalStateException | PersistenceException e) {
			
			e.printStackTrace();
			throw new QueryException("Unable to return the users who compiled the questionnaire of the product with id = "+
					productID +" and parameter submitted = "+ String.valueOf(subOrCanc) );
		}
		
		/**
		 * Returning the list of users
		 */
		return users;
	}
	
	/**
	 * This method retrieve all the questionnaire responses answered by a specific user chosen at front end by the administrator.
	 * The questionnaire retrieved could be both submitted or cancelled. N.B.: the list returned could be null, need to be 
	 * checked at front end
	 * @param userID is the user of which you want to retrieve the questionnaires
	 * @param productID is the product from which you want to retrieve the questionnaire
	 * @return return the list of questionnaire response submitted by the user, them could be both submitted or cancelled, they 
	 * are not filtered, they are returned as they are. The returned list could be null
	 * @throws QueryException if unable to retrieve questionnaire answered by a specific user while calling the named query
	 */
	public List<QuestionnaireResponse> getAllQuestionnaireAnsweredBySpecificUserAndProduct(Integer userID, Integer productID) throws QueryException {
		
		/**
		 * Initializing a temporary list. This list will be filled by the query
		 */
		List<QuestionnaireResponse> responses = null;
		
		/**
		 * We need to query the database retrieving all the questionnaireResponses responded by a specific user.
		 */
		try {
			
			/**
			 * The following query is a named query which retrieve all the questionnaire responses answered to the specific user 
			 * passed as parameter, named userID, and about a specific product given its id passed as parameter productID to 
			 * this method.
			 */
			responses = em.createNamedQuery("QuestionnaireResponse.GetQuestionnaireAnsweredBySpecificUserAndProduct",
						QuestionnaireResponse.class)
					.setParameter("userID", userID)
					.setParameter("productID", productID)
					.getResultList();
			
		}catch(IllegalStateException | PersistenceException e) {
			
			e.printStackTrace();
			throw new QueryException("Unable to return questionnaire responded by user with id = "+userID+" and about the "
					+ "product with id ="+productID);
			
		}
		
		/**
		 * Returning the list of responses
		 */
		return responses;
	}
	
	/**
	 * This method will return list of past schedule of the product of the day.
	 * Date will be less than current date.
	 * @return list of product scheduled in the past (N.B.: check the list because could be null if there are no past schedule)
	 */
	public List<Product> getPastScheduledProductOfTheDay() throws QueryException{
		
		/**
		 * Initializing list of product of the day
		 */
		List<Product> pastSchedule = null;
		
		/**
		 * The following query is a named query which retrieve all the products which has a date in which they will be product of 
		 * the day less than the current date (only less then, not equal)
		 */
		try {
			pastSchedule = em.createNamedQuery("Product.getPastProductOfTheDay", Product.class)
					.getResultList();
		}catch(IllegalStateException | PersistenceException e) {
			
			e.printStackTrace();
			throw new QueryException("Unable to retrieve past product of the day");
		}
		/**
		 * Returning product of the day
		 */
		return pastSchedule;
	}
}