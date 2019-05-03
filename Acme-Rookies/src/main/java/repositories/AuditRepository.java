
package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Audit;

@Repository
public interface AuditRepository extends JpaRepository<Audit, Integer> {
	
	@Query("select p.audits from Company c join c.positions p where c.id = ?1")
	Collection<Audit> finalAllByCompany(int companyId);

}
