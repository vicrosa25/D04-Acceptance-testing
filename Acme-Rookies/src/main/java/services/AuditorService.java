
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Auditor;
import domain.Message;
import repositories.AuditorRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;

@Service
@Transactional
public class AuditorService {

	// Manage Repository
	@Autowired
	private AuditorRepository		auditorRepository;

	// Supporting services


	// CRUD methods
	public Auditor create() {

		Auditor auditor = new Auditor();

		// Initialice
		UserAccount userAccount = new UserAccount();
		Collection<Authority> authorities = new ArrayList<Authority>();
		Authority authority = new Authority();
		authority.setAuthority(Authority.AUDITOR);
		authorities.add(authority);
		userAccount.setAuthorities(authorities);

		
		// Set Messages
		Collection<Message> messages = new ArrayList<Message>();

		auditor.setUserAccount(userAccount);
		auditor.setMessages(messages);
		auditor.setIsSpammer(false);

		return auditor;

	}
	
	
	public Auditor findOne(final int auditorId) {
		final Auditor result = this.auditorRepository.findOne(auditorId);
		Assert.notNull(result);

		return result;
	}
	
	public Collection<Auditor> findAll() {
		Collection<Auditor> result = this.auditorRepository.findAll();
		Assert.notNull(result);

		return result;
	}
	
	

	public Auditor save(Auditor auditor) {
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
