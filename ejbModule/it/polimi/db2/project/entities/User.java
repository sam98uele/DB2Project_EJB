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
@NamedQueries({
	// used during login phase
	@NamedQuery(name = "User.getUserByUsername", query = "SELECT r FROM User r  WHERE r.username = ?1")
})
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
	 * points gained by the user. Admin will have default points
	 */
	@Column(nullable = false)
	private int points;
	
	/**
	 * Username of the user. Annotation needed to specify the varchar property of the DB. Unique = true has effect only during the DDL generation, not at runtime.
	 * At runtime the unique check is performed in the database. We left it only for completeness
	 */
	@Column(columnDefinition = "varchar(100)", nullable = false, unique = true)
	private String username;
	
	/**
	 * Contains the email of the user
	 */
	// , unique = true
	@Column(columnDefinition = "varchar(200)", nullable = false)
	private String email;
	
	/**
	 * Password of the user. Annotation needed to specify the varchar property of the DB
	 */
	@Column(columnDefinition = "varchar(300)", nullable = false)
	private String password;
	
	/**
	 * Needed for password encryption
	 */
	@Column(columnDefinition = "varchar(300)", nullable = false)
	private String salt;
	
	/**
	 * Flag needed to remember if the user is an admin. In case, we have different privileges.
	 * "0" means is not admin;
	 * "1" means is admin
	 */
	@Column(nullable = false)
	private boolean isAdmin;
	
	/**
	 * flag needed to record if the user is blocked or not.
	 * "0" means is not blocked;
	 * "1" means is blocked
	 */
	@Column(nullable = false)
	private boolean blocked;

	//----RELATIONSHIPS----
	/**
	 * Relation with table "log": a user perform many logs. 1 user, many logs. Since entity "Log" has the FK (foreign key), this 
	 * entity is NOT the owner of the relationship. Fetch type between user and log is set to Lazy, because since a User is supposed 
	 * to have a large amount of logs, we don't want to create performance problems. orphanRemoval is set to true because when we 
	 * remove a user, we also want to remove all its logs and CascadeType.ALL because we want the relation being consistent with all
	 * the changes of user.
	 */
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
	private List<Log> logs;
	
	
	//--- CONSTRUCTORS ----
	/**
	 * Default Constructor
	 */
	public User() {
	}
	
	/**
	 * Constructor for Normal Users
	 * 
	 * @param username the username of the user
	 * @param password the password of the user
	 * @param salt the salt of the password of the user
	 */
	public User(String username, String email, String password, String salt) {
		this.username = username;
		this.email = email;
		this.password = password;
		this.salt = salt;
		this.isAdmin = false; // this constructor will create normal users
		this.blocked = false; // by default the user is not blocked
	}
	
	
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
	 * Getter method for email
	 * @return String email of the user
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * Setter method for email
	 * @param email of the user
	 */
	public void setEmail(String email) {
		this.email = email;
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
	 * Getter method for salt
	 * @return String salt of the user
	 */
	public String getSalt() {
		return salt;
	}
	
	/**
	 * Setter method for the salt
	 * @param salt of the password of the user
	 */
	public void setSalt(String salt) {
		this.salt = salt;
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
	 * It also updates the counterpart of the relationship
	 * @param logs
	 */
	public void setLogs(List<Log> logs) {
		if( (logs != null) && (!logs.isEmpty()) ) { // if the list of logs is not null
			for(Log i: logs) {
				i.setUser(this); //updating the counterpart
			}
		}
		this.logs = logs;
	}
	
	/**
	 * @return the points of the user
	 */
	public int getPoints() {
		return this.points;
	}
	
	/**
	 * To set the points to the user
	 * @param points the points to set
	 */
	public void setPoints(int points) {
		this.points = points;
	}
	
	/**
	 * Method used to add a log to the user
	 * @param log
	 */
	public void addLog(Log log){
		log.setUser(this); //updating the counterpart
		getLogs().add(log);
	}
	
	/**
	 * Method used to remove a log from the user
	 * @param log
	 */
	public Log removeLog(Log log){
		getLogs().remove(log);
		log.setUser(null);
		return log;
	}
	
}
