
package usecases;

import java.util.Calendar;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import services.PositionService;
import services.ProviderService;
import services.SponsorshipService;
import utilities.AbstractTest;
import domain.Position;
import domain.Sponsorship;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class ManageSponsorshipTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private SponsorshipService	sponsorshipService;

	// Supporting systems ------------------------------------------------------
	@Autowired
	private ProviderService	providerService;
	@Autowired
	private PositionService	positionService;


	// Test ------------------------------------------------------
	/*
	 * An actor who is authenticated as a provider must be able to manage their sponsorships
	 * CREATE
	 * 
	 * 01- All ok
	 * 02- Incorrect url target page; 	Error
	 * 03- Incorrect url banner; 		Error
	 * 04- Incorrect card number;		Error
	 * 05- not authenticated; 	Error
	 */

	@Test
	public void driverCreate() {
		Calendar fecha = Calendar.getInstance();
		fecha.add(Calendar.HOUR, 24);

		final Object testingData[][] = {
			{// exception, banner, target page, credit card number
				null, "provider1", "https://goo.gl/mR1tJ6", "http://www.targetPage.com", "5145928616769391"
			}, {
				IllegalArgumentException.class, "", "https://goo.gl/mR1tJ6", "http://www.targetPage.com", "5145928616769391"
			}, {
				ConstraintViolationException.class, "provider1", "banner", "http://www.targetPage.com", "5145928616769391"
			}, {
				ConstraintViolationException.class, "provider1", "https://goo.gl/mR1tJ6", "http://www.targetPage.com", "11111"
			}, {
				ConstraintViolationException.class, "provider1", "https://goo.gl/mR1tJ6", "targetPage", "5145928616769391"
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.createTemplate((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3],
				(String) testingData[i][4]);
	}
	/*
	 * ------------------------------------------------------------------------------------------------------------------------------------------
	 * An actor who is authenticated as a provider must be able to manage their sponsorships
	 * DELETE
	 * 
	 * 01- All ok
	 * 02- Delete sponsorship of other provider; Error
	 */

	//	@Test
	//	public void driverDelete() {
	//		final Object testingData[][] = {
	//			{
	//				null, null
	//			}, {
	//				IllegalArgumentException.class, "provider2"
	//			}
	//		};
	//
	//		for (int i = 0; i < testingData.length; i++)
	//			this.deleteTemplate((Class<?>) testingData[i][0], (String) testingData[i][1]);
	//	}
	/*
	 * ------------------------------------------------------------------------------------------------------------------------------------------
	 * An actor who is authenticated as a provider must be able to manage their sponsorships
	 * CANCEL
	 * 
	 * 01- All ok
	 * 02- Cancel sponsorship of other provider; Error
	 * 03- Cancel sponsorship in draft mode; Error
	 */
	//
	//	@Test
	//	public void driverCancel() {
	//		final Object testingData[][] = {
	//			{
	//				null, null, true
	//			}, {
	//				IllegalArgumentException.class, "provider2", true
	//			}, {
	//				IllegalArgumentException.class, null, false
	//			}
	//		};
	//
	//		for (int i = 0; i < testingData.length; i++)
	//			this.cancelTemplate((Class<?>) testingData[i][0], (String) testingData[i][1], (Boolean) testingData[i][2]);
	//	}

	// Ancillary methods ------------------------------------------------------
	protected void createTemplate(Class<?> expected, String username, String banner, String targetPage, String card) {
		Class<?> caught;
		caught = null;

		try {
			int i;
			i = this.sponsorshipService.findAll().size();

			super.authenticate(username);

			// Create new Sponsorship
			Sponsorship sponsorship = this.sponsorshipService.create();

			// Sponsorship attibutes
			sponsorship.setProvider(this.providerService.findByPrincipal());
			sponsorship.setBanner(banner);
			sponsorship.setCreditCard(card);
			sponsorship.setTargetPage(targetPage);
			sponsorship.setPosition((Position) this.positionService.findAllFinal().toArray()[0]);

			// Save new Sponsorship
			this.sponsorshipService.save(sponsorship);

			Assert.isTrue(this.sponsorshipService.findAll().size() > i);

			super.unauthenticate();
			this.sponsorshipService.flush();
		} catch (Throwable oops) {
			caught = oops.getClass();
			oops.printStackTrace();
		}
		super.checkExceptions(expected, caught);
	}
	//	protected void deleteTemplate(Class<?> expected, String username) {
	//		Class<?> caught;
	//		caught = null;
	//
	//		try {
	//			int i;
	//			i = this.sponsorshipService.findAll().size();
	//
	//			super.authenticate("provider1");
	//
	//			for (Sponsorship sponsorship : new ArrayList<Sponsorship>(this.providerService.findByPrincipal().getSponsorships())) {
	//				if(!sponsorship.getFinalMode()){
	//					if (username != null) {
	//						super.unauthenticate();
	//						super.authenticate(username);
	//					}
	//					this.sponsorshipService.delete(sponsorship);
	//
	//				}
	//			}
	//
	//			Assert.isTrue(this.sponsorshipService.findAll().size() < i);
	//
	//			super.unauthenticate();
	//		} catch (Throwable oops) {
	//			caught = oops.getClass();
	//		}
	//		super.checkExceptions(expected, caught);
	//	}
	//	protected void cancelTemplate(Class<?> expected, String username, Boolean finalMode) {
	//		Class<?> caught;
	//		caught = null;
	//		Sponsorship cancelled = null;
	//
	//		try {
	//
	//			super.authenticate("provider1");
	//
	//			for (Sponsorship sponsorship : new ArrayList<Sponsorship>(this.providerService.findByPrincipal().getSponsorships())) {
	//				if (sponsorship.getFinalMode().equals(finalMode)) {
	//					if (username != null) {
	//						super.unauthenticate();
	//						super.authenticate(username);
	//					}
	//					cancelled = sponsorship;
	//					this.sponsorshipService.cancel(sponsorship);
	//					break;
	//				}
	//			}
	//
	//			Assert.isTrue(cancelled.getCancelled());
	//
	//			super.unauthenticate();
	//		} catch (Throwable oops) {
	//			caught = oops.getClass();
	//		}
	//		super.checkExceptions(expected, caught);
	//	}

}
