
package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import domain.Auditor;
import services.AuditorService;
import utilities.AbstractTest;
import utilities.Md5;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class AdminCreateAuditorTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private AuditorService auditorService;


	// Test ------------------------------------------------------
	/*
	 * An actor who is authenticated as an Admin must be able to:
	 * 			Create an Auditor Account.
	 * 
	 * 01- All ok - Positive test
	 * 02- Admin is not autheticate - Negative test - error
	 * 03- Blank password - Negative test - error
	 * 04- Blank username - Negative test - error
	 * 05- Blank name - Negative test - error
	 * 06- Blank surname - Negative test - error
	 * 07- Blank vat - Negative test - error
	 * 08- Blank cardNumber - Negative test - error
	 * 09- Blank mail - Negative test - error
	 * 10- Blank phoneNumber - Negative test - error
	 */

	@Test
	public void driver() {
		final Object testingData[][] = {
			{
				null, "admin", "password", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", "+34647738712"
			}, {
				IllegalArgumentException.class, "", "password", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "password", "", "name", "surname", 2, "378721273855309", "test@gmail.com", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "password", "userName", "", "surname", 2, "378721273855309", "test@gmail.com", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "password", "userName", "name", "", 2, "378721273855309", "test@gmail.com", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "password", "userName", "name", "surname", null, "378721273855309", "test@gmail.com", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "password", "userName", "name", "surname", 2, "", "test@gmail.com", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "password", "userName", "name", "surname", 2, "378721273855309", "", "+341234"
			}, {
				DataIntegrityViolationException.class, "admin", "password", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", ""
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.template((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3], (String) testingData[i][4], (String) testingData[i][5], (Integer) testingData[i][6], (String) testingData[i][7],
				(String) testingData[i][8], (String) testingData[i][9]);
	}

	// Ancillary methods ------------------------------------------------------
	protected void template(Class<?> expected, String principal, String pass, String userName, String name, String surname, Integer vat, String cardNumber, String email, String phoneNumber) {
		Class<?> caught;
		caught = null;
		int i;
		int ii;

		try {
			String password;

			i = this.auditorService.findAll().size();

			super.authenticate(principal);

			// Create new Auditor
			Auditor auditor = this.auditorService.create();

			// Auditor userAccount
			password = Md5.encodeMd5(pass);
			auditor.getUserAccount().setPassword(password);
			auditor.getUserAccount().setUsername(userName);

			// Actor attributes
			auditor.setName(name);
			auditor.setSurname(surname);
			auditor.setVat(vat);
			auditor.setCardNumber(cardNumber);
			auditor.setEmail(email);
			auditor.setPhoneNumber(phoneNumber);

			// Save new Auditor
			this.auditorService.save(auditor);

			ii = this.auditorService.findAll().size();

			Assert.isTrue(ii > i);

			super.unauthenticate();

		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}

}
