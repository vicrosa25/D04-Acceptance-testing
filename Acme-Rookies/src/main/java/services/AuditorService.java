
package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import repositories.AuditorRepository;
import security.LoginService;
import security.UserAccount;
import domain.Auditor;

@Service
@Transactional
public class AuditorService {

	// Manage Repository
	@Autowired
	private AuditorRepository		auditorRepository;

	// Supporting services


	// CRUD methods
	public Auditor findOne(final int auditorId) {
		final Auditor result = this.auditorRepository.findOne(auditorId);
		Assert.notNull(result);

		return result;
	}

	public Auditor save(final Auditor auditor) {
		Assert.notNull(auditor);

		final Auditor result = this.auditorRepository.save(auditor);

		return result;
	}
	/************************************************************************************************/

	// Other business methods
	public Auditor findByPrincipal() {
		Auditor result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public Auditor findByUserAccount(final UserAccount userAccount) {
		Assert.notNull(userAccount);

		Auditor result;

		result = this.auditorRepository.findByUserAccountId(userAccount.getId());

		return result;
	}
}
