package services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.PersonalData;
import domain.Rookie;
import repositories.PersonalDataRepository;

@Service
@Transactional
public class PersonalDataService {

	// Manage Repository
	@Autowired
	private PersonalDataRepository	personalDataRepository;

	// Supporting services
	@Autowired
	private RookieService			rookieService;


	// CRUD methods
	public PersonalData create() {
		final PersonalData result = new PersonalData();

		return result;
	}

	public PersonalData findOne(final int personalDataID) {
		final PersonalData result = this.personalDataRepository.findOne(personalDataID);
		Assert.notNull(result);

		return result;
	}

	public PersonalData save(final PersonalData personalData) {
		boolean nuevo = false;
		final Rookie principal = this.rookieService.findByPrincipal();
		Assert.notNull(personalData);
		Assert.isTrue(principal.getCurriculas().contains(personalData.getCurricula()));

		if (personalData.getId() == 0) {
			Assert.isNull(personalData.getCurricula().getPersonalData());
			nuevo = true;
		}
		final PersonalData result = this.personalDataRepository.save(personalData);

		if (nuevo)
			result.getCurricula().setPersonalData(result);

		return result;
	}

	public void delete(final PersonalData personalData) {
		Assert.notNull(personalData);
		final Rookie principal = this.rookieService.findByPrincipal();
		Assert.isTrue(principal.getCurriculas().contains(personalData.getCurricula()));

		personalData.getCurricula().setPersonalData(null);

		this.personalDataRepository.delete(personalData);
	}
	/*** Other methods ***/
	
	public void flush() {
		this.personalDataRepository.flush();
	}
}