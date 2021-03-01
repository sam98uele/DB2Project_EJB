package it.polimi.db2.project.services;

import java.util.List;
import java.util.stream.Collectors;

import javax.ejb.Remove;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import it.polimi.db2.project.entities.MarketingAnswer;
import it.polimi.db2.project.entities.MarketingQuestion;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.entities.QuestionnaireResponse;
import it.polimi.db2.project.entities.StatisticalAnswer;
import it.polimi.db2.project.entities.User;
import it.polimi.db2.project.exceptions.InvalidActionException;
import it.polimi.db2.project.exceptions.InvalidAnswerException;
import it.polimi.db2.project.exceptions.NoProductOfTheDayException;
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
	 * The Id of the user who is compiling the questionnaire
	 */
	Integer userId;
	
	/**
	 * This is the response created by the user
	 */
	QuestionnaireResponse response;
	
	/**
	 * The product of the day
	 */
	Product product;
	
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
		this.response = new QuestionnaireResponse(); // this is the new questionnaire created
	}
	
	/**
	 * To go in the statistical section (the section 1 and last one)
	 * 
	 * The client has to provide the answered marketing questions associated to the
	 * relative question!
	 * 
	 * @param marketingAnswers the answers of the previous section
	 */
	public void goToStatisticalSection(List<MarketingAnswer> marketingAnswers) {
		this.section = 1;
		this.response.setMarketingAnswers(marketingAnswers);
	}
	
	/**
	 * To go to the marketing section (the section 0 and first one)
	 * 
	 * @param statisticalAnswer the answers of the previous section to temporarily save
	 */
	public void goToMarketingSection(StatisticalAnswer statisticalAnswer) {
		this.section = 0;
		this.response.setStatisticalAnswers(statisticalAnswer);
	}
	
	/**
	 * To submit the compiled questionnaire
	 * note:
	 * 		the submit button is in the "statistical" section, so, 
	 * 		we need to save the statistical answer before submitting!
	 * 
	 * @param statisticalAnswer the answer in the page!
	 * @throws ResponseException if the response is not ready to be submitted
	 * @throws InvalidAnswerException 
	 */
	public void submit(StatisticalAnswer statisticalAnswer) throws ResponseException, InvalidAnswerException{
		this.response.setStatisticalAnswers(statisticalAnswer);
		
		if(this.response.getMarketingAnswers() == null || this.response.getMarketingAnswers().isEmpty() 
				|| this.response.getMarketingAnswers().size() == 0)
			throw new InvalidAnswerException("Marketing Answers are mandatory!");
		
		// checking if the marketing questions are all answered
		for (MarketingQuestion marketingQuestion : this.product.getMarketingQuestions()) {
			int size = this.response.getMarketingAnswers().stream()
					.filter(a -> a.getQuestion().getId() == marketingQuestion.getId())
					.collect(Collectors.toList()).size();
			
			if(size != 1)
				throw new InvalidAnswerException("The Marketing Answare are mandatory! You must submit all of them!");
		}
		
		// the response will be submitted = 1 and completed = 0
		this.response.setCompleted(true);
		this.response.setSubmitted(true);
		
		// this will add this response to the product
		//	and update the opposite
		this.product.addQuestionnaireResponse(this.response);
		
		em.persist(this.response); //TODO: check if this could be avoided due to cascading!	
	}
	
	/**
	 * To cancel the questionnaire.
	 * It will save the QuestionnaireResponse only,
	 * 		 marked as submitted = 0 and completed = 1
	 * The StatisticalAnswer(s) and the MarketingAnswer are lost.
	 */
	public void cancel() {
		// cancelled, so answers to null
		this.response.setMarketingAnswers(null);
		this.response.setStatisticalAnswers(null);
		
		// completed but not submitted!
		this.response.setCompleted(true);
		this.response.setSubmitted(false);
		
		// this will add this response to the product
		//	and update the opposite
		this.product.addQuestionnaireResponse(this.response);
		
		// persisting the response
		em.persist(this.response);
	}
	
	/**
	 * This method is called by the frontend when the user accesses the questionnaire form
	 * note: if no product of the day, an error is thrown
	 * 
	 * @param userId the Id of the user
	 * @throws NoProductOfTheDayException 
	 * @throws InvalidActionException 
	 */
	public Product startQuestionnaire(User user) throws NoProductOfTheDayException, InvalidActionException {
		// retrieving the product of the day
		List<Product> retrieved_products = em.createNamedQuery("Product.getProductOfTheDayToday", Product.class)
				.getResultList();
		
		// if no product of the day, cannot continue!
		if (retrieved_products == null || retrieved_products.isEmpty() || retrieved_products.size() != 1) 
			throw new NoProductOfTheDayException();
		
		// else getting the product of the day
		this.product = retrieved_products.get(0);
		
		// checking if already answered
		List<QuestionnaireResponse> responses= em.createQuery(
				"SELECT r FROM Product p JOIN QuestionnaireResponse r WHERE p.id = ?1 AND r.user.id = ?2", 
				QuestionnaireResponse.class)
				.setParameter(1, this.product.getId())
				.setParameter(2, user.getId())
				.getResultList();
		
		if(responses == null || responses.isEmpty() || responses.size() != 0)
			throw new InvalidActionException("You cannot submit the questionnaire two times! Wait next day!");
		
		// loading the marketing questions, fetched lazily
		this.product.getMarketingQuestions().size();
			
		this.response.setUser(user);
		
		// returning the product
		return this.product;
	}
	
	/**
	 * To return the section the user is
	 */
	public Integer getSection() {
		return this.section;
	}
	
	/**
	 * @return the response
	 */
	public QuestionnaireResponse getResponse() {
		return this.response;
	}
	
	/**
	 * @return the product of the day this answer corresponds
	 */
	public Product getProduct() {
		return this.product;
	}
	
	/**
	 * It must be called to remove and destroy the Entity Manager.
	 */
	@Remove
	public void remove() {}
}
