package it.polimi.db2.project.exceptions;

/**
 * This is thrown every time there is not an error caused by the user,
 * but there is an error caused by some server side problems
 * @author Samuele
 *
 */
public class ApplicationErrorException extends Exception{
	private static final long serialVersionUID = 1L;

	public ApplicationErrorException(String message) {
		super(message);
	}
}
