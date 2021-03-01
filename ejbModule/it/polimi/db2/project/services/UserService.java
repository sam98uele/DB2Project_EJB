package it.polimi.db2.project.services;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

import it.polimi.db2.project.entities.Log;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.entities.QuestionnaireResponse;
import it.polimi.db2.project.entities.User;
import it.polimi.db2.project.exceptions.ApplicationErrorException;
import it.polimi.db2.project.exceptions.CredentialsException;
import it.polimi.db2.project.exceptions.InvalidActionException;
import it.polimi.db2.project.exceptions.NoProductOfTheDayException;
import it.polimi.db2.project.exceptions.RegistrationException;

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
	 * @throws ApplicationErrorException if there is a problem not related to the user during the login phase
	 */
	public User checkCredentialts(String username, String password) throws CredentialsException, ApplicationErrorException{
		List<User> uList = null;
		try {
			// getting username linked to the username or password
			uList = em.createNamedQuery("User.checkCredentials", User.class)
					.setParameter(1, username).setParameter(2, password)
					.getResultList();
		} catch (PersistenceException e) {
			// if there are problems during the execution of the query,
			// it is not user fault, so throw an exception
			throw new ApplicationErrorException("Error while checking your credentials! Try again Later.");
		}
		
		// if no user are returned by the query, it means no users exists associated to the
		//	sent data.
		if (uList.isEmpty())
			throw new CredentialsException("Error! Username or Password is wrong!");
		else if (uList.size() == 1) {
			// getting the user object
			User user = uList.get(0);
			
			// saving in the logs the that the user logged in
			Date date = Calendar.getInstance().getTime();
			Log log = new Log(date, user);
			em.persist(log);
			
			// returning the user to the frontend
			//	no matter for the password, given that is the password of the user
			return uList.get(0); // there exists one user associated to the data
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
	 * @param password the password of the user
	 * @return the newly created user
	 * @throws RegistrationException if there are problems with the registration
	 */
	public User registration(String username, String password) throws RegistrationException {
		// checking if the username is available
		List<User> users_same_username = em.createQuery(
				"SELECT r FROM User r WHERE r.username = ?1", 
				User.class)
				.setParameter(1, username)
				.getResultList();
		
		if(users_same_username != null && users_same_username.isEmpty() && users_same_username.size() != 0)
			throw new RegistrationException("The Username is not available");
			
		// if all ok, creating the user
		// and persist it
		User user = new User(username, password);
		try {
			em.persist(user);
		}
		catch(PersistenceException e) {
			throw new RegistrationException("Your Registration cannot be completed.");
		}
		
		// if all ok, returning the newly created user
		return user;
	}
	
	/**
	 * It is used to know if the user has already submitted the product of the day
	 * for this month or not.
	 * @param user the user we want to know
	 * @return true if already sumbitted, false otherwise
	 */
	public boolean answeredToQuestionnaireOfTheDay(User user) {
		// getting the product of the day
		List<Product> retrieved_products = em.createNamedQuery("Product.getProductOfTheDayToday", Product.class)
				.getResultList();
		
		// if no product of the day, cannot continue!
		if (retrieved_products == null || retrieved_products.isEmpty() || retrieved_products.size() != 1) 
				return false;
		
		// this is the product of the day
		Product product = retrieved_products.get(0);
		
		// checking if already answered
		List<QuestionnaireResponse> responses= em.createQuery(
				"SELECT r FROM Product p JOIN p.questionnaireResponses r WHERE p.id = ?1 AND r.user.id = ?2", 
				QuestionnaireResponse.class)
				.setParameter(1, product.getId())
				.setParameter(2, user.getId())
				.getResultList();
		
		if(responses != null && !responses.isEmpty() && responses.size() != 0)
			return true;
		
		return false;
	}
	
	/**
	 * This will return the leaderboard
	 * @return the leaderboard
	 */
	public List<User> getLeaderboard() {
		List<User> l_users = em.createQuery(
				"SELECT u FROM User u WHERE u.isAdmin != true ORDER BY u.scores", 
				User.class)
				.getResultList();
		
		return l_users;
	}
}
