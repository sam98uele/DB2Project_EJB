package it.polimi.db2.project.services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import it.polimi.db2.project.entities.Product;

/**
 * This is the basic service to interact with the product.
 * It is general, and this does not cover the operations done by the type of users but only
 * the generic operations, like retriving a product given the ID
 * 
 * @author Samuele
 *
 */
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
}
