
package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;

import domain.Application;
import domain.Finder;
import domain.Message;
import domain.Rookie;
import domain.SocialProfile;
import forms.RookieForm;
import repositories.RookieRepository;
import security.Authority;
import security.LoginService;
import security.UserAccount;

@Service
@Transactional
public class RookieService {

	// Manage Repository
	@Autowired
	private RookieRepository		rookieRepository;

	// Supporting services
	@Autowired
	private ApplicationService 		applicationService;
	
	@Autowired
	private SocialProfileService 	socialIdentityService;
	
	@Autowired
	private FinderService			finderService;

	// Validator
	@Autowired
	private Validator				validator;


	/*************************************
	 * CRUD methods
	 *************************************/
	public Rookie create() {

		Rookie rookie = new Rookie();

		// Initialice
		UserAccount userAccount = new UserAccount();
		Collection<Authority> authorities = new ArrayList<Authority>();
		Authority authority = new Authority();
		authority.setAuthority(Authority.HACKER);
		authorities.add(authority);
		userAccount.setAuthorities(authorities);
		Finder finder = this.finderService.create();
		
		// Set Messages
		Collection<Message> messages = new ArrayList<Message>();

		rookie.setUserAccount(userAccount);
		rookie.setMessages(messages);
		rookie.setFinder(finder);
		rookie.setIsSpammer(false);

		return rookie;

	}

	public Collection<Rookie> findAll() {
		final Collection<Rookie> result = this.rookieRepository.findAll();
		Assert.notNull(result);
		Assert.notEmpty(result);

		return result;
	}

	public Rookie findOne(int adminID) {
		Rookie result = this.rookieRepository.findOne(adminID);
		Assert.notNull(result);
		return result;
	}

	public Rookie save(Rookie rookie) {
		Assert.notNull(rookie);
		Rookie result = this.rookieRepository.save(rookie);

		return result;
	}

	public void delete(Rookie rookie) {
		Assert.isTrue(this.findByPrincipal() == rookie);
		Assert.notNull(rookie);

		Iterator<Application> applications	= new ArrayList<Application>(rookie.getApplications()).iterator();
		Iterator<SocialProfile> socialIs 	= new ArrayList<SocialProfile>(rookie.getSocialProfiles()).iterator();

		while (applications.hasNext()) {
			Application next = applications.next();
			this.applicationService.delete(next.getId());
			rookie.getApplications().remove(next);
			applications.remove();
		}
	
		while (socialIs.hasNext()) {
			SocialProfile si = socialIs.next();
			this.socialIdentityService.delete(si);
			rookie.getSocialProfiles().remove(si);
			socialIs.remove();
		}
		
//		rookie.setMessageBoxes(new ArrayList<MessageBox>());
//		this.messageBoxService.deleteAll(rookie);
		
		this.rookieRepository.delete(rookie);

	}

	/**************************************************************
	 * Reconstruct object, check validity and update binding
	 **************************************************************/

	/** Form Object **/
	public Rookie reconstruct(RookieForm rookieForm, BindingResult binding) {
		Rookie result = this.create();

		// UserAccount
		result.getUserAccount().setPassword(rookieForm.getUserAccount().getPassword());
		result.getUserAccount().setUsername(rookieForm.getUserAccount().getUsername());

		// Hacker Attributes
		result.setName(rookieForm.getName());
		result.setSurname(rookieForm.getSurname());
		result.setVat(rookieForm.getVat());
		result.setCardNumber(rookieForm.getCardNumber());
		result.setPhoto(rookieForm.getPhoto());
		result.setEmail(rookieForm.getEmail());
		result.setPhoneNumber(rookieForm.getPhoneNumber());
		result.setAddress(rookieForm.getAddress());

		// Default attributes from Actor
		result.setUsername(rookieForm.getUserAccount().getUsername());
		result.setIsBanned(false);

		this.validator.validate(result, binding);

		return result;
	}

	/** Pruned Object **/
	public Rookie reconstruct(Rookie rookie, BindingResult binding) {
		Rookie result = this.create();
		Rookie temp = this.findOne(rookie.getId());

		// Check the principal is updating his own data.
		Assert.isTrue(this.findByPrincipal().getId() == rookie.getId());

		// Updated attributes
		result.setName(rookie.getName());
		result.setSurname(rookie.getSurname());
		result.setVat(rookie.getVat());
		result.setCardNumber(rookie.getCardNumber());
		result.setPhoto(rookie.getPhoto());
		result.setEmail(rookie.getEmail());
		result.setPhoneNumber(rookie.getPhoneNumber());
		result.setAddress(rookie.getAddress());

		// Not updated attributes
		result.setId(temp.getId());
		result.setVersion(temp.getVersion());
		result.setUsername(temp.getUsername());
		result.setIsSpammer(temp.getIsSpammer());
		result.setIsBanned(temp.getIsBanned());

		// Relantionships from Hacker
		result.setApplications(temp.getApplications());
		result.setFinder(temp.getFinder());

		// Relatienships from Actor
		result.setUserAccount(temp.getUserAccount());
		result.setSocialProfiles(temp.getSocialProfiles());

		this.validator.validate(result, binding);

		return result;
	}

	/*************************************
	 * Other business methods
	 *************************************/
	public Rookie findByPrincipal() {
		Rookie result;
		UserAccount userAccount;

		userAccount = LoginService.getPrincipal();
		Assert.notNull(userAccount);

		result = this.findByUserAccount(userAccount);
		Assert.notNull(result);

		return result;
	}

	public Rookie findByUserAccount(final UserAccount userAccount) {
		Assert.notNull(userAccount);

		Rookie result;

		result = this.rookieRepository.findByUserAccountId(userAccount.getId());

		return result;
	}

	public Rookie findOneByUsername(final String username) {
		Assert.notNull(username);

		return this.rookieRepository.findByUserName(username);
	}

	public Rookie findByFinder(final Finder finder) {
		Assert.notNull(finder);

		return this.rookieRepository.findByFinder(finder.getId());
	}
}
