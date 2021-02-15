package it.polimi.db2.project.entities;

import java.io.Serializable;
import java.math.BigDecimal;

import javax.persistence.*;

/**
 * Entity implementation class for Entity: TestEntity
 *
 */
@Entity
@Table(name = "test", schema = "db2_project")
//@NamedQuery(name = "Expense.findAll", query = "SELECT e FROM Expense e")
public class Test implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private Integer num;
	
	private String str;

	public Test() {
	}

	public Test(Integer num, String str) {
		this.num = num;
		this.str = str;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Integer getNum() {
		return this.num;
	}

	public void setNum(Integer num) {
		this.num = num;
	}

	public String getStr() {
		return this.str;
	}

	public void setStr(String str) {
		this.str = str;
	}

}
