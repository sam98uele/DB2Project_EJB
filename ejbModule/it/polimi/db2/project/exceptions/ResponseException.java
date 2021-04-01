package it.polimi.db2.project.exceptions;

/**
 * This is the exceptions during the compilation of the response
 *
 */
public class ResponseException extends Exception {
	private static final long serialVersionUID = 1L;

	public ResponseException(String message) {
		super(message);
	}
}
