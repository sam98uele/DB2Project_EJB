package it.polimi.db2.project.services;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import it.polimi.db2.project.entities.User;

/**
 * 
 * @author Samuele
 *
 */
@Stateless
public class QuestionnaireAdminService {
	/**
	 * JPA Entity Manager
	 * it is extended in order to let it live until the user calls the "remove" method.
	 */
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	/**
	 * This will return the list of users who submitted the questionnaire
	 * 
	 * @param productId
	 * @return
	 */
	public List<User> getUsersSubmittedQuestionnaires(Integer productId) {
		// getting the list of users who have submitted the Questionnaire for that product
		// using a query
		// TODO: MANAGE THE EXCEPTIONS
		List<User> users = em
				.createQuery("Select q.user from QuestionnaireResponse q"
							+ "where q.produc.id = :prodId", User.class)
				.setParameter("repId", productId)
				.getResultList();
		
		// now for security reasons we need to set the password to null before sending it to the 
		// 	frontend
		// before doing it, we need to now to detach the user class, in order to not persist the change
		//	we do to it.
		for(int i=0; i<users.size(); i++) {
			em.detach(users.get(i));
			users.get(i).setPassword(null);
		}
		
		// returning the list of users
		return users;
	}
	
	/**
	 * This is used to erase all the questionnaire data related to a specific product
	 * note that all the responses are erased and the points of the users removed (trigger??)
	 * 
	 * @param productId the Id of the product to erase all it's questionnaire data
	 */
	public void deleteQuestionnaires(Integer productId) {
		// TODO: to implement
		//			only admin can do this
		//			only for a date preceding the current one
	}
}
