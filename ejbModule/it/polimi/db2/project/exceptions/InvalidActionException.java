package it.polimi.db2.project.exceptions;

/**
 * This will be thrown when an invalid action is performed!
 *
 */
public class InvalidActionException extends Exception {
	private static final long serialVersionUID = 1L;

	public InvalidActionException(String message) {
		super(message);
	}
}
