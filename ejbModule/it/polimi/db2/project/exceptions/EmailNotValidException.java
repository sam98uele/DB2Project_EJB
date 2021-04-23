package it.polimi.db2.project.exceptions;

public class EmailNotValidException extends Exception{
	private static final long serialVersionUID = 1L;

	public EmailNotValidException(String message) {
		super(message);
	}
}
