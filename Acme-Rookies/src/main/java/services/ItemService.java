package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Item;
import domain.Provider;
import repositories.ItemRepository;

@Service
@Transactional
public class ItemService {
	
	// Manage Repository
	@Autowired
	private ItemRepository		itemRepository;
	
	
	// Supporting services
	@Autowired
	private ProviderService		providerService;
	
	
	
	// CRUD methods
	public Item create() {
		final Item result = new Item();

		return result;
	}

	public Item findOne(int itemID) {
		final Item result = this.itemRepository.findOne(itemID);
		Assert.notNull(result);

		return result;
	}

	public Collection<Item> findAll() {
		final Collection<Item> result = this.itemRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Item save(Item item) {
		Assert.notNull(item);
		Item saved;
		
		Provider principal = this.providerService.findByPrincipal();

		if (item.getId() == 0) {
			item.setProvider(principal);
			saved = this.itemRepository.save(item);
		} else {
			Assert.isTrue(principal.getItems().contains(item));
			saved = this.update(item);
		}
		return saved;
	}
	
	public Item update(Item item) {
		Assert.notNull(item);

		return this.itemRepository.save(item);
	}

	
	
	public void delete(Item item) {
		
		Provider principal = this.providerService.findByPrincipal();
		
		Assert.notNull(principal);
		Assert.isTrue(principal.getItems().contains(item));
		
		this.itemRepository.delete(item);
	}
}
