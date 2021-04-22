package it.polimi.db2.project.entities;

import java.io.Serializable;

import javax.persistence.*;

/**
 * 
 * Entity representing the table "marketing_answer", answers to the specific question of the product
 *
 */
@Entity
@Table(name = "marketing_answer", schema = "db2_project")
public class MarketingAnswer implements Serializable{

	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	//----ATTRIBUTES----
	
	/**
	 * Id of the answer
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	/**
	 * Specific answer text
	 */
	@Column(columnDefinition = "varchar(200)", nullable = false)
	private String answer;
	
	//----RELATIONSHIPS----
	
	/**
	 * Relationship with "questionnaire_response table":
	 * Many marketing answers belong to one single questionnaire response. This is a relationship Many to One. Since the table 
	 * represented by this entity contains the FK (foreign key), this entity is the OWNER of the relationship.
	 */
	@ManyToOne
	@JoinColumn(name = "response_id", nullable = false)
	private QuestionnaireResponse questionnaireResponse;
	
	/**
	 * Relationship with table "marketing_questions".
	 * Many marketing answers belongs to one single marketing question (one answer per each user who responded). This relationship 
	 * is a Many to One relationship. Since the table represented by this entity contains the FK (foreign key), this entity is the 
	 * owner of the relationship.
	 */
	@ManyToOne
	@JoinColumn(name = "question_id", nullable = false)
	private MarketingQuestion question;
	
	//----GETTERS AND SETTERS----
	
	/**
	 * Getter method for the id of the single marketing answer
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * Setter method for the id of the single marketing answer
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Getter method for the single answer text
	 * @return
	 */
	public String getAnswer() {
		return answer;
	}
	
	/**
	 * Setter method for the single answer text
	 * @param answer
	 */
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	/**
	 * Getter method to retrieve the questionnaire response to which this specific question answer belongs
	 * @return
	 */
	public QuestionnaireResponse getQuestionnaireResponse() {
		return questionnaireResponse;
	}

	/**
	 * Setter method to set the questionnaire response to which this specific question answer belongs
	 * @param questionnaireResponse
	 */
	public void setQuestionnaireResponse(QuestionnaireResponse questionnaireResponse) {
		this.questionnaireResponse = questionnaireResponse;
	}

	/**
	 * Getter method to retrieve the question to which this answer is relative
	 * @return
	 */
	public MarketingQuestion getQuestion() {
		return question;
	}

	/**
	 * Setter method to set the question to which this answer is relative
	 * @param question
	 */
	public void setQuestion(MarketingQuestion question) {
		this.question = question;
	}

}
