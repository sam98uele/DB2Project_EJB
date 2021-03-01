package it.polimi.db2.project.exceptions;

/**
 * This is thrown when a bad answer to a questionnaire is submitted
 * or if a questionnaire is submitted with missing mandatory questions
 * 
 * @author Samuele
 *
 */
public class InvalidAnswerException extends Exception{
	private static final long serialVersionUID = 1L;

	public InvalidAnswerException(String message) {
		super(message);
	}
}
