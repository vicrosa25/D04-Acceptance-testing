
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Sponsorship;

@Repository
public interface SponsorshipRepository extends JpaRepository<Sponsorship, Integer> {

	@Query("select p.sponsorships from Provider p where p.id = ?1")
	Collection<Sponsorship> findByProvider(int providerId);

	@Query("select s from Sponsorship s where s.position.id = ?1")
	Collection<Sponsorship> findByPosition(int positionId);
}
