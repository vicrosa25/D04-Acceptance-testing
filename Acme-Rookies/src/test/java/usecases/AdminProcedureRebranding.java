
package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import domain.Message;
import services.MessageService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class AdminProcedureRebranding extends AbstractTest {

	// System under test ---------------------------------------------------------------------------
	@Autowired
	private MessageService messageServcie;


	// Tests -----------------------------------------------------------------------------------------

	/**
	 * Requirement: An actor who is authenticated as an Admin must be able to:
	 * 
	 * "Run a procedure to notify the existing users of the rebranding"
	 * 
	 * 1. Positive test.
	 * 
	 **/
	@Test
	public void rebrandingPositive() {
		Message message;
		
		super.authenticate("admin");

		message = this.messageServcie.createRebrandingMessage();
		
		this.messageServcie.save(message);

		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an Admin must be able to:
	 * 
	 * "Run a procedure to notify the existing users of the rebranding"
	 * 
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void rebrandingNegative() {
		Message message;
		
		super.authenticate(null);

		message = this.messageServcie.createRebrandingMessage();
		
		this.messageServcie.save(message);

		super.unauthenticate();
	}

}
