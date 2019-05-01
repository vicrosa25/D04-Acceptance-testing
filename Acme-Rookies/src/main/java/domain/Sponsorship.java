
package domain;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

@Entity
@Access(AccessType.PROPERTY)
public class Sponsorship extends DomainEntity {

	private String		banner;
	private String		targetPage;
	private Long		creditCard;


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

	
	@NotNull
	public Long getCreditCard() {
		return creditCard;
	}
	
	public void setCreditCard(Long creditCard) {
		this.creditCard = creditCard;
	}



	// Relationships ----------------------------------------------------------
	private Provider provider;
	
	@ManyToOne(optional=false)
	public Provider getProvider() {
		return provider;
	}
	
	public void setProvider(Provider provider) {
		this.provider = provider;
	}
	@Override
	public String toString() {
		return "Providership [getBanner()=" + this.getBanner() + ", getTargetPage()=" + this.getTargetPage() + ", getCreditCard()=" + this.getCreditCard() + "]";
	}

}
