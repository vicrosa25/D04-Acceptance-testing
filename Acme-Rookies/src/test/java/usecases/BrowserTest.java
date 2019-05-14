
package usecases;

import java.util.Collection;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import services.PositionService;
import utilities.AbstractTest;
import domain.Position;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class BrowserTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private PositionService	positionService;

	// Supporting systems ------------------------------------------------------


	// Test ------------------------------------------------------
	/*
	 * An actor who is not authenticated must be able to
	 * search for a position using a single key word.
	 * 
	 * This use case cannot have negative tests due to it´s nature.
	 * 
	 * 01- Blank keyword - all positions expected
	 * 02- Weird keyword - no positions expected
	 * 03- Title of a specific position - one position expected
	 */

	@Test
	public void driver() {
		final Object testingData[][] = {
			{
				null, "", this.positionService.findAllFinal().size()
			}, {
				null, "qweqweqweqweqwe", 0
			}, {
				null, "Programador en  javascript", 1
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.template((Class<?>) testingData[i][0], (String) testingData[i][1], (Integer) testingData[i][2]);
	}

	// Ancillary methods ------------------------------------------------------

	protected void template(Class<?> expected, String keyword, Integer results) {
		Class<?> caught;
		caught = null;
		Collection<Position> result;

		try {
			super.unauthenticate();

			result = this.positionService.findByKeyword(keyword);

			Assert.isTrue(result.size() == results);
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}
}
