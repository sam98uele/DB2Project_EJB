package it.polimi.db2.project.services;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.ejb.Remove;
import javax.ejb.Stateful;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.PersistenceException;
import javax.persistence.TemporalType;

import org.joda.time.DateTimeComparator;

import it.polimi.db2.project.entities.MarketingQuestion;
import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.exceptions.InvalidActionException;
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
		// today's date
		Date todayDate = Calendar.getInstance().getTime();
		
		// lets compare the two dates, to see if the inserted one is before today
		int dateCompRes = DateTimeComparator.getDateOnlyInstance().compare(date, todayDate);
		// if it is before, it's illegal, so throw an exception
		if(dateCompRes < 0)
			throw new InvalidInputArgumentException("The inserted date is before the current date! You can insert only product in a date equalt to today or a future date!");
		
		// TODO: THE DATE DOES NOT WORK PROPERLY
		java.sql.Date dateSQL = new java.sql.Date(date.getTime());
		
		// getting the product of the day of the day specified for that product
		List<Product> prodDay = em.createNamedQuery("Product.getProductOfTheDay", Product.class)
				.setParameter("date", dateSQL)
				.getResultList();
		
		// if there are products of the day available, then it's not possible to add a new one for that day!
		if(prodDay.size() != 0)
			throw new ProductException("In the specified day there already exists a product! Cannot insert an other one!");
		
		//Date dateAA = Calendar.getInstance().getTime();
		
		// creating the new product
		Product product = new Product(name, dateSQL, img, description);
		
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
	 * @throws InvalidActionException if a marketing question is created before the product
	 */
	public Product addMarketingQuestion(String question) throws InvalidActionException {
		if(this.product == null) {
			throw new InvalidActionException("You cannot insert a marketing question before create a product!");
		}
		// creating the new question
		MarketingQuestion marketingQuestion = new MarketingQuestion(question);
		
		// adding this question to the product
		//	the product will update the relation counterpart!
		this.product.addMarketingQuestion(marketingQuestion);
		
		// returning the update product with the new question
		return this.product;
	}
	
	/**
	 * This method will remove the specified marketing question from the product marketing questions
	 * (note: if it does not exist it will do nothing!)
	 *  
	 * @param marketingQuestionId the Id of the marketing question to remove
	 * @return the updated product
	 */
	public Product deleteMarketingQuestion(Integer marketingQuestionId) {
		// removing the marketing question (if it exists)	
		this.product.getMarketingQuestions().remove(marketingQuestionId.intValue());
		
		// returning the update product
		return this.product;
		
	}
	
	/**
	 * This is used to save the product
	 * 	once created and added all the needed marketing questions
	 * @throws ProductException if the product is not complete
	 */
	public void saveProduct() throws ProductException {
		// checking if a product hase been created before persisting it
		if(this.product == null)
			throw new ProductException("You must create a product before inserting it!");
		
		// checking if there is at least one marketing answer
		//	if not we throw an exception!
		//	(we have decided to have this requirement, given that nothing is specified,
		//		that a product must have at least one marketing answer)
		if(this.product.getMarketingQuestions() == null || this.product.getMarketingQuestions().isEmpty() || this.product.getMarketingQuestions().size() == 0)
			throw new ProductException("You must insert at leas one Marketing Answer");
		
		// persisting the product with all the marketing questions cascading!
		try {			
			em.persist(this.product);
		}
		catch(PersistenceException e) {
			throw new ProductException("There was an error while inserting the product, retry with correct values!");
		}
		
		//Remove the product once persisted, in order to be able to create a new one
		this.product = null;
	}

	/**
	 * @return the product
	 */
	public Product getProduct() {
		return this.product;
	}
	
	/**
	 * This will set the product to null.
	 * If the Admin decide to discard the product before saving it.
	 */
	public void undoCreation() {
		this.product = null;
	}
	
	/**
	 * This will destroy the stateful EJB
	 */
	@Remove
	public void remove() {
		this.product = null;
	}
}
