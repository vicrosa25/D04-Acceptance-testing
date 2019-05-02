
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Position;

@Repository
public interface PositionRepository extends JpaRepository<Position, Integer> {

	@Query("select p from Position p where p.finalMode='1'")
	Collection<Position> findAllFinal();

	@Query("select p from Position p join p.audits a where a.id=?1")
	Position findByAudit(int auditId);

}
