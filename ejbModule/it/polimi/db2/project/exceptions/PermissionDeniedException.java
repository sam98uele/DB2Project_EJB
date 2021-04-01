package it.polimi.db2.project.exceptions;

/**
 * It is Raised if a user tries to do an action it is not allowed to do
 * for example a not-admin user tries to create a product (only admins can do it)
 *
 */
public class PermissionDeniedException extends Exception{
	private static final long serialVersionUID = 1L;

	public PermissionDeniedException(String message) {
		super(message);
	}
}
