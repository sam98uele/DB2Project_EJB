package it.polimi.db2.project.services;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;
import org.eclipse.persistence.config.HintValues;
import org.eclipse.persistence.config.QueryHints;
import it.polimi.db2.project.entities.Log;
import it.polimi.db2.project.entities.User;
import it.polimi.db2.project.exceptions.ApplicationErrorException;
import it.polimi.db2.project.exceptions.CredentialsException;
import it.polimi.db2.project.exceptions.RegistrationException;
import it.polimi.db2.project.util.PasswordEncryption;

/**
 * This is the service class for the user.
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
	 * This will check the credentials for the login of the user.
	 * 
	 * @param username the username of the user who wants to login the system
	 * @param password the password of the user who wants to login the system
	 * @return the user object
	 * @throws CredentialsException if the sent credentials where not correct
	 * @throws ApplicationErrorException if there is a problem not related to the user during the login phase
	 */
	public User checkCredentialts(String username, String password) throws CredentialsException, ApplicationErrorException{
		List<User> uList = null;
		try {
			// getting username linked to the username or password
			uList = em.createNamedQuery("User.getUserByUsername", User.class)
					.setParameter(1, username)
					.setHint("javax.persistence.cache.storeMode", "REFRESH")
					.getResultList();
		} catch (IllegalArgumentException e) {
			// if there are problems during the execution of the query,
			// it is not user fault, so throw an exception
			throw new ApplicationErrorException("Error while checking your credentials! Try again Later.");
		}
		
		// if no user are returned by the query, it means no users exists associated to the
		//	sent data.
		if (uList.isEmpty())
			throw new CredentialsException("Error! Username or Password is wrong!");
		else if (uList.size() == 1) {
			/**
			 * getting the user object
			 */
			User user = uList.get(0);
			
			try {
				if(!PasswordEncryption.authenticate(
						password, 
						Base64.getDecoder().decode(user.getPassword()), 
						Base64.getDecoder().decode(user.getSalt())))
					throw new CredentialsException("Error! Username or Password is wrong!");
			} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
				throw new CredentialsException("Couldn't perform the login!");
			}
			
			/**
			 * saving in the logs the that the user logged in
			 */
			Date date = Calendar.getInstance().getTime();
			Log log = new Log(date);
			user.addLog(log);
			
			
			// returning the user to the frontend
			// without the password
			return user; // there exists one user associated to the data
		}
		
		// if more users are present, then it's a problem.
		// cannot allow the login, but it is an application problem!
		// it should be avoided during registration phase!
		// and also usernames should be unique!
		throw new CredentialsException("Error! Username of Password is wrong!");
	}
	
	
	
	/**
	 * This method is used to perform a registration of a user
	 * (admins are not created or assigned with the application)
	 * @param username the username of the user
	 * @param email the email of the user
	 * @param password the password of the user
	 * @return the newly created user
	 * @throws RegistrationException if there are problems with the registration
	 */
	public User registration(String username, String email, String password) throws RegistrationException {
		// checking if the username is available
		List<User> users_same_username;
		try {
			users_same_username = em.createQuery(
					"SELECT r FROM User r WHERE r.username = ?1", 
					User.class)
					.setParameter(1, username)
					.getResultList();
		}
		catch (IllegalArgumentException e) {
			throw new RegistrationException("Cannot fullfil the request");
		}
		
		//if we find someone with the same username, we throw a registration exception
		if(users_same_username != null && !users_same_username.isEmpty() && users_same_username.size() != 0)
			throw new RegistrationException("The Username is not available");
		
		//if no one was found with the same username, then we perform the registration
		String user_password;
		String user_salt;
		
		//try to encode the password
		try {
			byte[] salt = PasswordEncryption.generateSalt();
			byte[] encoded_passoword = PasswordEncryption.getEncryptedPassword(password, salt);
			user_password = Base64.getEncoder().encodeToString(encoded_passoword);
			user_salt = Base64.getEncoder().encodeToString(salt);
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e1) {
			throw new RegistrationException("Error during registration - error code: registration-01");
		}
		
		if(user_password == null || user_salt == null)
			throw new RegistrationException("Error during registration - error code: registration-02");
		
		// if all ok, creating the user
		// and persist it 
		User user = new User(username, email, user_password, user_salt);
		try {
			em.persist(user);
		}
		catch(IllegalArgumentException | PersistenceException e) {
			throw new RegistrationException("Your Registration cannot be completed. - error code: registration-03");
		}
		
		// if all ok, returning the newly created user
		return user;
	}
	
	/**
	 * This is used to return the leaderboard of the user who has submitted the questionnaire of the day
	 * only the users who have submitted successfully it!
	 * 
	 * @return the leaderboard
	 * @throws ApplicationErrorException if there is a problem in serving the request
	 */
	public List<User> getLeaderboard() throws ApplicationErrorException {
		List<User> l_users = null;
		
		try {
			l_users = em.createQuery(
					"SELECT u FROM User u WHERE u.isAdmin != true"
					+ " AND u in (SELECT r.user FROM Product p JOIN p.questionnaireResponses r WHERE p.date = CURRENT_DATE AND r.submitted=true)"
					+ " ORDER BY u.points DESC", 
					User.class)
					.setHint(QueryHints.REFRESH, HintValues.TRUE) // do not cache the results
					.getResultList();
		}
		catch (IllegalArgumentException e) {
			throw new ApplicationErrorException("There was an error while serving your request!");
		}
		
		return l_users;
	}
}
