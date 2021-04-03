package it.polimi.db2.project.entities;

import java.io.Serializable;

import javax.persistence.*;

/**
 * Entity class for the table "offensive", containing offensive words/expressions
 *
 */
@Entity
@Table(name = "offensive", schema="db2_project")
@NamedQuery(name = "Offensive.searchBadWord", query = "SELECT r FROM Offensive r  WHERE r.word = ?1")
public class Offensive implements Serializable{
	
	//----ATTRIBUTES----
	/**
	 * default serialVersion ID
	 */
	private static final long serialVersionUID = 1L;
	
	/**
	 * Primary key needed to identify words
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	/**
	 * offensive word or expression
	 */
	@Column(columnDefinition = "varchar(45)", nullable = false)
	private String word;
	
	//----RELATIONSHIPS----
	
	/**
	 * none
	 */
	
	//----GETTERS AND SETTERS----

	/**
	 * Getter method to retrieve the id of the word (the primary key in the table)
	 * @return
	 */
	public int getId() {
		return id;
	}

	/**
	 * Setter method to retrieve the id of the word (primary key in the table)
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * Getter method to retrieve the word identified as offensive
	 * @return
	 */
	public String getWord() {
		return word;
	}

	/**
	 * Setter method to set a word
	 * @param word
	 */
	public void setWord(String word) {
		this.word = word;
	}
	
}
