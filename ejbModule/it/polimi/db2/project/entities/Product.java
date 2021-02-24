package it.polimi.db2.project.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;
/**
 * 
 * Entity class representing table "product"
 *
 */
@Entity
@Table(name = "product", schema = "db2_project")
/**
 * 
 * @NamedQueries TODO
 *
 */
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
	@Basic(fetch=FetchType.LAZY)
	@Lob
	private byte[] image;
	
	/**
	 * Description of the product
	 */
	@Column(columnDefinition = "varchar(200)", nullable = false)
	private String description;
	
	//----RELATIONS----
	
	/**
	 * Relationship with table "statistical_answer"
	 * One product has many (3) statistical answers. This is a One to Many relationship. Since the table represented by this entity 
	 * does not contain the FK (foreign key), this entity is NOT THE OWNER of the relationship. Once a product is removed, we want 
	 * also to remove all the related answers. Since we may not be immediately interested in the related answer, we can use LAZY 
	 * fetch type.
	 */
	@OneToMany(mappedBy = "product", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
	private List<StatisticalAnswer> statisticalAnswers;

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
	 * Getter method to retrieve the list of statistical answers
	 * @return
	 */
	public List<StatisticalAnswer> getStatisticalAnswers() {
		return statisticalAnswers;
	}

	/**
	 * Setter method to set the list of statistical answers
	 * @param statisticalAnswers
	 */
	public void setStatisticalAnswers(List<StatisticalAnswer> statisticalAnswers) {
		this.statisticalAnswers = statisticalAnswers;
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
	 * Method used to add a statistical answer to the list of statistical answers related to this product
	 */
	public void addStatisticalAnswer(StatisticalAnswer statisticalAnswer) {
		getStatisticalAnswers().add(statisticalAnswer);
	}
	
	/**
	 * Method used to remove a statistical answer to the list of statistical answers related to this product
	 */
	public void removeStatisticalAnswer(StatisticalAnswer statisticalAnswer) {
		getStatisticalAnswers().remove(statisticalAnswer);
	}
	
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
		getMarketingQuestions().add(marketingQuestion);
	}
	
	/**
	 * Method used to remove a marketing question
	 */
	public void removeMarketinQuestion(MarketingQuestion marketingQuestion) {
		getMarketingQuestions().remove(marketingQuestion);
	}
}