package it.polimi.db2.project.entities;

import java.io.Serializable;
import java.util.List;
import javax.persistence.*;
import org.eclipse.persistence.indirection.IndirectList;
import it.polimi.db2.project.comparator.CompareMarketingAnswer;

/**
 * 
 * Entity class for the table "questionnaire_response". the questionnaire_response need to be intended as the response of the user 
 * to the whole questionnaire relative to a specific product.
 *
 */
@Entity
@Table(name = "questionnaire_response", schema="db2_project")
@NamedQueries({
	// used to display responses on User Homepage
	@NamedQuery(name = "QuestionnaireResponse.SubmittedQuestionnaireOfProductExceptSpecifiedUser", 
				query = "SELECT r FROM QuestionnaireResponse r WHERE r.product.id = :productOfTheDay and r.submitted = :submitted and r.user.id <> :userId"),
	// used by Admin Product Inspection
	@NamedQuery(name = "QuestionnaireResponse.UsersWhoCompiledQuestionnaires",
				query = "SELECT r.user FROM QuestionnaireResponse r WHERE r.product.id = :idOfTheProduct and "
						+ "r.submitted = :submitted"),
	// used by Admin Product Inspection
	@NamedQuery(name = "QuestionnaireResponse.RetrieveSpecificQuestionnaire",
		query = "SELECT r FROM QuestionnaireResponse r WHERE r.user.id = :userID and r.product.id = :productID")
})
public class QuestionnaireResponse implements Serializable{
	
	/**
	 * Default serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	//----ATTRIBUTES----
	
	/**
	 * Primary key of the questtionaire_response table
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	/**
	 * Flag needed to remember if the questionnaire has been submitted or canceled.
	 * "0" means that the questionnaire has been canceled;
	 * "1" means that the questionnaire has been submitted
	 */
	@Column(nullable = false)
	private boolean submitted;
	
	//----RELATIONSHIPS----
	
	/**
	 * Relationship with table "user"
	 * One User can respond to many questionnaires, hence is a Many to One relationship. Since the foreign key is in the table 
	 * represented by this entity, this entity is the OWNER of the relationship.
	 * This does not have a counterpart in MarketingQuestion because it is not needed and it is useless:
	 * 	the relation is never used in the other way.
	 */
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	
	/**
	 * Relationship with table "statistical_answer"
	 * A questionnaire contains many (in this case 3) statistical answers, which are represented in only one entity. 
	 * This is a One to One relationship. Since the FK is contained in the entity representing the statistical_answer table, 
	 * this is NOT THE OWNER of the relationship. Since we may not be interested immediately to the actual answers, the fetch type 
	 * is lazy. If we remove the questionnaire, answers need to be removed.
	 */
	@OneToOne(mappedBy = "questionnaireResponse", orphanRemoval = true, cascade = CascadeType.ALL)
	private StatisticalAnswer statisticalAnswers;
	
	/**
	 * Relationship with table "marketing_answer"
	 * A questionnaire contains many marketing answers. This is a One to Many relationship. Since the FK is contained in the 
	 * entity representing the marketing_answer table, this is NOT THE OWNER of the relationship. Since generally we need the 
	 * marketing answer, it is convenient to put the fetch type as EAGER. If we remove the questionnaire, answers need to be removed.
	 */
	@OneToMany(mappedBy = "questionnaireResponse", fetch = FetchType.EAGER, orphanRemoval = true, cascade = CascadeType.ALL)
	private List<MarketingAnswer> marketingAnswers;
	
	/**
	 * Relationship with table "product"
	 * A product has many questionnaire responses (one per every user who responded). This is a Many to One relationship. Since the 
	 * foreign key is in the table represented by this entity, this entity is the OWNER of the relationship.
	 */
	@ManyToOne
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;
	
	//--- CONSTRUCTOR ----
	public QuestionnaireResponse() {
		this.marketingAnswers = new IndirectList<>();
		this.statisticalAnswers = new StatisticalAnswer();
	}
	
	
	//----GETTERS AND SETTERS----
	
	/**
	 * Getter method for the primary key of the response to the questionnaire response
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * Setter method for the primary key of the response to the questionnaire response
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Getter method for the flag "submitted".
	 * Remember that:
	 * "0" means that the questionnaire has been canceled;
	 * "1" means that the questionnaire has been submitted
	 * @return
	 */
	public boolean isSubmitted() {
		return submitted;
	}
	
	/**
	 * Setter method for the flag "submitted".
	 * Remember that:
	 * "0" means that the questionnaire has been canceled;
	 * "1" means that the questionnaire has been submitted
	 * @param submitted
	 */
	public void setSubmitted(boolean submitted) {
		this.submitted = submitted;
	}
	
	/**
	 * Getter method for the user who responded to the questionnaire
	 * @return
	 */
	public User getUser() {
		return user;
	}

	/**
	 * Setter method in order to set which user responded to the questionnaire
	 * @param user
	 */
	public void setUser(User user) {
		this.user = user;
	}

	/**
	 * Getter method for getting the statistical answers (constant ones) of the user to the questionnaire relative to a specific
	 * product.
	 * @return
	 */
	public StatisticalAnswer getStatisticalAnswers() {
		return statisticalAnswers;
	}

	/**
	 * Setter method for setting the statistical answers (mandatory ones) of the user to the questionnaire relative to a specific
	 * product.
	 * It will also update the other hand of the relation
	 * @param statisticalAnswers
	 */
	public void setStatisticalAnswers(StatisticalAnswer statisticalAnswers) {
		if(statisticalAnswers != null)
			statisticalAnswers.setQuestionnaireResponse(this); // update the other part of the relation
		this.statisticalAnswers = statisticalAnswers;
	}

	/**
	 * Getter method for getting the marketing answers (changing for every product) of the user to the specific product 
	 * questionnaire.
	 * @return
	 */
	public List<MarketingAnswer> getMarketingAnswers() {
		return marketingAnswers;
	}
	
	/**
	 * Setter method for setting the marketing answers (changing for every product) of the user to the specific product 
	 * questionnaire.
	 * It will also update the other hand of the relation
	 * @param marketingAnswers
	 */
	public void setMarketingAnswers(List<MarketingAnswer> marketingAnswers) {
		if((marketingAnswers != null) && (!marketingAnswers.isEmpty())) {
			for(int i = 0; i<marketingAnswers.size(); i++)
				marketingAnswers.get(i).setQuestionnaireResponse(this); // updating the counterpart
		}
		this.marketingAnswers = marketingAnswers;
	}
	
	/**
	 * Getter method to retrieve the product of which the questionnaire is about
	 * @return
	 */
	public Product getProduct() {
		return product;
	}

	/**
	 * Setter method to set the product of which the questionnaire is about
	 * Protected because it must be called only by the entity Product to update the 
	 * 	counterpart of the relation
	 * @param product
	 */
	protected void setProduct(Product product) {
		this.product = product;
	}
	
	//---- ADDERS - REMOVERS----	
	/**
	 * Method used to add a marketing answer response to the list of marketing answer responses
	 * It will update also the other hand of the relation
	 * @param marketingAnswer
	 */
	public void addMarketingAnswer(MarketingAnswer marketingAnswer) {
		marketingAnswer.setQuestionnaireResponse(this);
		getMarketingAnswers().add(marketingAnswer);
	}
	
	/**
	 * Method used to remove marketing answer response to the list of marketing answer responses
	 * @param marketingAnswer
	 */
	public MarketingAnswer removeMarketingAnswer(MarketingAnswer marketingAnswer) {
		getMarketingAnswers().remove(marketingAnswer);
		marketingAnswer.setQuestionnaireResponse(null);
		return marketingAnswer;
	}
	
	/**
	 * @return the response given the id
	 * @param id is the id of the index of the response to return
	 */
	public String getResponseMarketingById(int id) {
		if(id < getMarketingAnswers().size()) {
			return getMarketingAnswers().get(id).getAnswer();
		}else {
			return "";
		}
	}
	
	/**
	 * This will return the marketing answers ordered by the Order of the marketing question
	 * decided by the Admin when inserting the Question
	 * 
	 * @return the list of marketing answers ordered by question order
	 */
	public List<MarketingAnswer> getOrderedMarketingAnswers(){
		List<MarketingAnswer> ma = new IndirectList<>(this.marketingAnswers);

		ma.sort(new CompareMarketingAnswer());
	    
	    return ma;
	}
}
