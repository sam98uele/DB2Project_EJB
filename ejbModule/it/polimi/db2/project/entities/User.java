package it.polimi.db2.project.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

/**
 * 
 * Entity class for table user
 *
 */
@Entity
@Table(name = "user", schema="db2_project")
/**
 * 
 * @NamedQueries TODO
 *
 */
public class User implements Serializable{
	
	//----ATTRIBUTES----
	
	/**
	 * Default Serial Version
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Primary key of the user, the Id. Values generated automatically
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	/**
	 * Username of the user. Annotation needed to specify the varchar property of the DB
	 */
	@Column(columnDefinition = "varchar(45)", nullable = false)
	private String username;
	
	/**
	 * Password of the user. Annotation needed to specify the varchar property of the DB
	 */
	@Column(columnDefinition = "varchar(45)", nullable = false)
	private String password;
	
	/**
	 * eventually we will need a tag Type(type = "org.hibernate.type.NumericBooleanType") in order to map a boolean to a TINYINT, 
	 * because without the tag the boolean could be mapped to a bit value, and not to a TINYINT
	 * Flag needed to remember if the user is an admin. In case, we have different privileges.
	 * "0" means is not admin;
	 * "1" means is admin
	 */
	@Column(nullable = false)
	private boolean isAdmin;
	
	/**
	 * eventually we will need a tag Type(type = "org.hibernate.type.NumericBooleanType") in order to map a boolean to a TINYINT, 
	 * because without the tag the boolean could be mapped to a bit value, and not to a TINYINT
	 * flag needed to record if the user is blocked or not.
	 * "0" means is not blocked;
	 * "1" means is blocked
	 */
	@Column(nullable = false)
	private boolean blocked;

	//----RELATIONS----
	/**
	 * Relation with table "log": a user perform many logs. 1 user, many logs. Since entity "Log" has the FK (foreign key), this 
	 * entity is NOT the owner of the relationship. Fetch type between user and log is set to Lazy, because since a User is supposed 
	 * to have a large amount of logs, we don't want to create performance problems. orphanRemoval is set to true because when we 
	 * remove a user, we also want to remove all its logs.
	 */
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
	private List<Log> logs;
	
	
	/**
	 * Relation with table "questionnaire response"
	 * One user responds to many questionnaires. The relation is one to many. Since the questionnaire_response table has the 
	 * FK (foreign key), this entity is NOT the owner of this relationship. Since a user can respond to many questionnaires, it 
	 * is useful to have the FetchType as Lazy, in order to not affect performances.
	 */
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
	private List<QuestionnaireResponse> questionnaireResponses;
	
	//----GETTERS AND SETTERS----
	/**
	 * these are all the getters and setters method for this class
	 */
	
	/**
	 * Getter method for id
	 * @return int id of the user
	 */
	public int getId() {
		return id;
	}

	/**
	 * Setter method for id
	 * @param id of the user
	 */
	public void setId(int id) {
		this.id = id;
	}
	
	/**
	 * Getter method for username
	 * @return String username of the user
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * Setter method for username
	 * @param username of the user
	 */
	public void setUsername(String username) {
		this.username = username;
	}
	
	/**
	 * Getter method for password
	 * @return String password of the user
	 */
	public String getPassword() {
		return password;
	}
	
	/**
	 * Setter method for the password
	 * @param password of the user
	 */
	public void setPassword(String password) {
		this.password = password;
	}
	
	/**
	 * Getter method for the flag "isAdmin"
	 * @return boolean if the user is or not admin:
	 * "0" means that the user is not admin
	 * "1" means that the user is admin
	 */
	public boolean isAdmin() {
		return isAdmin;
	}

	/**
	 * Setter method for the flag "isAdmin"
	 * @param isAdmin
	 * "0" means that the user is not admin
	 * "1" means that the user is admin
	 */
	public void setAdmin(boolean isAdmin) {
		this.isAdmin = isAdmin;
	}
	
	/**
	 * Getter method for the flag "isBlocked"
	 * @return boolean is the user is blocked or not:
	 * "0" means that the user is not blocked
	 * "1" means that the user is blocked
	 */
	public boolean isBlocked() {
		return blocked;
	}

	/**
	 * Setter method for the flag "isBlocked"
	 * @param blocked
	 * "0" means that the user is not blocked
	 * "1" means that the user is blocked
	 */
	public void setBlocked(boolean blocked) {
		this.blocked = blocked;
	}

	/**
	 * Getter method for the logs done by the users
	 * @return List of Log of the user
	 */
	public List<Log> getLogs() {
		return logs;
	}
	
	/**
	 * Setter method for the logs of the user
	 * @param logs
	 */
	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}
	
	/**
	 * Getter method for the list of questionnaire to which the user responded
	 * @return
	 */
	public List<QuestionnaireResponse> getQuestionnaireResponses() {
		return questionnaireResponses;
	}
	
	/**
	 * Setter method for the list of questionnaire responses.
	 * @param questionnaireResponses
	 */
	public void setQuestionnaireResponses(List<QuestionnaireResponse> questionnaireResponses) {
		this.questionnaireResponses = questionnaireResponses;
	}
	
	//----ADDERS - REMOVERS----
	
	/**
	 * Method used to add a questionnaire response to a user
	 * @param response
	 */
	public void addQuestionnaireResponse(QuestionnaireResponse response) {
		getQuestionnaireResponses().add(response);
	}
	
	/**
	 * Method used to remove a questionnaire response from a user
	 * @param response
	 */
	public void removeQuestionnaireResponse(QuestionnaireResponse response){
		getQuestionnaireResponses().remove(response);
	}
	
	/**
	 * Method used to add a log to the user
	 * @param log
	 */
	public void addLog(Log log){
		getLogs().add(log);
	}
	
	/**
	 * Method used to remove a log from the user
	 * @param log
	 */
	public void removeLog(Log log){
		getLogs().remove(log);
	}
	
}
