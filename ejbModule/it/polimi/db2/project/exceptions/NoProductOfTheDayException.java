package it.polimi.db2.project.exceptions;

/**
 * This is raised if the product of the day is not present
 *
 */
public class NoProductOfTheDayException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public NoProductOfTheDayException() {
		// default constructor
		super();
	}
	
	public NoProductOfTheDayException(String message) {
		super(message);
	}

}
