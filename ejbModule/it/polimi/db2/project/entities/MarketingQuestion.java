package it.polimi.db2.project.entities;

import java.io.Serializable;
import javax.persistence.*;

/**
 * 
 * Entity representing the "marketing_question" table
 *
 */
@Entity
@Table(name = "marketing_question", schema = "db2_project")
public class MarketingQuestion implements Serializable{

	/**
	 * Default serial version ID
	 */
	private static final long serialVersionUID = 1L;
	
	//----ATTRIBUTES----
	
	/**
	 * Primary key of the table, this id identify the single question
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	/**
	 * This will define the order to order the questions when they are displayed in the questionnaire
	 * or when they are displayed answer
	 * Given that JPA inserts the question in a random order and not in the order the Admin has submitted
	 * them, we need this to save them in the correct order.
	 */
	@Column(columnDefinition = "int default 0")
	private int ordering;
	
	/**
	 * String containing the actual question
	 */
	@Column(columnDefinition = "varchar(200)", nullable = false)
	private String question;
	
	//----RELATIONSHIPS----
	
	/**
	 * Relationship with table "product": many questions belong to one single product: this is a Many to One relationship. Since 
	 * the table represented by this entity contains the FK (foreign key), this entity IS THE OWNER of the relationship.
	 */
	@ManyToOne
	@JoinColumn(name = "product_id", nullable = false)
	private Product product;
	
	//--- CONSTRUCTORS ----
	
	/**
	 * Default constructor
	 */
	public MarketingQuestion() {	
	}
	
	public MarketingQuestion(String question) {
		this.question = question;
	}
	
	//----GETTERS AND SETTERS----

	/**
	 * Getter method for the id of the question (which is the primary key in the table)
	 * @return
	 */
	public int getId() {
		return id;
	}
	
	/**
	 * Setter method for the id of the question ( which is the primary key in the table)
	 * @param id
	 */
	public void setId(int id) {
		this.id = id;
	}
	
	/**
	 * Getter method for the ordering of the question
	 * @return the ordering
	 */
	public int getOrdering() {
		return ordering;
	}
	
	/**
	 * Setter method for the ordering of the question
	 * @param ordering the question
	 */
	public void setOrdering(int ordering) {
		this.ordering = ordering;
	}

	/**
	 * Getter method for the question asked
	 * @return
	 */
	public String getQuestion() {
		return question;
	}
	
	/**
	 * Setter method for the question asked
	 * @param question
	 */
	public void setQuestion(String question) {
		this.question = question;
	}

	/**
	 * Getter method for the product of which this question is about
	 * @return
	 */
	public Product getProduct() {
		return product;
	}

	/**
	 * Setter method for the product of which this question is about
	 * Protected because it must be called only by the entity Product to update the 
	 * 	counterpart of the relation
	 * @param product
	 */
	protected void setProduct(Product product) {
		this.product = product;
	}
	
	//----ADDERS - REMOVERS----
	
}