package it.polimi.db2.project.services;

import java.util.Date;
import java.util.List;

import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

import it.polimi.db2.project.entities.MarketingQuestion;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.exceptions.InvalidInputArgumentException;
import it.polimi.db2.project.exceptions.PermissionDeniedException;
import it.polimi.db2.project.exceptions.ProductException;

/**
 * This is used by the admins to create a new product
 *
 */
@Stateful
public class ProductAdminService {
	/**
	 * JPA Entity Manager
	 */
	@PersistenceContext(unitName = "DB2Project_EJB", type = PersistenceContextType.EXTENDED)
	private EntityManager em;
	
	/*
	 * It is the created product
	 */
	private Product product;
	
	// ---- METHODS ----
	
	/**
	 * This is used by the admins to add a new product.
	 * A check on the user role is performed, if the user is not admin, an exception is thrown.
	 * The product is created if the date specified does not have product of the day jet.
	 * 
	 * 
	 * @param name the name of the product
	 * @param img the image of the product
	 * @param date the date in which the product is product of the day
	 * @param description a small description of the product
	 * @return the newly created product
	 * @throws ProductException if there are problems with the insertion of the product
	 * @throws InvalidInputArgumentException if an invalid argument is passed to the method
	 * @throws PermissionDeniedException if user performing the action is not allowed to do so
	 */
	public Product addProduct(String name, byte[] img,  Date date, String description) throws ProductException, InvalidInputArgumentException, PermissionDeniedException{
		// getting the product of the day of the day specified for that product
		List<Product> prodDay = em.createNamedQuery("Product.getProductOfTheDay", Product.class).setParameter("date", date)
				.getResultList();
		
		// if there are products of the day available, then it's not possible to add a new one for that day!
		if(prodDay.size() != 0)
			throw new ProductException("In the specified day there already exists a product! Cannot insert an other one!");
		
		// creating the new product
		Product product = new Product(name, date, img, description);
		
		this.product = product;

		return product;
		
		// TODO: this is a test method. Many things can be messing. 
		//	so, need to check, the following my notes (@samuele): 
		//		to implement
		//			only admin can do this, THE CHECK MUST BE DONE IN THE FRONTEND
		//			remember this can be added only in a future day or today
		//			if a product with the same date, it is a problem
	}
	
	/**
	 * This method is used to add a new marketing question when creating a new Product.
	 * 
	 * @param question the text of the question
	 * @return the product with the newly inserted marketing question
	 */
	public Product addMarketingQuestion(String question) {
		// creating the new question
		MarketingQuestion marketingQuestion = new MarketingQuestion(question);
		
		// adding this question to the product
		//	the product will update the relation counterpart!
		this.product.addMarketingQuestion(marketingQuestion);
		
		// returning the update product with the new question
		return this.product;
	}
	
	/**
	 * This is used to save the product
	 * 	once created and added all the needed marketing questions
	 */
	public void saveProduct() {
		// persisting the product with all the marketing questions cascading!
		em.persist(product);
		//TODO: check if product is not null before persist
	}
	
	public Product getProduct() {
		return this.product;
	}
}
