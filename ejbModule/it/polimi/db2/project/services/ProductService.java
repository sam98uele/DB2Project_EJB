package it.polimi.db2.project.services;

import java.util.Date;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import it.polimi.db2.project.exceptions.ProductException;

/**
 * 
 *
 */
@Stateless
public class ProductService {
	/**
	 * JPA Entity Manager
	 */
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	/**
	 * This is needed to get the product of the day
	 * 
	 * @return the product of the day
	 */
	public Product getProductOfTheDay() {
		// TODO: to implement
	}
	
	/**
	 * This is used by the admins to add a new product
	 * 
	 * @param name the name of the product
	 * @param img the image of the product
	 * @param date the date in which the product is product of the day
	 * @param description a small description of the product
	 * @return the newly created product
	 * @throws ProductException if there are problems with the insertion of the product
	 */
	public Product addProduct(String name, byte[] img,  Date date, String description) throws ProductException{
		// TODO: to implement
		//			only admin can do this, so, check if the user is admin!
		//			remember this can be added only in a future day or today
		//			if a product with the same date, it is a problem
	}
	
	/**
	 * This is used to erase all the questionnaire data, responses and points of an user
	 * 
	 * @param productId the Id of the product to erase all it's questionnaire data
	 */
	public void deleteQuestionnaires(Integer productId) {
		// TODO: to implement
		//			only admin can do this
		//			only for a date preceding the current one
	}
}
