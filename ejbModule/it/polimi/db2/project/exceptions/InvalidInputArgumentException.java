package it.polimi.db2.project.exceptions;

/**
 * It is raised if an passed to the EJB argument is invalid
 * 
 *
 */
public class InvalidInputArgumentException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public InvalidInputArgumentException(String message) {
		super(message);
	}
}
