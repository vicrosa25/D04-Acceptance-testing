
package services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import repositories.ProviderRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;
import domain.Message;
import domain.Provider;
import forms.ProviderForm;

@Service
@Transactional
public class ProviderService {

	// Manage Repository
	@Autowired
	private ProviderRepository providerRepository;

	// Supporting services

	@Autowired
	@Qualifier("validator")
	private Validator				validator;


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

	/*** Reconstruct object, check validity and update binding ***/
	public Provider reconstruct(final ProviderForm form, final BindingResult binding) {
		final Provider provider = this.create();

		provider.getUserAccount().setPassword(form.getUserAccount().getPassword());
		provider.getUserAccount().setUsername(form.getUserAccount().getUsername());

		provider.setAddress(form.getAddress());
		provider.setEmail(form.getEmail());
		provider.setName(form.getName());
		provider.setPhoneNumber(form.getPhoneNumber());
		provider.setPhoto(form.getPhoto());
		provider.setSurname(form.getSurname());
		provider.setVat(form.getVat());
		provider.setCardNumber(form.getCardNumber());
		provider.setMake(form.getMake());

		// Default attributes from Actor
		provider.setIsSpammer(false);
		provider.setIsBanned(false);

		this.validator.validate(provider, binding);

		return provider;
	}

	public Provider reconstruct(final Provider provider, final BindingResult binding) {
		final Provider result = this.create();
		final Provider temp = this.findOne(provider.getId());

		Assert.isTrue(this.findByPrincipal().getId() == provider.getId());

		// Updated attributes
		result.setAddress(provider.getAddress());
		result.setEmail(provider.getEmail());
		result.setName(provider.getName());
		result.setPhoneNumber(provider.getPhoneNumber());
		result.setPhoto(provider.getPhoto());
		result.setSurname(provider.getSurname());
		result.setVat(provider.getVat());
		result.setCardNumber(provider.getCardNumber());
		result.setMake(provider.getMake());

		// Not updated attributes
		result.setId(temp.getId());
		result.setVersion(temp.getVersion());
		result.setIsSpammer(temp.getIsSpammer());
		result.setIsBanned(temp.getIsBanned());


		// Relantionships
		result.setMessages(temp.getMessages());
		result.setItems(temp.getItems());
		result.setSocialProfiles(temp.getSocialProfiles());
		result.setUserAccount(temp.getUserAccount());

		this.validator.validate(result, binding);

		return result;
	}

}
