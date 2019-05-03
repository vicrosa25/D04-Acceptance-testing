
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
public class ProviderEditItemTest extends AbstractTest {

	// System under test ---------------------------------------------------------------------------
	@Autowired
	private ItemService itemService;

	// Tests -----------------------------------------------------------------------------------------

	/**
	 * Requirement: An actor who is authenticated as a Provider must be able to: "Edit an Item"
	 * 
	 * 1. Positive test.
	 * 
	 **/
	@Test
	public void editItemPositive(){
		int 		itemId;
		Item 		item;
		Item		saved;
		
		
		super.authenticate("provider1");
		
		// Item
		itemId = super.getEntityId("item1");
		item = this.itemService.findOne(itemId);
		
		// Updating Item
		item.setName("TestItem");
		item.setDescription("test Item");
		item.setLink("http://testItem.com");
		this.itemService.save(item);
			
		saved = this.itemService.save(item);
		
		Assert.isTrue(item.getId() == saved.getId());
		super.unauthenticate();
		
	}
	
	
	/**
	 * Requirement: An actor who is authenticated as a Provider must be albe to:  "Edit an Item"
	 *  
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor is not authenticated as a Provider
	 *  
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void editItemNegative(){
		int 		itemId;
		Item 		item;
		Item 		saved;
		
		super.authenticate(null);
		
		// Item
		itemId = super.getEntityId("item1");
		item = this.itemService.findOne(itemId);
		
		// Updating Item
		item.setName("TestItem");
		item.setDescription("test Item");
		item.setLink("http://testItem.com");
		
		saved = this.itemService.save(item);
		
		Assert.isTrue(item.getId() == saved.getId());
			
		super.unauthenticate();
		
	}

}
