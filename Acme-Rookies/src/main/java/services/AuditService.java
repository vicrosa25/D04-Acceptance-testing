
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Actor;
import domain.Administrator;
import domain.Audit;
import repositories.AuditRepository;

@Service
@Transactional
public class AuditService {

	// Manage Repository
	@Autowired
	private AuditRepository auditRepository;

	// Supporting services
	@Autowired
	private ActorService 	actorService;


	// CRUD methods
	public Audit findOne(final int auditId) {
		final Audit result = this.auditRepository.findOne(auditId);
		Assert.notNull(result);

		return result;
	}
	/********************************************************************/
	// Other business methods

	public Collection<Audit> findAllByCompany(int companyId) {
		Collection<Audit> result;

		// Make sure that the principal is an Admin
		final Actor principal = this.actorService.findByPrincipal();
		Assert.isInstanceOf(Administrator.class, principal);
		
		result = this.auditRepository.finalAllByCompany(companyId);
		
		return result;
	}

}
