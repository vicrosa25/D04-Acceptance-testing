
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
public class ProviderCreateItem extends AbstractTest {

	// System under test ---------------------------------------------------------------------------
	@Autowired
	private ItemService itemService;

	// Tests -----------------------------------------------------------------------------------------

	/**
	 * Requirement: An actor who is authenticated as a Provider must be able to: "Create an Item"
	 * 
	 * 1. Positive test.
	 * 
	 **/
	@Test
	public void createItemPositive(){
		int 		itemsNumber;
		int 		finalItemsNumber;
		Item 		item = null;
		
		super.authenticate("provider1");
		itemsNumber = this.itemService.findAll().size();
		
		item = this.itemService.create();
		item.setName("TestItem");
		item.setDescription("test Item");
		item.setLink("http://testItem.com");
		this.itemService.save(item);
			
		finalItemsNumber = this.itemService.findAll().size();
		
		Assert.isTrue(itemsNumber < finalItemsNumber);
		
		super.unauthenticate();
		
	}
	
	
	/**
	 * Requirement: An actor who is authenticated as a Provider must be albe to:  "Create an Item"
	 *  
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor is not authenticated as a Provider
	 *  
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void createItemNegative(){
		Item item;
		
		super.authenticate(null);		
			
		item = this.itemService.create();
		item.setName("TestItem");
		item.setDescription("test Item");
		item.setLink("http://testItem.com");
		
		
		this.itemService.save(item);
			
		super.unauthenticate();
		
	}

}
