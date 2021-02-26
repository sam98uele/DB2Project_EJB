package it.polimi.db2.project.services;

/**
 * 
 * @author Samuele
 *
 */
public class QuestionnaireAdminService {
	/**
	 * This is used to erase all the questionnaire data related to a specific product
	 * note that all the responses are erased and the points of the users removed (trigger??)
	 * 
	 * @param productId the Id of the product to erase all it's questionnaire data
	 */
	public void deleteQuestionnaires(Integer productId) {
		// TODO: to implement
		//			only admin can do this
		//			only for a date preceding the current one
	}
}
