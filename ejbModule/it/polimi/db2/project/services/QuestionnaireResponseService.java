package it.polimi.db2.project.services;

import java.util.List;

import javax.ejb.Init;
import javax.ejb.Remove;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import it.polimi.db2.project.exceptions.ResponseException;

/**
 * Stateful EJB for the Questionnaire Response
 * It is needed to be Stateful because it needs to remember the answer until a Submit or 
 * 		a Cancel action is performed!
 * 
 * @author Samuele
 *
 */
@Stateful
public class QuestionnaireResponseService {
	/**
	 * JPA Entity Manager
	 * it is extended in order to let it live until the user calls the "remove" method.
	 */
	@PersistenceContext(unitName = "DB2Project_EJB", type = PersistenceContextType.EXTENDED)
	private EntityManager em;
	
	/**
	 * This is the response created by the user
	 */
	QuestionnaireResponse response;
	
	/**
	 * The product of the day
	 */
	Product product;
	
	/**
	 * The list of marketing questions related to the product of the day
	 */
	List<MarketingQuestion> marketingQuestions;
	
	/**
	 * The list of fixed questions
	 */
	List<MarketingAnswer> marketingAnswer;
	
	/**
	 * The statistical answer
	 */
	StatisticalAnswer statisticalAnswer;
	
	/**
	 * The section the user is currently in:
	 * 		0 -> the marketing section
	 * 		1 -> the statistical section
	 */
	Integer section;
	
	/**
	 * Default Constructor
	 */
	public QuestionnaireResponseService() {
		this.section = 0; // by default the user enters in the marketing section
	}
	
	/**
	 * To go in the statistical section (the section 1 and last one)
	 * 
	 * @param marketingAnswers the answers of the previous section to temporarily save
	 */
	public void goToStatisticalSection(List<MarketingAnswers> marketingAnswers) {
		this.section = 1;
		// TODO: is is ok performed with this action?
		this.marketingAnswer = marketingAnswers;
	}
	
	/**
	 * To go to the marketing section (the section 0 and first one)
	 * 
	 * @param statisticalAnswer the answers of the previous section to temporarily save
	 */
	public void goToMarketingSection(StatisticalAnswer statisticalAnswer) {
		this.section = 0;
		// TODO: is it ok?
		this.statisticalAnswer = statisticalAnswer;
	}
	
	/**
	 * To submit the compiled questionnaire
	 * note:
	 * 		the submit button is in the "statistical" section, so, 
	 * 		we need to save the statistical answer before submitting!
	 * 
	 * @param statisticalAnswer the answer in the page!
	 * @throws ResponseException if the response is not ready to be submitted
	 */
	public void submit(StatisticalAnswer statisticalAnswer) throws ResponseException{
		this.statisticalAnswer = statisticalAnswer;
		// this will submit all
		//	the response and all the marketing answer and fixed questions answer
		//	the response will be submitted = 1 and completed = 0
	}
	
	/**
	 * To cancel the questionnaire.
	 * It will save the QuestionnaireResponse only,
	 * 		 marked as submitted = 0 and completed = 1
	 * The StatisticalAnswer(s) and the MarketingAnswer are lost.
	 */
	public void cancel() {
		// this will save the QuestionnaireResponse only. marked as submitted = 0 and completed = 1
		//	the StatisticalAnswer and the MarketingAnswer are lost.
	}
	
	/**
	 * This method is called by the frontend when the user accesses the questionnaire form
	 *		if a questionnaire is already submitted or cancelled, an error is displayed
	 *		if a questionnaire is not submitted or cancelled, 
	 *			and if the response object is null, a new response is created
	 *			and if the response is not null, the response is modified
	 * note: the product of the day is to be retrieved, if no product of the day, an error is thrown
	 * 
	 * @param userId the Id of the user
	 */
	public void init(Integer userId) {
		// TODO: to implement
		//			this will 
	}
	
	/**
	 * It must be called to remove and destroy the Entity Manager.
	 */
	@Remove
	public void remove() {}
}
