
package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
public class Message extends DomainEntity {

	// Attributes -------------------------------------------------------------
	private Date				moment;
	private String				subject;
	private String				body;
	private String				priority;
	private Boolean				isNotification;
	private Boolean 			isSpam;
	private Collection<String>	tags;


	@NotNull
	@Temporal(TemporalType.TIMESTAMP)
	@Past
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm")
	public Date getMoment() {
		return this.moment;
	}

	public void setMoment(final Date moment) {
		this.moment = moment;
	}

	@NotBlank
	public String getSubject() {
		return this.subject;
	}

	public void setSubject(final String subject) {
		this.subject = subject;
	}

	@NotBlank
	public String getBody() {
		return this.body;
	}

	public void setBody(final String body) {
		this.body = body;
	}

	@NotBlank
	@Pattern(regexp = "^(LOW)|(MEDIUM)|(HIGH)$")
	public String getPriority() {
		return this.priority;
	}

	public void setPriority(final String priority) {
		this.priority = priority;
	}
	
	
	@ElementCollection(targetClass = String.class)
	public Collection<String> getTags() {
		return this.tags;
	}

	public void setTags(final Collection<String> tags) {
		this.tags = tags;
	}
	
	public Boolean getIsNotification() {
		return isNotification;
	}

	public void setIsNotification(Boolean isNotification) {
		this.isNotification = isNotification;
	}
	
	public Boolean getIsSpam() {
		return isSpam;
	}

	
	public void setIsSpam(Boolean isSpam) {
		this.isSpam = isSpam;
	}




	// Relationships ----------------------------------------------------------
	private Actor					sender;
	private Collection<Actor>		recipients;

	@OneToOne(optional = true)
	public Actor getSender() {
		return this.sender;
	}

	public void setSender(final Actor sender) {
		this.sender = sender;
	}

	@NotNull
	@ManyToMany
	public Collection<Actor> getRecipients() {
		return this.recipients;
	}

	public void setRecipients(final Collection<Actor> recipients) {
		this.recipients = recipients;
	}

	@Override
	public String toString() {
		return "Message [sender=" + this.sender + ", recipient=" + this.recipients + ", moment=" + this.moment + ", subject=" + this.subject + ", priority=" + this.priority + ", tags=" + this.tags  + "]";
	}

}
