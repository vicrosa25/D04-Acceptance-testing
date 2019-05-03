
package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import services.AdministratorService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class AdminAuditScoreTest extends AbstractTest {

	// System under test ---------------------------------------------------------------------------
	@Autowired
	private AdministratorService administratorService;

	// Tests -----------------------------------------------------------------------------------------

	/**
	 * Requirement: An actor who is authenticated as an Admin must be able to:
	 * 
	 * 		"Launch a process to compute an audit score for every company"
	 * 
	 * 1. Positive test.
	 * 
	 **/
	@Test
	public void scorePositive() {
		super.authenticate("admin");
		
		this.administratorService.computeAllScores();
		
		super.unauthenticate();
	}
	
	
	
	/**
	 * Requirement: An actor who is authenticated as an Admin must be able to:  
	 * 
	 * 		"Launch a process to compute an audit score for every company"
	 *  
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 *  
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void scoreNegative() {
		super.authenticate(null);
		
		this.administratorService.computeAllScores();
		
		super.unauthenticate();
	}

}
