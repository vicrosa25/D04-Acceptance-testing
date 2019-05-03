
package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import domain.Item;
import services.ItemService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ProviderDeleteItemTest extends AbstractTest {

	// System under test ---------------------------------------------------------------------------
	@Autowired
	private ItemService 		itemService;
	

	// Tests -----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as a Provider must be able to: "Delete an Item"
	 * 
	 * 1. Positive test.
	 * 
	 **/
	@Test
	public void deleteItemPositive(){
		Item item;
		int itemsBefore;
		int itemsAfter;
		
		super.authenticate("provider1");
		
		itemsBefore = this.itemService.findAll().size();

		item = this.itemService.findOne(super.getEntityId("item1"));
		
		this.itemService.delete(item);
		
		itemsAfter = this.itemService.findAll().size();
		
		Assert.isTrue(itemsBefore > itemsAfter);
		
		super.unauthenticate();
		
	}
	
	/**
	 * Requirement: An actor who is authenticated as a Provider must be albe to:  "Delete an Item"
	 *  
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor is not authenticated as a Provider
	 *  
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void deleteItemNegative(){
		Item item;
		
		super.authenticate(null);

		item = this.itemService.findOne(super.getEntityId("item1"));
		
		this.itemService.delete(item);
		
		super.unauthenticate();
	}
	
	
	
	/**
	 * Requirement: An actor who is authenticated as a Provider must be albe to:  "Delete an Item"
	 *  
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor does not own the Item
	 *  
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void deleteItemNegative2(){
		Item item;
		
		super.authenticate("provider1");

		item = this.itemService.findOne(super.getEntityId("item3"));
		
		this.itemService.delete(item);
		
		super.unauthenticate();
	}

}
