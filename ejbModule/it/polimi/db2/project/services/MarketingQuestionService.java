package it.polimi.db2.project.services;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * This is used to create marketing questions of a product
 * 		(posterior product)
 * 
 * @author Samuele
 *
 */
@Stateless
public class MarketingQuestionService {
	/**
	 * JPA Entity Manager
	 */
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	/**
	 * This is used to create the marketing questions
	 * 
	 * @param questionText the test of the marketing question
	 * @param productId the id of the product the question is related to
	 */
	public void addMarketingQuestion(String questionText, Integer productId) {
		// TODO: to implement
		
		// TODO: to evaluate if it is good to have a class only for this!
		
	}
}
