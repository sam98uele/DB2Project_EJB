package it.polimi.db2.project.entities;

import java.io.Serializable;
import java.util.List;

import javax.persistence.*;

/**
 * 
 * Entity representing the "marketing_question" table
 *
 */
@Entity
@Table(name = "marketing_questions", schema = "db2_project")
/**
 * 
 * @NamedQueries TODO
 *
 */
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
	 * String containing the actual question
	 */
	@Column(columnDefinition = "varchar(200)", nullable = false)
	private String question;
	
	//----RELATIONS----
	
	/**
	 * Relationship with table "marketing_answer": to one questions, belongs many answers, one per user who responded. This is a 
	 * One to Many relationship. Since the table represented by this entity does not contain the FK (foreign key), this entity 
	 * is NOT THE OWNER of the relationship. Since we may not be immediately interested in the answer, we can use a Fetch type 
	 * lazy, and if we remove question, we want also to remove all the correlated answers.
	 */
	@OneToMany(mappedBy = "questionAsked", fetch = FetchType.LAZY, orphanRemoval = true, cascade = CascadeType.ALL)
	private List<MarketingAnswer> marketingAnswers;
	
	/**
	 * Relationship with table "product": many questions belong to one single product: this is a MAny to one relationship. Since 
	 * the table represented by this entity contains the FK (foreign key), this entity IS THE OWNER of the relationship.
	 */
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;
	
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
	 * Getter method for the list of answers to this question (answered by users)
	 * @return
	 */
	public List<MarketingAnswer> getMarketingAnswers() {
		return marketingAnswers;
	}

	/**
	 * Setter method for the list of answers to this question (answered by users)
	 * @param answers
	 */
	public void setMarketingAnswers(List<MarketingAnswer> marketingAnswers) {
		this.marketingAnswers = marketingAnswers;
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
	 * @param product
	 */
	public void setProduct(Product product) {
		this.product = product;
	}
	
	//----ADDERS - REMOVERS----
	
	/**
	 * Method used to add a marketing answer to the list of marketing answers
	 */
	public void addMarketingAnswer(MarketingAnswer marketingAnswer) {
		getMarketingAnswers().add(marketingAnswer);
	}
	
	/**
	 * Method used to remove a marketing answer to the list of marketing answers
	 */
	public void removeMarketingAnswer(MarketingAnswer marketingAnswer) {
		getMarketingAnswers().remove(marketingAnswer);
	}
	
}