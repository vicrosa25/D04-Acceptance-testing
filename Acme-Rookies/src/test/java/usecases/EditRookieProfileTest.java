
package usecases;

import javax.transaction.Transactional;
import javax.validation.ConstraintViolationException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;

import domain.Rookie;
import services.RookieService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class EditRookieProfileTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private RookieService rookieService;


	// Test ------------------------------------------------------
	/*
	 * An actor who is not authenticated must be able to:
	 * Register to the system as a Rookie.
	 * 
	 * 01- Positive test, OK
	 * 02- Negative test, Blank name; Error
	 */

	@Test
	public void driver() {
		final Object testingData[][] = {
			{
				null, "name", "surname", 2, "378721273855309", "test@gmail.com", "+341234"
			}, {
				ConstraintViolationException.class, "", "surname", 2, "378721273855309", "test@gmail.com", "+341234"
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.template((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], 
						 (Integer) testingData[i][3],  (String) testingData[i][4], (String) testingData[i][5],
						 (String) testingData[i][6]);
	}

	// Ancillary methods ------------------------------------------------------
	protected void template(Class<?> expected, String name, String surname, Integer vat, String cardNumber, 
							String email, String phoneNumber) {
		Class<?> caught;
		caught = null;
		BindingResult binding = null;

		try {
			
			// Authenticate as 'rookie1'
			super.authenticate("rookie1");
			Rookie rookie1 = this.rookieService.findByPrincipal();
			int version = rookie1.getVersion();


			// Actor attributes
			rookie1.setName(name);
			rookie1.setSurname(surname);
			rookie1.setVat(vat);
			rookie1.setCardNumber(cardNumber);
			rookie1.setEmail(email);
			rookie1.setPhoneNumber(phoneNumber);
			

			// Update Rookie1
			rookie1 = this.rookieService.reconstruct(rookie1, binding);
			
			this.rookieService.save(rookie1);
			
			// Check effectively change Rookie1.
			Assert.isTrue(rookie1.getVersion() != version);
			super.unauthenticate();
			
			
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}

}




