package it.polimi.db2.project.services;

import java.util.Calendar;
import java.util.Date;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.NonUniqueResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;

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
		Date date = Calendar.getInstance().getTime();
		
		Product prodDay;
		
		try {
			prodDay = em.createNamedQuery("Product.getProductOfTheDay", Product.class).setParameter("date", date)
					.getSingleResult();
		}
		catch(NoResultException | NonUniqueResultException e) {
			throw new NoProductOfTheDayException();
		}
		
		// TODO: ALSO NEED ALL THE CHILDREN OF THEM!
		// to fetch the collection (needed by the web tier)
		prodDay.getQuestionnaireResponses().size();
		
		// if here we are sure to have the product of the day "not null" and that is unique
		//	thanks to the exceptions
		return prodDay;
	}
}
