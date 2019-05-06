
package usecases;

import java.util.ArrayList;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import services.AuditorService;
import services.PositionService;
import utilities.AbstractTest;
import domain.Auditor;
import domain.Position;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class AuditorAssignPositionTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private PositionService	positionService;

	// Supporting systems ------------------------------------------------------
	@Autowired
	private AuditorService	auditorService;


	// Test ------------------------------------------------------
	/*
	 * An actor who is authenticated as an auditor must be able to self-assign a position
	 * 
	 * 01- All ok
	 * 02- Assign to another auditor; 	Error
	 * 03- Assign being unauthenticated; Error
	 */

	@Test
	public void driver() {

		final Object testingData[][] = {
			{
				IllegalArgumentException.class, null, "auditor1"
			}, {
				IllegalArgumentException.class, "auditor1", "auditor2"
			}, {
				null, "auditor1", "auditor1"
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.template((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2]);
	}

	// Ancillary methods ------------------------------------------------------
	protected void template(Class<?> expected, String username, String username2) {
		Class<?> caught;
		caught = null;
		Position assign = null;

		try {
			ArrayList<Position> positions = new ArrayList<Position>(this.positionService.findAllFinal());

			// Get final position without auditor
			for(Position position:positions){
				if(position.getAuditor() == null)
					assign = position;
			}

			// Get auditor to assign and pricipal
			super.authenticate(username2);
			Auditor auditor = this.auditorService.findByPrincipal();

			super.unauthenticate();
			super.authenticate(username);

			//Assign the position
			System.out.println(assign.toString());
			assign = this.positionService.assign(assign, auditor);

			Assert.notNull(assign.getAuditor());
			this.positionService.flush();
			super.unauthenticate();
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}
}