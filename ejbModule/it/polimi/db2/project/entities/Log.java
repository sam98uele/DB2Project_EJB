package it.polimi.db2.project.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

/**
 * 
 * Entity class for table "log"
 *
 */
@Entity
@Table(name = "log", schema="db2_project")
public class Log implements Serializable{

	//----ATTRIBUTES----
	/**
	 * Default serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * primary key of the table log. Each log has its own id
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	/**
	 * attribute for the column datetime in database. Column datetime in the DB is of type DATETIME
	 */
	@Column(name = "datetime", nullable = false, columnDefinition = "DATETIME")
	@Temporal(TemporalType.TIMESTAMP)
	private java.util.Date datetime;
	
	//----RELATIONSHIPS----
	
	/**
	 * Relation with table user: many logs are associated to one user. Since this table has the FK (foreign key), this table is the 
	 * OWNER of the relationship.
	 */
	@ManyToOne
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	
	//---- CONSTRUCTOR ----
	/**
	 * Default constructor
	 */
	public Log() {
	}
	
	/**
	 * Constructor 
	 * 
	 * @param dateTime the timestamp of the log
	 * @param user the user who logged in
	 */
	public Log(Date dateTime, User user) {
		this.datetime = dateTime;
		this.user = user;
	}
	
	/**
	 * Constructor
	 * Take only the date
	 * @param dateTime
	 */
	public Log(Date dateTime) {
		this.datetime=dateTime;
	}
	
	//----GETTERS AND SETTERS----
	
	/**
	 * Getter method for the id of the log
	 * @return in id of the log
	 */
	public int getId() {
		return id;
	}

	/**
	 * Setter method for the id of the log
	 * @param id of the log
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Getter method for date and time of the log
	 * @return java.util.Date datetime of the log
	 */
	public java.util.Date getDatetime() {
		return datetime;
	}
	
	/**
	 * Setter method for the date and time of the log
	 * @param datetime of the log
	 */
	public void setDatetime(java.util.Date datetime) {
		this.datetime = datetime;
	}
	
	/**
	 * Getter method for the user responsible of the log
	 * @return
	 */
	public User getUser() {
		return user;
	}

	/**
	 * Setter method for the user responsible of the log
	 * @param userid
	 */
	public void setUser(User user) {
		this.user = user;
	}
	

}
