
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.Message;
import domain.Provider;
import repositories.ProviderRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;

@Service
@Transactional
public class ProviderService {

	// Manage Repository
	@Autowired
	private ProviderRepository providerRepository;

	// Supporting services


	/*************************************
	 * CRUD methods
	 *************************************/
	public Provider create() {

		Provider provider = new Provider();

		// Initialice
		UserAccount userAccount = new UserAccount();
		Collection<Authority> authorities = new ArrayList<Authority>();
		Authority authority = new Authority();
		authority.setAuthority(Authority.PROVIDER);
		authorities.add(authority);
		userAccount.setAuthorities(authorities);

		// Set Messages
		Collection<Message> messages = new ArrayList<Message>();

		provider.setUserAccount(userAccount);
		provider.setMessages(messages);
		provider.setIsSpammer(false);

		return provider;

	}

	public Collection<Provider> findAll() {
		final Collection<Provider> result = this.providerRepository.findAll();
		Assert.notNull(result);
		Assert.notEmpty(result);

		return result;
	}

	public Provider findOne(int adminID) {
		Provider result = this.providerRepository.findOne(adminID);
		Assert.notNull(result);
		return result;
	}

	public Provider save(Provider provider) {
		Assert.notNull(provider);
		Provider result = this.providerRepository.save(provider);

		return result;
	}

	public void delete(Provider provider) {
		Assert.isTrue(this.findByPrincipal() == provider);
		Assert.notNull(provider);
		
		this.providerRepository.delete(provider);
	}
	
	
	/*************************************
	 * Other business methods
	 *************************************/
	public Provider findByPrincipal() {
		Provider result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public Provider findByUserAccount(UserAccount userAccount) {
		Assert.notNull(userAccount);

		Provider result;

		result = this.providerRepository.findByUserAccountId(userAccount.getId());

		return result;
	}

	public Provider findOneByUsername(String username) {
		Assert.notNull(username);

		return this.providerRepository.findByUserName(username);
	}

}
