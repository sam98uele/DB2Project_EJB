package it.polimi.db2.project.exceptions;

/**
 * This is raised when there are problems during the insertion / retrieve a product
 *
 */
public class ProductException extends Exception {
	private static final long serialVersionUID = 1L;

	public ProductException(String message) {
		super(message);
	}
}

