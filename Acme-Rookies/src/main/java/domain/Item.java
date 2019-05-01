package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.URL;

@Entity
@Access(AccessType.PROPERTY)
public class Item extends DomainEntity {
	
	// Attributes ------------------------------------------------------------------------------------------
	private String 				name;
	private String 				description;
	private String				link;
	private Collection<Url>		pictures;
	
	
	@NotBlank
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	@NotBlank
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	@NotBlank
	@URL
	public String getLink() {
		return link;
	}
	
	public void setLink(String link) {
		this.link = link;
	}
	
	@ElementCollection
	public Collection<Url> getPictures() {
		return pictures;
	}
	
	public void setPictures(Collection<Url> pictures) {
		this.pictures = pictures;
	}
	
	// Relationships ---------------------------------------------------------------------------------------
	private Provider	provider;

	
	
	
	@ManyToOne(optional = false)
	public Provider getProvider() {
		return provider;
	}

	
	public void setProvider(Provider provider) {
		this.provider = provider;
	}

	
	
	
	// Other Methods
	@Override
	public String toString() {
		return "Item [name=" + name + ", description=" + description + ", link=" + link + ", provider=" + provider + "]";
	}
	
	
	

}
