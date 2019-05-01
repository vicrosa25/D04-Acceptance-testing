package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Integer> {
	
	@Query("select p.socialProfiles from Provider p where p.id = ?1")
	Collection<Item> findByProvider(int providerID);

}
