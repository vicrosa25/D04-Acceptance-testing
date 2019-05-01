package domain;

import java.util.Collection;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@Access(AccessType.PROPERTY)
public class Provider extends Actor {
	
	// Attributes -------------------------------------------------------------
	private String 		make;

	
	public String getMake() {
		return make;
	}

	
	public void setMake(String make) {
		this.make = make;
	}
	
	
	

	// Relationships ----------------------------------------------------------
	private Collection<Item> 			items;
	private Collection<Sponsorship> 	sponsorships;


	
	@OneToMany(mappedBy = "provider")
	public Collection<Item> getItems() {
		return items;
	}

	public void setItems(Collection<Item> items) {
		this.items = items;
	}


	@OneToMany(cascade = CascadeType.ALL, mappedBy = "provider")
	public Collection<Sponsorship> getSponsorships() {
		return sponsorships;
	}


	
	public void setSponsorships(Collection<Sponsorship> sponsorships) {
		this.sponsorships = sponsorships;
	}


	
	// Other Methods
	@Override
	public String toString() {
		return "Provider [make=" + make + "]";
	}
}
