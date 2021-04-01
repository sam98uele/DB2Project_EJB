package it.polimi.db2.project.exceptions;

/**
 * Thrown when there are errors during registration phase
 *
 */
public class RegistrationException extends Exception {
	private static final long serialVersionUID = 1L;

	public RegistrationException(String message) {
		super(message);
	}
}
