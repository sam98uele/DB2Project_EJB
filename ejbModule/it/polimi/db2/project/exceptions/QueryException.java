package it.polimi.db2.project.exceptions;

/**
 * 
 * This exception is thrown when the query returned an exception
 *
 */
public class QueryException extends Exception{

	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	public QueryException(String message) {
		super(message);
	}
}