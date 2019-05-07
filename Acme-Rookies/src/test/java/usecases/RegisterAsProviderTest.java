
package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.util.Assert;

import services.ProviderService;
import utilities.AbstractTest;
import utilities.Md5;
import domain.Provider;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class RegisterAsProviderTest extends AbstractTest {

	// System under test ------------------------------------------------------
	@Autowired
	private ProviderService	providerService;


	// Test ------------------------------------------------------
	/*
	 * An actor who is not authenticated must be able to:
	 * Register to the system as a Provider.
	 * 
	 * 01- All ok
	 * 02- Blank password; Error
	 * 03- Blank username; Error
	 * 04- Blank name; Error
	 * 05- Blank surname; Error
	 * 06- Blank vat; Error
	 * 07- Blank cardNumber; Error
	 * 08- Blank mail; Error
	 * 09- Blank phoneNumber; Error
	 * 10- Blank commercialName; Error
	 * 11- Negative VAT; Error
	 */

	@Test
	public void driver() {
		final Object testingData[][] = {
			{
				null, "password", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "", "name", "surname", 2, "378721273855309", "test@gmail.com", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "userName", "", "surname", 2, "378721273855309", "test@gmail.com", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "userName", "name", "", 2, "378721273855309", "test@gmail.com", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "userName", "name", "surname", null, "378721273855309", "test@gmail.com", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "userName", "name", "surname", 2, "", "test@gmail.com", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "userName", "name", "surname", 2, "378721273855309", "", "+341234", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", "", "ProviderName"
			}, {
				DataIntegrityViolationException.class, "password", "userName", "name", "surname", 2, "378721273855309", "test@gmail.com", "+346547", ""
			}, {
				DataIntegrityViolationException.class, "password", "userName", "name", "surname", -1, "378721273855309", "test@gmail.com", "+346547", "ProviderName"
			}
		};

		for (int i = 0; i < testingData.length; i++)
			this.template((Class<?>) testingData[i][0], (String) testingData[i][1], (String) testingData[i][2], (String) testingData[i][3],
				(String) testingData[i][4], (Integer) testingData[i][5], (String) testingData[i][6], (String) testingData[i][7],
				(String) testingData[i][8], (String) testingData[i][9]);
	}

	// Ancillary methods ------------------------------------------------------
	protected void template(Class<?> expected, String pass, String userName, String name, String surname, Integer vat, String cardNumber, String email, String phoneNumber, String make) {
		Class<?> caught;
		caught = null;

		try {
			String password;
			int i;
			i = this.providerService.findAll().size();

			super.authenticate(null);

			// Create new Provider
			Provider provider = this.providerService.create();

			// Provider userAccount
			password = Md5.encodeMd5(pass);
			provider.getUserAccount().setPassword(password);
			provider.getUserAccount().setUsername(userName);

			// Actor attributes
			provider.setName(name);
			provider.setSurname(surname);
			provider.setVat(vat);
			provider.setCardNumber(cardNumber);
			provider.setEmail(email);
			provider.setPhoneNumber(phoneNumber);
			provider.setIsBanned(false);

			// Provider attributes
			provider.setMake(make);


			// Save new Provider
			this.providerService.save(provider);

			Assert.isTrue(this.providerService.findAll().size() > i);

			super.unauthenticate();
		} catch (Throwable oops) {
			caught = oops.getClass();
		}
		super.checkExceptions(expected, caught);
	}

}
