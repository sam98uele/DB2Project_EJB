package it.polimi.db2.project.services;

import javax.ejb.Stateless;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.apache.openjpa.persistence.PersistenceException;
import org.eclipse.persistence.config.HintValues;
import org.eclipse.persistence.config.QueryHints;

import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.exceptions.QueryException;

/**
 * This is the basic service to interact with the product.
 * It is general, and this does not cover the operations done by the type of users but only
 * the generic operations, like retriving a product given the ID
 * 
 * @author Samuele
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
	 * This will return the product given the id
	 * 
	 * @param productId the Id of the product
	 * @return the product object that has the input id
	 */
	public Product getProductById(int productId) {
		Product p = null;	
		
		try {
			p = em.find(Product.class, productId);
		}catch(IllegalArgumentException e) {
			e.printStackTrace();
		}
		
		return p;
	}
	
	/**
	 * This method will return list of past schedule of the product of the day.
	 * Date will be less than current date.
	 * @return list of product scheduled in the past (N.B.: check the list because could be null if there are no past schedule)
	 */
	public List<Product> getPastScheduledProductOfTheDay() throws QueryException{
		
		/**
		 * Initializing list of product of the day
		 */
		List<Product> pastSchedule = null;
		
		/**
		 * The following query is a named query which retrieve all the products which has a date in which they will be product of 
		 * the day less than the current date (only less then, not equal)
		 */
		try {
			pastSchedule = em.createNamedQuery("Product.getPastProductOfTheDay", Product.class)
					.setHint(QueryHints.REFRESH, HintValues.TRUE) // do not cache the results
					.getResultList();
		}catch(IllegalStateException | PersistenceException e) {
			
			e.printStackTrace();
			throw new QueryException("Unable to retrieve past product of the day");
		}
		/**
		 * Returning product of the day
		 */
		return pastSchedule;
	}
}
