
package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import domain.Finder;
import services.FinderService;
import services.PositionService;
import services.RookieService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ManageFinderTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private FinderService	finderService;

	// Supporting systems ------------------------------------------------------
	@Autowired
	private RookieService	rookieService;
	@Autowired
	private PositionService	positionService;


	// Test ------------------------------------------------------
	/*
	 * An actor who is authenticated as a rookie must be able to manage his/her finder
	 * This test consists in update the finder, check the results, clear the finder and check the results again
	 */

	@Test
	public void testFinder() {
		super.authenticate("rookie1");

		Finder finder = this.rookieService.findByPrincipal().getFinder();

		finder.setKeyword("aoiethjsbipogjasket09ihopsrt"); // keyword that no position has, so the results must be empty

		finder = this.finderService.checkChanges(finder);
		Assert.isTrue(finder.getPositions().size() == 0);

		finder = this.finderService.clear(finder);
		Assert.isTrue(finder.getPositions().size() == this.positionService.findAllFinal().size());

		this.finderService.clear(finder);
	}
}
