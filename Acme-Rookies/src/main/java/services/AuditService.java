
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AuditRepository;
import domain.Audit;

@Service
@Transactional
public class AuditService {

	// Manage Repository
	@Autowired
	private AuditRepository		auditRepository;

	// Supporting services


	// CRUD methods
	public Audit findOne(final int auditId) {
		final Audit result = this.auditRepository.findOne(auditId);
		Assert.notNull(result);

		return result;
	}
	/********************************************************************/
	// Other business methods

}
