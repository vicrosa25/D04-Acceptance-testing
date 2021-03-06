
package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Access(AccessType.PROPERTY)
public class Company extends Actor {

	// Attributes -------------------------------------------------------------
	private String					commercialName;
	private Double					score;
	private String 					email;
	

	// Relationships ----------------------------------------------------------
	private Collection<Position>	positions;
	private Collection<Problem>		problems;


	// ------------------------------------------------------------
	@NotBlank
	@Pattern(regexp = "^[\\w\\s]+(\\s*)\\<\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}\\>|\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$")
	public String getEmail() {
		return this.email;
	}

	public void setEmail(final String email) {
		this.email = email;
	}
	
	@NotBlank
	public String getCommercialName() {
		return this.commercialName;
	}

	public void setCommercialName(final String commercialName) {
		this.commercialName = commercialName;
	}
	
	
	public Double getScore() {
		return score;
	}

	
	public void setScore(Double score) {
		this.score = score;
	}

	//--------------------------------------------------------------
	@OneToMany(mappedBy = "company")
	public Collection<Position> getPositions() {
		return this.positions;
	}

	public void setPositions(Collection<Position> positions) {
		this.positions = positions;
	}

	@OneToMany(mappedBy = "company")
	public Collection<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(Collection<Problem> problems) {
		this.problems = problems;
	}

}
