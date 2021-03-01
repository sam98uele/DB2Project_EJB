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
/**
 * 
 * @NamedQueries TODO
 *
 */
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
	 * Recorded response to question 1. can be nullable if optional
	 */
	private int q1;
	
	/**
	 * Recorded response to question 2
	 */
	private int q2;
	
	/**
	 * Recorded response to question 3
	 */
	private int q3;
	
	//----RELATIONS----
	
	/**
	 * Relationship with table "questionnaire_response"
	 * Many statistical answer belongs to a single questionnaire response. This is a Many to one relationship, and since  the table 
	 * represented by this entity is the one that contains the FK (foreign key), this table is the OWNER of the relationship.
	 */
	@OneToOne
	@JoinColumn(name = "response_id", nullable = false)
	private QuestionnaireResponse questionnaireResponse;
	
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
	 * Getter method to retrieve the answer to the first question of the statistical answer related to a product done by a user
	 * @return
	 */
	public int getQ1() {
		return q1;
	}

	/**
	 * Setter method to set the answer to the first question of the statistical answer related to a product done by a user
	 * @param q1
	 */
	public void setQ1(int q1) {
		this.q1 = q1;
	}

	/**
	 * Getter method to retrieve the answer to the second question of the statistical answer related to a product done by a user
	 * @return
	 */
	public int getQ2() {
		return q2;
	}

	/**
	 * Setter method to set the answer to the second question of the statistical answer related to a product done by a user
	 * @param q2
	 */
	public void setQ2(int q2) {
		this.q2 = q2;
	}

	/**
	 * Getter method to retrieve the answer to the third question of the statistical answer related to a product done by a user
	 * @return
	 */
	public int getQ3() {
		return q3;
	}

	/**
	 * Setter method to set the answer to the third question of the statistical answer related to a product done by a user
	 * @param q3
	 */
	public void setQ3(int q3) {
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
	 * @param questionnaireResponse
	 */
	public void setQuestionnaireResponse(QuestionnaireResponse questionnaireResponse) {
		this.questionnaireResponse = questionnaireResponse;
	}
}