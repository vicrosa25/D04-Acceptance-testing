
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Position extends DomainEntity {

	// Attributes -------------------------------------------------------------
	private Date	deadline;
	private String	ticker;
	private String	title;
	private String	description;
	private Boolean	finalMode;
	private Boolean	cancelled;
	private String	profile;
	private String	skills;
	private String	technologies;
	private Double	salary;


	@NotNull
	@Future
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	public Date getDeadline() {
		return this.deadline;
	}

	public void setDeadline(final Date deadline) {
		this.deadline = deadline;
	}

	@NotBlank
	@Column(unique = true)
	@Pattern(regexp = "^([a-zA-Z]{4})(-)([0-9]{4})$")
	public String getTicker() {
		return this.ticker;
	}

	public void setTicker(final String ticker) {
		this.ticker = ticker;
	}

	@NotBlank
	public String getTitle() {
		return this.title;
	}

	public void setTitle(final String title) {
		this.title = title;
	}

	@NotBlank
	public String getDescription() {
		return this.description;
	}

	public void setDescription(final String description) {
		this.description = description;
	}

	@NotNull
	public Boolean getFinalMode() {
		return this.finalMode;
	}

	public void setFinalMode(final Boolean finalMode) {
		this.finalMode = finalMode;
	}

	public Boolean getCancelled() {
		return this.cancelled;
	}

	public void setCancelled(final Boolean cancelled) {
		this.cancelled = cancelled;
	}

	@NotBlank
	public String getProfile() {
		return this.profile;
	}

	public void setProfile(final String profile) {
		this.profile = profile;
	}

	@NotBlank
	public String getSkills() {
		return this.skills;
	}

	public void setSkills(final String skills) {
		this.skills = skills;
	}

	@NotBlank
	public String getTechnologies() {
		return this.technologies;
	}

	public void setTechnologies(final String technologies) {
		this.technologies = technologies;
	}

	@NotNull
	@DecimalMin("0.0")
	public Double getSalary() {
		return this.salary;
	}

	public void setSalary(final Double salary) {
		this.salary = salary;
	}


	// Relationships ----------------------------------------------------------
	private Company					company;
	private Auditor					auditor;
	private Collection<Problem>		problems;
	private Collection<Application>	applications;
	private Collection<Audit>		audits;


	@OneToMany
	public Collection<Audit> getAudits() {
		return this.audits;
	}

	public void setAudits(final Collection<Audit> audits) {
		this.audits = audits;
	}

	@OneToMany(mappedBy = "position")
	public Collection<Application> getApplications() {
		return this.applications;
	}

	public void setApplications(final Collection<Application> applications) {
		this.applications = applications;
	}

	@ManyToOne(optional = false)
	public Company getCompany() {
		return this.company;
	}

	public void setCompany(final Company company) {
		this.company = company;
	}

	@ManyToOne(optional = true)
	public Auditor getAuditor() {
		return this.auditor;
	}

	public void setAuditor(final Auditor auditor) {
		this.auditor = auditor;
	}

	@ManyToMany
	public Collection<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(final Collection<Problem> problems) {
		this.problems = problems;
	}

	// Other methods
	@Override
	public String toString() {
		return "Position [deadline=" + this.deadline + ", ticker=" + this.ticker + ", title=" + this.title + ", description=" + this.description + ", finalMode=" + this.finalMode + ", profile=" + this.profile + ", skills=" + this.skills
			+ ", technologies=" + this.technologies + ", salary=" + this.salary + "]";
	}
}
