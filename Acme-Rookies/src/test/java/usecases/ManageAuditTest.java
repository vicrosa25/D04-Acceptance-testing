
package usecases;

import java.util.ArrayList;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import services.AuditService;
import services.AuditorService;
import services.PositionService;
import utilities.AbstractTest;
import domain.Audit;
import domain.Position;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ManageAuditTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private AuditService	auditService;

	// Supporting systems ------------------------------------------------------
	@Autowired
	private AuditorService	auditorService;
	@Autowired
	private PositionService	positionService;


	// Test ------------------------------------------------------
	/*
	 * An actor who is authenticated as a auditor must be able to manage their database of audits
	 * CREATE
	 * 
	 * 01- All ok
	 * 02- No text; Error
	 * 03- Not authenticated; Error
	 * 04- Negative score; Error
	 */

	@Test
	public void driverCreate() {
		final Object testingData[][] = {
			{
				null, "auditor1", "Test text", 5
			}, {
				ConstraintViolationException.class, "auditor1", "", 5
			}, {
				IllegalArgumentException.class, "", "Test text", 5
			}, {
				ConstraintViolationException.class, "auditor1", "Test text", -5
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.createTemplate((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (Integer) testingData[i][3]);
	}
	/*
	 * ------------------------------------------------------------------------------------------------------------------------------------------
	 * An actor who is authenticated as an auditor must be able to manage their audits
	 * DELETE
	 * 
	 * 01- All ok
	 * 02- Delete audit of other auditor; Error
	 */

	@Test
	public void driverDelete() {
		final Object testingData[][] = {
			{
				IllegalArgumentException.class, "auditor2"
			}, {
				null, null
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.deleteTemplate((Class<?>) testingData[i][0], (String) testingData[i][1]);
	}

	// Ancillary methods ------------------------------------------------------
	protected void createTemplate(Class<?> expected, String username, String text, Integer score) {
		Class<?> caught;
		caught = null;

		try {
			super.startTransaction();
			super.unauthenticate();
			super.authenticate(username);

			// Create new Audit
			Audit audit = this.auditService.create();

			// Audit attibutes
			Position position = null;
			ArrayList<Position> positions = new ArrayList<Position>(this.positionService.findAllFinal());

			// Get final position without auditor
			for(Position pos:positions){
				if(pos.getAuditor() == this.auditorService.findByPrincipal())
					position = pos;
			}
			audit.setScore(score);
			audit.setText(text);
			audit.setFinalMode(false);
			audit.setPosition(position);

			// Save new Audit
			audit = this.auditService.save(audit);

			Assert.isTrue(this.auditorService.findByPrincipal().getAudits().contains(audit));

			super.unauthenticate();
			super.commitTransaction();
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}
	protected void deleteTemplate(Class<?> expected, String username) {
		Class<?> caught;
		caught = null;
		Audit delete = null;

		try {
			super.authenticate("auditor1");

			for (Audit audit : new ArrayList<Audit>(this.auditorService.findByPrincipal().getAudits())) {
				if (!audit.getFinalMode()) {
					if (username != null) {
						super.unauthenticate();
						super.authenticate(username);
					}
					delete = audit;
					this.auditService.delete(audit);

				}
			}

			Assert.isTrue(!this.auditorService.findByPrincipal().getAudits().contains(delete));

			super.unauthenticate();
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}

}
