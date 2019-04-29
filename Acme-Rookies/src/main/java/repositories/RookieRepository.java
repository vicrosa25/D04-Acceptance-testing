
package repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Rookie;

@Repository
public interface RookieRepository extends JpaRepository<Rookie, Integer> {

	@Query("select h from Rookie h where h.id = ?1")
	Rookie findById(int id);

	@Query("select h from Rookie h where h.userAccount.username = ?1")
	Rookie findByUserName(String username);

	@Query("select h from Rookie h where h.userAccount.id = ?1")
	Rookie findByUserAccountId(int id);

	@Query("select h from Rookie h where h.finder.id = ?1")
	Rookie findByFinder(int finderId);
}
