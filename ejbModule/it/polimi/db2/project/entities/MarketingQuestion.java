package it.polimi.db2.project.entities;

import java.io.Serializable;

import javax.persistence.*;

/**
 * 
 * Entity representing the "marketing_question" table TODO
 *
 */
@Entity
@Table(name = "marketing_questions", schema = "db2_project")
public class MarketingQuestion implements Serializable{

	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

}
