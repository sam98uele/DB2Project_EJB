package it.polimi.db2.project.services;

import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import it.polimi.db2.project.entities.Test;

@Stateless
public class TestService {
	@PersistenceContext(unitName = "DB2Project_EJB")
	private EntityManager em;
	
	public TestService() {
		
	}
	
	public void createTest(Integer num, String str) {
		Test testobj = new Test(num, str);
		em.persist(testobj);
	}
}
