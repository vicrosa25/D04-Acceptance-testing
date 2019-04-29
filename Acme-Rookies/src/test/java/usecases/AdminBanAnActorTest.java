package usecases;

import javax.transaction.Transactional;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import domain.Rookie;
import services.AdministratorService;
import services.RookieService;
import utilities.AbstractTest;

@ContextConfiguration(locations = {
	"classpath:spring/junit.xml"
})
@RunWith(SpringJUnit4ClassRunner.class)
@Transactional
public class AdminBanAnActorTest extends AbstractTest {
	
	// System under test ---------------------------------------------------------------------------
	@Autowired
	private AdministratorService 	administratorService;
	
	@Autowired
	private RookieService			rookieService;
	
	
	// Tests -----------------------------------------------------------------------------------------
	
	
	/**
	 * Requirement: An actor who is authenticated must be able to:  
	 * 
	 * 		"Ban an actor with the spammer flag"
	 *  
	 * 	1. Positive test.
	 *  
	 **/
	@Test
	public void banActorPositive(){
		Rookie rookie;
		super.authenticate("admin");
		
		rookie = this.rookieService.findOne(super.getEntityId("rookie2"));
		
		this.administratorService.banAnActor(rookie);
		
		
		super.unauthenticate();
		
	}

	
	/**
	 * Requirement: An actor who is authenticated must be able to:  
	 * 
	 * 		"Ban an actor with the spammer flag"
	 *  
	 * 1. Negative test.
	 * 2. Business rule that is intended to broke: The actor is not authenticated as an Admin
	 *  
	 **/
	@Test(expected = IllegalArgumentException.class)
	public void banActorNegative(){
		Rookie rookie;
		super.authenticate("rookie1");
		
		rookie = this.rookieService.findOne(super.getEntityId("rookie2"));
		
		this.administratorService.banAnActor(rookie);
		
		
		super.unauthenticate();
	}
}
