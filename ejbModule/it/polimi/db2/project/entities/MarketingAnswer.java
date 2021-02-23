package it.polimi.db2.project.entities;

import java.io.Serializable;

import javax.persistence.*;

/**
 * 
 * Entity representing the table "marketing_answer" TODO
 *
 */
@Entity
@Table(name = "marketing_answer", schema = "db2_project")
public class MarketingAnswer implements Serializable{

	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

}
