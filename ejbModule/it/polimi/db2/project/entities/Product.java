package it.polimi.db2.project.entities;

import java.io.Serializable;

import javax.persistence.*;
/**
 * 
 * Entity class representing table "product" TODO
 *
 */
@Entity
@Table(name = "product", schema = "db2_project")
public class Product implements Serializable{

	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

}
