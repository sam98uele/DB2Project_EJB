package it.polimi.db2.project.services;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.entities.QuestionnaireResponse;
import it.polimi.db2.project.exceptions.NoProductOfTheDayException;
import it.polimi.db2.project.exceptions.QueryException;

@Stateless
public class ProductUserService {
	/**
	 * JPA Entity Manager
	 * it is extended in order to let it live until the user calls the "remove" method.
	 */
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	/**
	 * This is needed to get the product of the day
	 * 
	 * @return the product of the day
	 * @throws NoProductOfTheDayException if there is no available product of the day to return
	 */
	public Product getProductOfTheDay() throws NoProductOfTheDayException {
		// today's date
		//Date date = Calendar.getInstance().getTime();
		//java.sql.Date dateSQL = new java.sql.Date(date.getTime());
		
		// date.toString();
		List<Product> prodList = null;
		
		/**
		 * Here we are retrieving the product of the day
		 */
		try {
			
			prodList = em.createNamedQuery("Product.getProductOfTheDayToday", Product.class)
					//.setParameter("date", dateSQL)
					.getResultList();
			
		}
		catch(IllegalStateException | PersistenceException e) {
			
			e.printStackTrace();
			throw new NoProductOfTheDayException("Unable to retrieve the product of the day.");
			
		}
		
		// if the product is not 1, then it means we do not have a product of the day to display
		if(prodList == null || prodList.isEmpty() || prodList.size() != 1)
			throw new NoProductOfTheDayException("The number of product of that day is not 1");
		
		// if here we are sure to have the product of the day "not null" and that is unique
		//	thanks to the exceptions
		
		Product prodDay = prodList.get(0);
		
		return prodDay;
	}
	
	/**
	 * Method used to retrieve the list of reviews of a product, in order to be shown together in the front end with the 
	 * product of the day. N.B.: there are two cases in which the returned list is null:
	 *    1) no one has reviewed the product yet;
	 *    2) everyone who reviewed the product, canceled the questionnaire (= did not submitted it), and therefore that answer must
	 *       not be shown to the common user.
	 * @return list of Questionnaire Responses
	 * @throws NoProductOfTheDayException if there is an error generated by retrieving the product of the day
	 * @throws QueryException when unable to retrieve the product of the day
	 */
	public List<QuestionnaireResponse> getReviewsOfTheProductOfTheDay(Integer userId) throws NoProductOfTheDayException, QueryException {
		
		/**
		 * Initializing the list as null
		 */
		List<QuestionnaireResponse> temporaryList = null;
		
		/**
		 * Setting a temporary product in order to perform a named query
		 */
		Product prodDay = null;
		try {
			prodDay = getProductOfTheDay();
		}catch(NoProductOfTheDayException e) {
			e.printStackTrace();
		}
		
		/**
		 * We have a single product for sure, otherwise we would have thrown the exceptions, and we want to retrieve all the related 
		 * answers by users. The answer by a user is composed from the statistical answers and the marketing answer, but there is no 
		 * need to retrieve them: the fetch type of the statistical answer is eager by default since is an object, and the statistical 
		 * answer of the collection of marketing answers is set by default as EAGER from the code, hence when we retrieve the 
		 * questionnaire responses, we are retrieving all the pending items. Now we need to perform a query. What will be returned?
		 * the list of SUBMITTED questionnaire response (without the "canceled" ones, because a normal user has no permission to 
		 * see it). The list will be null if:
		 *    1) no one reviewed the product (nor submitted nor canceled)
		 *    2) no one submitted the questionnaire (just canceled ones)
		 */
		try {
			
			//this query retrieves a list of questionnaire responses correlated to the product passed as parameter.
			//in the named query is checked that "submitted=1" => not canceled.
			temporaryList = em.createNamedQuery("QuestionnaireResponse.SubmittedQuestionnaireOfProductExceptSpecifiedUser", 
					QuestionnaireResponse.class)
					.setParameter("productOfTheDay", prodDay.getId())
					.setParameter("submitted", true)
					.setParameter("userId", userId)
					.getResultList();
			
		}catch(IllegalStateException | PersistenceException e) {
			
			e.printStackTrace();
			throw new QueryException("Unable to retrieve submitted quastionnaires relative to product with id = "+
					prodDay.getId()+".");
			
		}
		
		/**
		 * Returning the list
		 */
		return temporaryList;
	}
}