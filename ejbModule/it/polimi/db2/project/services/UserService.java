package it.polimi.db2.project.services;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import it.polimi.db2.project.exceptions.CredentialsException;

/**
 * This is the service class for the user.
 * 
 * @author Samuele
 *
 */
@Stateless
public class UserService {
	/**
	 * JPA Entity Manager
	 */
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	/**
	 * Default Constructor
	 */
	public UserService() {
		// Default Constructor
	}
	
	/**
	 * This will return if the user is admin or not
	 * 
	 * @param userId the Id of the user
	 * @return a boolean denoted the status of being admin or not
	 */
	public Boolean isAdmin(String userId) {
		// TODO: is it necessary?
		//			because we have the User object in the frontend.
		User user = em.find(User.class, userId);
		
		return user.isAdmin();
	}
	
	/**
	 * This will check the credentials for the login of the user.
	 * 
	 * @param username the username of the user who wants to login the system
	 * @param password the password of the user who wants to login the system
	 * @return the user object
	 * @throws CredentialsException if the sent credentials where not correct
	 */
	public User chackCredentialts(String username, String password) throws CredentialsException{
		// TODO: To implement
	}
	
}
