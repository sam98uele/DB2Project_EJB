package it.polimi.db2.project.services;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.LockTimeoutException;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.PersistenceException;
import javax.persistence.PessimisticLockException;
import javax.persistence.QueryTimeoutException;
import javax.persistence.TemporalType;
import javax.persistence.TransactionRequiredException;

import it.polimi.db2.project.entities.Product;
import it.polimi.db2.project.exceptions.NoProductOfTheDayException;

@Stateless
public class ProductUserService {
	/**
	 * JPA Entity Manager
	 * it is extended in order to let it live until the user calls the "remove" method.
	 */
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	/**
	 * This is needed to get the product of the day
	 * 
	 * @return the product of the day
	 * @throws NoProductOfTheDayException if there is no available product of the day to return
	 */
	public Product getProductOfTheDay() throws NoProductOfTheDayException {
		// today's date
		//Date date = Calendar.getInstance().getTime();
		//java.sql.Date dateSQL = new java.sql.Date(date.getTime());
		
		// date.toString();
		List<Product> prodList = null;
		
		try {
			prodList = em.createNamedQuery("Product.getProductOfTheDayToday", Product.class)
					//.setParameter("date", dateSQL)
					.getResultList();
		}
		catch(IllegalStateException | PersistenceException e) {
			e.printStackTrace(); // TODO: develop only
			throw new NoProductOfTheDayException();
		}
		
		// if the product is not 1, then it means we do not have a product of the day to display
		if(prodList == null || prodList.isEmpty() || prodList.size() != 1)
			throw new NoProductOfTheDayException("The number of product of that day is not 1");
		
		Product prodDay = prodList.get(0);
		
		// TODO: ALSO NEED ALL THE CHILDREN OF THEM!
		// to fetch the collection (needed by the web tier)
		prodDay.getQuestionnaireResponses().size();
		
		// if here we are sure to have the product of the day "not null" and that is unique
		//	thanks to the exceptions
		return prodDay;
	}
}
