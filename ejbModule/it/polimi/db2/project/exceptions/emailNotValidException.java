package it.polimi.db2.project.exceptions;

public class emailNotValidException extends Exception{
	private static final long serialVersionUID = 1L;

	public emailNotValidException(String message) {
		super(message);
	}
}
