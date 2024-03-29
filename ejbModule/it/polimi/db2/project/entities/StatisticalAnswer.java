package it.polimi.db2.project.entities;

import java.io.Serializable;

import javax.persistence.*;

/**
 * 
 * Entity class for the table "statistical_answer"
 *
 */
@Entity
@Table(name = "statistical_answer", schema="db2_project")
public class StatisticalAnswer implements Serializable{

	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	//----ATTRIBUTES----
	
	/**
	 * id of the statistical answer, primary key in the table
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	/**
	 * Age
	 */
	@Column(columnDefinition = "int", nullable = true)
	private Integer q1;
	
	/**
	 * Sex
	 */
	@Column(columnDefinition = "int", nullable = true)
	private Integer q2;
	
	/**
	 * Expertise Level
	 */
	@Column(columnDefinition = "int", nullable = true)
	private Integer q3;
	
	//----RELATIONSHIPS----
	
	/**
	 * Relationship with table "questionnaire_response"
	 * Many statistical answer, which are represented by only one entity belongs to a single questionnaire response. This is a 
	 * One to One relationship, and since the table represented by this entity is the one that contains the FK (foreign key), 
	 * this table is the OWNER of the relationship.
	 */
	@OneToOne
	@JoinColumn(name = "response_id", nullable = false)
	private QuestionnaireResponse questionnaireResponse;
	
	//----CONSTRUCTOOR----
	public StatisticalAnswer() {

	}
	
	//----GETTERS AND SETTERS----
	
	/**
	 * Getter method for the id of the statistical answer
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * Setter method for the id of the statistical answer
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Getter method to retrieve the answer to the "Age" of the statistical answer related to a product done by a user
	 * @return
	 */
	public Integer getQ1() {
		return this.q1;
	}

	/**
	 * Setter method to set the answer to the "Age" of the statistical answer related to a product done by a user
	 * @param q1
	 */
	public void setQ1(Integer q1) {
		this.q1 = q1;
	}

	/**
	 * Getter method to retrieve the answer to the "Sex" of the statistical answer related to a product done by a user
	 * @return
	 */
	public Integer getQ2() {
		return this.q2;
	}

	/**
	 * Setter method to set the answer to the "Sex" of the statistical answer related to a product done by a user
	 * @param q2
	 */
	public void setQ2(Integer q2) {
		this.q2 = q2;
	}

	/**
	 * Getter method to retrieve the answer to the "Expertise Level" of the statistical answer related to a product done by a user
	 * @return
	 */
	public Integer getQ3() {
		return this.q3;
	}

	/**
	 * Setter method to set the answer to the "Expertise Level" of the statistical answer related to a product done by a user
	 * @param q3
	 */
	public void setQ3(Integer q3) {
		this.q3 = q3;
	}

	/**
	 * Getter method used to retrieve the questionnaire response these statistical answers are about
	 * @return
	 */
	public QuestionnaireResponse getQuestionnaireResponse() {
		return questionnaireResponse;
	}

	/**
	 * Setter method to set the questionnaire response these statistical answers are about
	 * Protected because it must be called only by the entity QuestionnaireResponse to update the 
	 * 	counterpart of the relation
	 * @param questionnaireResponse
	 */
	protected void setQuestionnaireResponse(QuestionnaireResponse questionnaireResponse) {
		this.questionnaireResponse = questionnaireResponse;
	}
}