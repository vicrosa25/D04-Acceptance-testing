
package services;


import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Actor;
import domain.Administrator;
import domain.Audit;
import domain.Auditor;
import repositories.AuditRepository;


@Service
@Transactional
public class AuditService {

	// Manage Repository
	@Autowired
	private AuditRepository auditRepository;

	// Supporting services
	@Autowired
	private ActorService		actorService;
	@Autowired
	private AuditorService		auditorService;



	// CRUD methods
	public Audit create() {
		Audit result;
		Actor principal;

		result = new Audit();

		// Principal must be a Company
		principal = this.actorService.findByPrincipal();
		Assert.isInstanceOf(Auditor.class, principal);

		result.setMoment(new Date());
		result.setFinalMode(false);

		return result;
	}

	public Audit findOne(final int auditId) {
		final Audit result = this.auditRepository.findOne(auditId);
		Assert.notNull(result);

		return result;
	}

	public Audit save(final Audit audit) {
		boolean nuevo = false;
		Assert.notNull(audit);
		Auditor principal = this.auditorService.findByPrincipal();

		if(audit.getId()==0){
			nuevo = true;
		}else{
			Assert.isTrue(principal.getAudits().contains(audit));
		}

		final Audit result = this.auditRepository.save(audit);

		if (nuevo){
			principal.getAudits().add(result);
			result.getPosition().getAudits().add(result);
		}

		return result;
	}

	public void delete(final Audit audit) {
		Auditor principal = this.auditorService.findByPrincipal();

		Assert.notNull(audit);
		Assert.isTrue(principal.getAudits().contains(audit));
		Assert.isTrue(!audit.getFinalMode());

		audit.getPosition().getAudits().remove(audit);
		principal.getAudits().remove(audit);

		this.auditRepository.delete(audit);
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
