package it.polimi.db2.project.services;

import java.util.List;
import java.util.Map;

import javax.ejb.Remove;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.PersistenceException;

import org.eclipse.persistence.indirection.IndirectList;

import it.polimi.db2.project.entities.MarketingAnswer;
import it.polimi.db2.project.entities.MarketingQuestion;
import it.polimi.db2.project.entities.Offensive;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.entities.QuestionnaireResponse;
import it.polimi.db2.project.entities.StatisticalAnswer;
import it.polimi.db2.project.entities.User;
import it.polimi.db2.project.exceptions.ApplicationErrorException;
import it.polimi.db2.project.exceptions.InvalidActionException;
import it.polimi.db2.project.exceptions.InvalidAnswerException;
import it.polimi.db2.project.exceptions.NoProductOfTheDayException;
import it.polimi.db2.project.exceptions.ResponseException;

/**
 * Stateful EJB for the Questionnaire Response
 * It is needed to be Stateful because it needs to remember the answer until a Submit or 
 * 		a Cancel action is performed!
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
	User user;
	
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
		this.response = null; // init the response at null
	}
	
	
	
	/**
	 * To go in the statistical section (the section 1 and last one)
	 * 
	 * The client has to provide the answered marketing questions associated to the
	 * relative question!
	 * 
	 * @param marketingAnswers the marketing answers
	 */
	public void goToStatisticalSection(Map<Integer, String> marketingAnswers) {
		this.response.setMarketingAnswers(new IndirectList<>());
		
		for(Map.Entry<Integer, String> m : marketingAnswers.entrySet()) {
			MarketingAnswer ans = new MarketingAnswer();
			ans.setAnswer(m.getValue());
			ans.setQuestion(product.getMarketingQuestions().get(m.getKey()));
			this.response.addMarketingAnswer(ans);
		}
		
		this.section = 1;
	}
	
	/**
	 * To go to the marketing section (the section 0 and first one)
	 * 
	 * @param q1 the first statistical question: the age
	 * @param q2 the second statistical question: the sex
	 * @param q3 the third statistical question: the expertise level
	 */
	public void goToMarketingSection(Integer q1, Integer q2, Integer q3) {
		StatisticalAnswer ans = new StatisticalAnswer();
		ans.setQ1(q1);
		ans.setQ2(q2);
		ans.setQ3(q3);
		
		this.section = 0;
		this.response.setStatisticalAnswers(ans);
	}
	
	/**
	 * This method will check if in the submitted questionnaire there are some bad works
	 * @return true if there are bad words, false otherwise
	 */
	private boolean badWords() {
		// cycling for all the marketing answers
		for (MarketingAnswer marketingAnswer : this.response.getMarketingAnswers()) {
			/*
			 * Removing not letters
			 * putting all to lower case
			 * splitting in " " the answer
			 */
			String[] words = marketingAnswer.getAnswer()
					.replaceAll("[^a-zA-Z]+"," ") // regex to replace not words sequences with space
					.toLowerCase() //need to put in lower cases in order to perform check with the offensive words in the db
					.split(" ");
			
			// for all the words in the answer
			for(String word: words) {
				// checking if that word is an offensive one
				List<Offensive> offensive;
				try {
					offensive = em.createNamedQuery("Offensive.searchBadWord", Offensive.class)
							.setParameter(1, word).getResultList();
				}
				catch(IllegalArgumentException e) {
					// if problems
					// logging the problem in console
					System.out.println("Error while checking bad words!");
					// continue the cycle
					continue;
				}
				
				// if we have metched a bad word, returning true
				if(offensive.size() != 0)
					return true;
			}
		}
		
		/**
		 * if we arrive here it means no bad words have been found
		 */
		return false;
	}
	
	/**
	 * To submit the compiled questionnaire
	 * note:
	 * 		the submit button is in the "statistical" section, so, 
	 * 		we need to save the statistical answer before submitting!
	 * 
	 * @param q1 the first statistical question: the age
	 * @param q2 the second statistical question: the sex
	 * @param q3 the third statistical question: the expertise level
	 * @throws ResponseException if the response is not ready to be submitted
	 * @throws InvalidAnswerException if there are some invalid answers
	 * @throws ApplicationErrorException if there are problems with the query
	 */
	public void submit(Integer q1, Integer q2, Integer q3) throws ResponseException, InvalidAnswerException, ApplicationErrorException{
		// creating statistical answer
		StatisticalAnswer ans = new StatisticalAnswer();
		ans.setQ1(q1);
		ans.setQ2(q2);
		ans.setQ3(q3);
		
		// adding the statistical answers to the response
		this.response.setStatisticalAnswers(ans);
		
		// checking if no marketing answer submitted
		if(this.response.getMarketingAnswers() == null || this.response.getMarketingAnswers().isEmpty() 
				|| this.response.getMarketingAnswers().size() == 0)
			throw new InvalidAnswerException("Marketing Answers are mandatory!");
		
		/**
		 *  checking if all marketing answer submitted only one time
		 */
		// for all the question
		for (MarketingQuestion markQuest : this.product.getMarketingQuestions()) {
			int i = 0; // setting the counter to 0
			
			// for all the answers
			for (MarketingAnswer markAns: this.response.getMarketingAnswers()) {
				// if there is a not null answer
				if (markAns.getQuestion().getId() == markQuest.getId()
						&& markAns.getAnswer() != null && !markAns.getAnswer().equals(""))
					i++; // incrementing the counter
			}
			
			if(i != 1) // if not only one answer, throwing an exception
				throw new InvalidAnswerException("Marketing Answers are mandatory!");
		}
		
		/**
		 * Checking bad words
		 */
		if(this.badWords()) { // if we found bad words
			// block the user
			this.user.setBlocked(true); // update the user to blocked
			
			try {	
				// update the user
				em.merge(this.user); 
			}
			catch (IllegalArgumentException | PersistenceException e) {
				throw new ApplicationErrorException("Could not complete your request because of an application error!");
			}
			
			// block here the process.
			// and notify the user
			throw new ResponseException("You have inserted a bad word! You are blocked! You cannot fill any questionnaire anymore!");
		}
		
		// setted as submitted
		this.response.setSubmitted(true);
		
		// this will add this response to the product
		//	and update the opposite
		this.product.addQuestionnaireResponse(this.response);
		
		// persisting the response
		try {
			em.persist(this.response);
		}
		catch(PersistenceException | IllegalArgumentException e) {
			throw new ApplicationErrorException("There are problems while inserting the answer!");
		}
		
		// if all is fine, removing the response
		this.response = null;
	}
	
	/**
	 * To cancel the questionnaire.
	 * It will save the QuestionnaireResponse only,
	 * 		 marked as submitted = 0 and completed = 1
	 * The StatisticalAnswer(s) and the MarketingAnswer are lost.
	 * @throws ApplicationErrorException if problems with the insertion
	 */
	public void cancel() throws ApplicationErrorException {
		// cancelled, so answers to null
		this.response.setMarketingAnswers(null);
		this.response.setStatisticalAnswers(null);
		
		// setted as not submitted!
		this.response.setSubmitted(false);
		
		// this will add this response to the product
		//	and update the opposite
		this.product.addQuestionnaireResponse(this.response);
		
		// persisting the response
		try {			
			em.persist(this.response);
		}
		catch(PersistenceException | IllegalArgumentException e) {
			throw new ApplicationErrorException("There are problems while sending the performing the action!");
		}
		
		// setting the response equal to null
		this.response = null;
	}
	
	/**
	 * This method is called by the frontend when the user accesses the questionnaire form
	 * note: if no product of the day, an error is thrown
	 * 
	 * @param userId the Id of the user
	 * @throws NoProductOfTheDayException if there are no product of the day today
	 * @throws InvalidActionException if the user is performing an invalid action
	 * @throws ApplicationErrorException if there are problems in the application
	 */
	public Product startQuestionnaire(User user) throws NoProductOfTheDayException, InvalidActionException, ApplicationErrorException {
		// this is the new questionnaire created
		this.response = new QuestionnaireResponse();
		
		// retrieving the product of the day
		List<Product> retrieved_products;
		try {
			retrieved_products = em.createNamedQuery("Product.getProductOfTheDayToday", Product.class)
					.getResultList();
		}
		catch(IllegalArgumentException e) {
			throw new ApplicationErrorException("We are unable to serve your reqyest because of an application problem");
		}
		
		// if no product of the day, cannot continue!
		if (retrieved_products == null || retrieved_products.isEmpty() || retrieved_products.size() != 1) 
			throw new NoProductOfTheDayException("There are no product for today");
		
		// else getting the product of the day
		this.product = retrieved_products.get(0);
		
		// checking if already answered
		List<QuestionnaireResponse> responses;
		try {
			responses = em.createQuery(
					"SELECT r FROM Product p JOIN p.questionnaireResponses r WHERE p.id = ?1 AND r.user.id = ?2", 
					QuestionnaireResponse.class)
					.setParameter(1, this.product.getId())
					.setParameter(2, user.getId())
					.getResultList();
		}
		catch(IllegalArgumentException e) {
			throw new ApplicationErrorException("We are unable to serve your request because of an application problem");
		}
		
		if(responses != null && !responses.isEmpty() && responses.size() != 0)
			throw new InvalidActionException("You cannot submit the questionnaire two times! Wait next day!");
		
		// loading the marketing questions, fetched lazily
		this.product.getMarketingQuestions().size();
			
		this.response.setUser(user);
		
		this.user = user;
		
		// returning the product
		return this.product;
	}
	
	/**
	 * @return the section in which the user is
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
	 * @return the statistical responses
	 */
	public StatisticalAnswer getResponseStat() {
		return this.response.getStatisticalAnswers();
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
