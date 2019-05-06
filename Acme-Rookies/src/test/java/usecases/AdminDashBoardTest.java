
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
public class AdminDashBoardTest extends AbstractTest {

	// System under test ---------------------------------------------------------------------------
	@Autowired
	private AdministratorService adminService;


	/********************************* Dashboard Level C **************************************************/
	// Tests Query1-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 1: The average, the minimum, the maximum, and the standard deviation of the number
	 * of positions per company
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query1Positive() {
		super.authenticate("admin");
		this.adminService.query1();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 1: The average, the minimum, the maximum, and the standard deviation of the number
	 * of positions per company
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query1Negative() {
		super.authenticate(null);
		this.adminService.query1();
		super.unauthenticate();
	}

	// Tests Query2-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 2: The average, the minimum, the maximum, and the standard deviation of the
	 * number of applications per hacker
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query2Positive() {
		super.authenticate("admin");
		this.adminService.query2();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 2: The average, the minimum, the maximum, and the standard deviation of the
	 * number of applications per hacker
	 *
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query2Negative() {
		super.authenticate(null);
		this.adminService.query2();
		super.unauthenticate();
	}

	// Tests Query3-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 3: The companies that have offered more positions.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query3Positive() {
		super.authenticate("admin");
		this.adminService.query3();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 3: The companies that have offered more positions.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query3Negative() {
		super.authenticate(null);
		this.adminService.query3();
		super.unauthenticate();
	}

	// Tests Query4-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 4: The hackers who have made more applications.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query4Positive() {
		super.authenticate("admin");
		this.adminService.query4();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 4: The hackers who have made more applications.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query4Negative() {
		super.authenticate(null);
		this.adminService.query4();
		super.unauthenticate();
	}

	// Tests Query5-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 5: The average, the minimum, the maximum, and the standard deviation of the
	 * the salaries offered.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query5Positive() {
		super.authenticate("admin");
		this.adminService.query5();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 5: The average, the minimum, the maximum, and the standard deviation of the
	 * the salaries offered.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query5Negative() {
		super.authenticate(null);
		this.adminService.query5();
		super.unauthenticate();
	}

	// Tests Query6-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 6: The best and the worst position in terms of salary
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query6Positive() {
		super.authenticate("admin");
		this.adminService.query6a();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 6: The best and the worst position in terms of salary
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query6Negative() {
		super.authenticate(null);
		this.adminService.query6b();
		super.unauthenticate();
	}

	/*********************************
	 * 
	 * Dashboard Level B
	 * 
	 *********************************/

	// Tests Query7-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 7: The average, the minimum, the maximum, and the standard deviation of the number
	 * of curricula per hacker
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query7Positive() {
		super.authenticate("admin");
		this.adminService.query7();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 7: The average, the minimum, the maximum, and the standard deviation of the number
	 * of curricula per hacker
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query7Negative() {
		super.authenticate(null);
		this.adminService.query7();
		super.unauthenticate();
	}

	// Tests Query8-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 8: The average, the minimum, the maximum, and the standard deviation of the number
	 * of results in the finders.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query8Positive() {
		super.authenticate("admin");
		this.adminService.query8();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 8: The average, the minimum, the maximum, and the standard deviation of the number
	 * of results in the finders.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query8Negative() {
		super.authenticate(null);
		this.adminService.query8();
		super.unauthenticate();
	}

	// Tests Query9-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 9: The ratio of empty versus non-empty finders
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query9Positive() {
		super.authenticate("admin");
		this.adminService.query9();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 9: The ratio of empty versus non-empty finders
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query9Negative() {
		super.authenticate(null);
		this.adminService.query9();
		super.unauthenticate();
	}

	// Tests Query10-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 10: The average, the minimum, the maximum, and the standard deviation of the audit score of
	 * the positions stored in the system.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query10Positive() {
		super.authenticate("admin");
		this.adminService.query10();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 10: The average, the minimum, the maximum, and the standard deviation of the audit score of
	 * the positions stored in the system.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query10Negative() {
		super.authenticate(null);
		this.adminService.query10();
		super.unauthenticate();
	}

	// Tests Query11-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 11: The average, the minimum, the maximum, and the standard deviation of the
	 * audit score of the companies that are registered in the system.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query11Positive() {
		super.authenticate("admin");
		this.adminService.query11();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 11: The average, the minimum, the maximum, and the standard deviation of the
	 * audit score of the companies that are registered in the system.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query11Negative() {
		super.authenticate(null);
		this.adminService.query11();
		super.unauthenticate();
	}

	// Tests Query12-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 12: The companies with the highest audit score.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query12Positive() {
		super.authenticate("admin");
		this.adminService.query12();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 12: The companies with the highest audit score.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query12Negative() {
		super.authenticate(null);
		this.adminService.query12();
		super.unauthenticate();
	}

	// Tests Query13-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 13: The average salary offered by the positions that have the highest audit score.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query13Positive() {
		super.authenticate("admin");
		this.adminService.query13();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 13: The average salary offered by the positions that have the highest audit score.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query13Negative() {
		super.authenticate(null);
		this.adminService.query13();
		super.unauthenticate();
	}

	// Tests Query14-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 14: The minimum, the maximum, the average, and the standard deviation of the
	 * number of items per provider.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query14Positive() {
		super.authenticate("admin");
		this.adminService.query14();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 14: The minimum, the maximum, the average, and the standard deviation of the
	 * number of items per provider.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query14Negative() {
		super.authenticate(null);
		this.adminService.query14();
		super.unauthenticate();
	}

	// Tests Query15-----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 15: The top-5 providers in terms of total number of items provided.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query15Positive() {
		super.authenticate("admin");
		this.adminService.query15();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 15: The top-5 providers in terms of total number of items provided.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query15Negative() {
		super.authenticate(null);
		this.adminService.query15();
		super.unauthenticate();
	}

	// Tests Query16 -----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 16: The average, the minimum, the maximum, and the standard deviation of the
	 * number of sponsorships per provider.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query16Positive() {
		super.authenticate("admin");
		this.adminService.query16();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 16: The average, the minimum, the maximum, and the standard deviation of the
	 * number of sponsorships per provider.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query16Negative() {
		super.authenticate(null);
		this.adminService.query16();
		super.unauthenticate();
	}

	// Tests Query17 -----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 17: he average, the minimum, the maximum, and the standard deviation of the
					number of sponsorships per position.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query17Positive() {
		super.authenticate("admin");
		this.adminService.query17();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 17: he average, the minimum, the maximum, and the standard deviation of the
	 * number of sponsorships per position.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query17Negative() {
		super.authenticate(null);
		this.adminService.query17();
		super.unauthenticate();
	}
	
	// Tests Query18 -----------------------------------------------------------------------------------------
	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 18: The providers who have a number of sponsorships that is at least 10% above
					the average number of sponsorships per provider.
	 * 
	 * 2. Positive test.
	 * 
	 **/
	@Test
	public void query18Positive() {
		super.authenticate("admin");
		this.adminService.query18();
		super.unauthenticate();
	}

	/**
	 * Requirement: An actor who is authenticated as an administrator must be able to Display a dashboard.
	 * 
	 * 1. Query 18: The providers who have a number of sponsorships that is at least 10% above
					the average number of sponsorships per provider.
	 * 
	 * 2. Negative test.
	 * 3. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 * 
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void query18Negative() {
		super.authenticate(null);
		this.adminService.query18();
		super.unauthenticate();
	}

}
