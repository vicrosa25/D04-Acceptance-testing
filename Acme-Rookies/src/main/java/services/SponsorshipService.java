
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

import repositories.SponsorshipRepository;
import domain.Position;
import domain.Sponsorship;

@Service
@Transactional
public class SponsorshipService {

	// Manage Repository
	@Autowired
	private SponsorshipRepository	sponsorshipRepository;

	@Autowired
	private ProviderService			providerService;

	@Autowired
	private ActorService			actorService;

	@Autowired
	@Qualifier("validator")
	private Validator				validator;


	// CRUD methods
	public Sponsorship create() {
		final Sponsorship result = new Sponsorship();

		return result;
	}

	public Sponsorship findOne(final int sponsorshipID) {
		final Sponsorship result = this.sponsorshipRepository.findOne(sponsorshipID);
		Assert.notNull(result);

		return result;
	}

	public Collection<Sponsorship> findAll() {
		final Collection<Sponsorship> result = this.sponsorshipRepository.findAll();
		Assert.notNull(result);

		return result;
	}

	public Sponsorship save(final Sponsorship sponsorship) {
		Assert.notNull(sponsorship);
		Assert.isTrue(sponsorship.getPosition().getFinalMode());
		if(sponsorship.getId() == 0){
			sponsorship.getProvider().getSponsorships().add(sponsorship);
		}else
			Assert.isTrue(this.providerService.findByPrincipal().getSponsorships().contains(sponsorship));

		final Sponsorship result = this.sponsorshipRepository.save(sponsorship);

		return result;
	}

	public void delete(final Sponsorship sponsorship) {
		Assert.notNull(sponsorship);
		Assert.isTrue(sponsorship.getProvider() == this.providerService.findByPrincipal());

		sponsorship.getProvider().getSponsorships().remove(sponsorship);

		this.sponsorshipRepository.delete(sponsorship);
	}

	// Other business methods
	public Collection<Sponsorship> findByProvider(final int providerId) {
		final Collection<Sponsorship> result = this.sponsorshipRepository.findByProvider(providerId);
		Assert.notNull(result);
		return result;
	}

	public Sponsorship reconstruct(final Sponsorship sponsorship, final BindingResult binding) {
		final Sponsorship result = this.create();

		// updated atributes
		result.setBanner(sponsorship.getBanner());
		result.setCreditCard(sponsorship.getCreditCard());
		result.setPosition(sponsorship.getPosition());
		result.setTargetPage(sponsorship.getTargetPage());
		result.setProvider(this.providerService.findByPrincipal());

		if (sponsorship.getId() != 0) {
			//not updated atributes
			result.setId(sponsorship.getId());
			result.setVersion(sponsorship.getVersion());
		}

		this.validator.validate(result, binding);

		return result;
	}

	public ArrayList<Sponsorship> findByPosition(final Position position) {
		Assert.notNull(position);
		final ArrayList<Sponsorship> result = new ArrayList<Sponsorship>(this.sponsorshipRepository.findByPosition(position.getId()));
		Assert.notNull(result);

		return result;
	}

	public void flush() {
		this.sponsorshipRepository.flush();
	}
}
