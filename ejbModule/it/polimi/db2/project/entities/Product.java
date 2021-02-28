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
	@NamedQuery(name = "Product.getProductOfTheDay", query = "SELECT p FROM Product p where p.date = :date")
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
	// @Basic(fetch=FetchType.LAZY) // TODO: REMOVED BECAUSE IT IS ALWAYS NEEDED WITH THE IMAGE
	@Lob
	@Column(nullable = false)
	private byte[] image;
	
	/**
	 * Description of the product
	 */
	@Column(columnDefinition = "varchar(200)")
	private String description;
	
	//----RELATIONS----

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
		this.marketingQuestions = new IndirectList<MarketingQuestion>();
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
		this.marketingQuestions = marketingQuestions;
	}
	
	//----ADDERS - REMOVERS----
	
	/**
	 * Method used to add a questionnaire response to this product
	 */
	public void addQuestionnaireResponse(QuestionnaireResponse questionnaireResponse) {
		getQuestionnaireResponses().add(questionnaireResponse);
	}
	
	/**
	 * Method used to remove a questionnaire response to this product
	 */
	public void removeQuestionnaireResponse(QuestionnaireResponse questionnaireResponse) {
		getQuestionnaireResponses().remove(questionnaireResponse);
	}
	
	/**
	 * Method used to add a marketing question
	 */
	public void addMarketingQuestion(MarketingQuestion marketingQuestion) {
		// adding the marketing question
		getMarketingQuestions().add(marketingQuestion);
		
		// setting the product equal to this one to the marketing question
		marketingQuestion.setProduct(this);
	}
	
	/**
	 * Method used to remove a marketing question
	 */
	public void removeMarketinQuestion(MarketingQuestion marketingQuestion) {
		getMarketingQuestions().remove(marketingQuestion);
	}
}