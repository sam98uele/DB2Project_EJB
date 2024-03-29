package it.polimi.db2.project.entities;

import java.io.Serializable;
import java.util.*;

import javax.persistence.*;

import org.eclipse.persistence.indirection.IndirectList;
/**
 * 
 * Entity class representing table "product"
 *
 */
@Entity
@Table(name = "product", schema = "db2_project")
@NamedQueries({ 
	// used to get the product of a day
	@NamedQuery(name = "Product.getProductOfTheDay", query = "SELECT p FROM Product p WHERE p.date = :date"),
	// used to get the product of the current day
	@NamedQuery(name = "Product.getProductOfTheDayToday", query = "SELECT p FROM Product p WHERE p.date = CURRENT_DATE"),
	// used to retrieve the products of the past day w.r.t. the current one
	@NamedQuery(name = "Product.getPastProductOfTheDay", query = "SELECT p FROM Product p WHERE p.date < CURRENT_DATE ORDER BY p.date DESC")
})
public class Product implements Serializable{
	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	//----ATTRIBUTES----
	
	/**
	 * Id of the product, primary key in the table
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	/**
	 * Name of the product
	 */
	@Column(columnDefinition = "varchar(45)", nullable = false)
	private String name;
	
	/**
	 * Date in which this product will be the product of the day
	 */
	@Temporal(TemporalType.DATE)
	@Column(nullable = false)
	private Date date;
	
	/**
	 * Photo associated to the product
	 */
	@Lob
	@Column(nullable = false)
	@Basic(fetch=FetchType.LAZY)
	private byte[] image;
	
	/**
	 * Description of the product
	 */
	@Column(columnDefinition = "varchar(200)")
	private String description;
	
	//----RELATIONSHIPS----

	/**
	 * Relationship with table "questionnaire_response"
	 * One product has many questionnaire responses (one per each user who responded to the questionnaire). This is a One to Many 
	 * relationship. Since the table represented by this entity does not contain the FK (foreign key), this entity is NOT THE OWNER 
	 * of the relationship. Once a product is removed, we also want to remove all the related questionnaire responses, and since we 
	 * may not be immediately interested in the related answer, we can use LAZY fetch type.
	 */
	@OneToMany(mappedBy = "product", fetch= FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
	private List<QuestionnaireResponse> questionnaireResponses;
	
	/**
	 * Relationship with table "marketing_questions"
	 * One product has many marketing questions. This is a One to Many relationship. Since the table represented by this entity does 
	 * not contain the FK (foreign key), this entity is NOT THE OWNER of the relationship. Once a product is removed, we also want 
	 * to remove all the related marketing questions, and since we may not be immediately interested in the related answer, we can 
	 * use LAZY fetch type.
	 */
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
	@OrderBy("ordering ASC")
	private List<MarketingQuestion> marketingQuestions;
	
	// ---- CONSTRUCTORS
	
	/**
	 * Default Constructor
	 */
	public Product() {
	
	}
	
	/**
	 * Constructor for the Entity
	 * @param name
	 * @param date
	 * @param image
	 * @param description
	 */
	public Product(String name, Date date, byte[] image, String description) {
		this.name = name;
		this.date = date;
		this.image = image;
		this.description = description;
		this.marketingQuestions = new IndirectList<>();
	}
	
	
	//----GETTERS AND SETTERS----

	/**
	 * Getter method for the id of the product (primary key in the table)
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * Setter method for the id of the product (primary key in the table)
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Getter method to retrieve the name of the product
	 * @return
	 */
	public String getName() {
		return name;
	}

	/**
	 * Setter method to set the name of the product
	 * @param name
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Getter method to retrieve the date in which the product will be "product of the day"
	 * @return
	 */
	public Date getDate() {
		return date;
	}

	/**
	 * Setter method to set the date in which the product will be "product of the day"
	 * @param date
	 */
	public void setDate(Date date) {
		this.date = date;
	}

	/**
	 * Getter method to retrieve the image of the product
	 * @return
	 */
	public byte[] getImage() {
		return image;
	}
	
	/**
	 * Get the base64 of the image
	 * @return
	 */
	public String getImageData() {
		return Base64.getMimeEncoder().encodeToString(image);
	}

	/**
	 * Setter method used to set the image of the product
	 * @param image
	 */
	public void setImage(byte[] image) {
		this.image = image;
	}

	/**
	 * Getter method used to get the description of the product
	 * @return
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * Setter method used to set the description of the product
	 * @param description
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Getter method to retrieve the questionnaire responses related to this product
	 * @return
	 */
	public List<QuestionnaireResponse> getQuestionnaireResponses() {
		return questionnaireResponses;
	}

	/**
	 * Setter method to set the questionnaire responses related to this product
	 * @param questionnaireResponses
	 */
	public void setQuestionnaireResponses(List<QuestionnaireResponse> questionnaireResponses) {
		if((questionnaireResponses != null) && (!questionnaireResponses.isEmpty())) { //if the list I'm setting is not an empty one
			for(QuestionnaireResponse i: questionnaireResponses) {
				i.setProduct(this); //updating the counterpart
			}
		}
		this.questionnaireResponses = questionnaireResponses;
	}

	/**
	 * Getter method to retrieve the marketing questions related to this product
	 * @return
	 */
	public List<MarketingQuestion> getMarketingQuestions() {
		return marketingQuestions;
	}

	/**
	 * Setter method used to retrieve the marketing questions related to this product
	 * @param marketingQuestions
	 */
	public void setMarketingQuestions(List<MarketingQuestion> marketingQuestions) {
		if((marketingQuestions != null) && (!marketingQuestions.isEmpty())) { //if I'm not setting an empty list
			for(MarketingQuestion i: marketingQuestions) {
				i.setProduct(this);
			}
		}
		this.marketingQuestions = marketingQuestions;
	}
	
	//----ADDERS - REMOVERS----
	
	/**
	 * Method used to add a questionnaire response to this product
	 */
	public void addQuestionnaireResponse(QuestionnaireResponse questionnaireResponse) {
		questionnaireResponse.setProduct(this); //updating the counterpart
		getQuestionnaireResponses().add(questionnaireResponse);
	}
	
	/**
	 * Method used to remove a questionnaire response to this product
	 */
	public QuestionnaireResponse removeQuestionnaireResponse(QuestionnaireResponse questionnaireResponse) {
		getQuestionnaireResponses().remove(questionnaireResponse);
		questionnaireResponse.setProduct(null);
		return questionnaireResponse;
	}
	
	/**
	 * Method used to add a marketing question
	 */
	public void addMarketingQuestion(MarketingQuestion marketingQuestion) {
		// setting the product equal to this one to the marketing question
		marketingQuestion.setProduct(this);
		// adding the marketing question
		getMarketingQuestions().add(marketingQuestion);
	}
	
	/**
	 * Method used to remove a marketing question
	 */
	public MarketingQuestion removeMarketinQuestion(MarketingQuestion marketingQuestion) {
		getMarketingQuestions().remove(marketingQuestion);
		marketingQuestion.setProduct(null);
		return marketingQuestion;
	}
}