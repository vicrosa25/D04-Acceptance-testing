
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.CreditCardNumber;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

@Entity
@Access(AccessType.PROPERTY)
public class Sponsorship extends DomainEntity {

	private String	banner;
	private String	targetPage;
	private String	creditCard;


	@NotBlank
	@URL
	public String getBanner() {
		return this.banner;
	}
	public void setBanner(final String banner) {
		this.banner = banner;
	}

	@NotBlank
	@URL
	public String getTargetPage() {
		return this.targetPage;
	}
	public void setTargetPage(final String targetPage) {
		this.targetPage = targetPage;
	}

	@NotBlank
	@CreditCardNumber
	public String getCreditCard() {
		return this.creditCard;
	}

	public void setCreditCard(final String creditCard) {
		this.creditCard = creditCard;
	}


	// Relationships ----------------------------------------------------------
	private Provider	provider;
	private Position	position;


	@NotNull
	@ManyToOne(optional = false)
	public Provider getProvider() {
		return this.provider;
	}

	public void setProvider(final Provider provider) {
		this.provider = provider;
	}

	@NotNull
	@ManyToOne(optional = false)
	public Position getPosition() {
		return this.position;
	}

	public void setPosition(final Position position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "Providership [getBanner()=" + this.getBanner() + ", getTargetPage()=" + this.getTargetPage() + ", getCreditCard()=" + this.getCreditCard() + "]";
	}

}
