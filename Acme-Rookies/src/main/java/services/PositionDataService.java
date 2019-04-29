
package services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import domain.PositionData;
import domain.Rookie;
import repositories.PositionDataRepository;

@Service
@Transactional
public class PositionDataService {

	// Manage Repository
	@Autowired
	private PositionDataRepository	positionDataRepository;

	// Supporting services
	@Autowired
	private RookieService			rookieService;


	// CRUD methods
	public PositionData create() {
		final PositionData result = new PositionData();

		return result;
	}

	public PositionData findOne(final int positionDataID) {
		final PositionData result = this.positionDataRepository.findOne(positionDataID);
		Assert.notNull(result);

		return result;
	}

	public Collection<PositionData> findAll() {
		final Collection<PositionData> result = this.positionDataRepository.findAll();
		Assert.notNull(result);

		return result;
	}
	public PositionData save(final PositionData positionData) {
		boolean nuevo = false;
		final Rookie principal = this.rookieService.findByPrincipal();
		Assert.notNull(positionData);
		Assert.isTrue(principal.getCurriculas().contains(positionData.getCurricula()));

		if (positionData.getId() == 0)
			nuevo = true;
		final PositionData result = this.positionDataRepository.save(positionData);

		if (nuevo)
			result.getCurricula().getPositionData().add(result);

		return result;
	}

	public void delete(final PositionData positionData) {
		Assert.notNull(positionData);
		final Rookie principal = this.rookieService.findByPrincipal();
		Assert.isTrue(principal.getCurriculas().contains(positionData.getCurricula()));

		positionData.getCurricula().getPositionData().remove(positionData);

		this.positionDataRepository.delete(positionData);
	}
	/*** Other methods ***/

	public void flush() {
		this.positionDataRepository.flush();
	}
}
