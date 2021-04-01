package it.polimi.db2.project.exceptions;

/**
 * This must be thrown when there are problems during the login
 *
 */
public class CredentialsException extends Exception {
	private static final long serialVersionUID = 1L;

	public CredentialsException(String message) {
		super(message);
	}
}
