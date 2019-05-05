
package controllers;

import java.util.Collection;
import java.util.List;

import javax.swing.JOptionPane;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.PositionService;
import services.ProviderService;
import services.SponsorshipService;
import domain.Provider;
import domain.Sponsorship;

@Controller
@RequestMapping("/sponsorship")
public class SponsorshipController extends AbstractController {

	@Autowired
	private SponsorshipService	sponsorshipService;

	@Autowired
	private ProviderService		providerService;

	@Autowired
	private PositionService		positionService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		JOptionPane.showMessageDialog(null, "Forbidden operation");
		return new ModelAndView("redirect:/");
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "/provider/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Sponsorship> sponsorships;
		try {
			final Provider principal = this.providerService.findByPrincipal();

			sponsorships = this.sponsorshipService.findByProvider(principal.getId());

			result = new ModelAndView("sponsorship/provider/list");
			result.addObject("sponsorships", sponsorships);
		} catch (final Throwable oops) {
			result = this.forbiddenOpperation();
		}
		return result;
	}

	// Create ---------------------------------------------------------------
	@RequestMapping(value = "/provider/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Sponsorship sponsorship;
		try {
			sponsorship = this.sponsorshipService.create();

			result = new ModelAndView("sponsorship/provider/create");
			result.addObject("sponsorship", sponsorship);
			result.addObject("positions", this.positionService.findAllFinal());
		} catch (final Throwable oops) {
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// Edit -------------------------------------------------------------
	@RequestMapping(value = "/provider/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam final int sponsorshipId) {
		ModelAndView result;
		Sponsorship sponsorship;

		try {
			final Provider principal = this.providerService.findByPrincipal();
			sponsorship = this.sponsorshipService.findOne(sponsorshipId);
			Assert.isTrue(this.sponsorshipService.findByProvider(principal.getId()).contains(sponsorship));
			sponsorship.setProvider(null);
			result = this.createEditModelAndView(sponsorship);
		} catch (final Throwable oops) {
			result = this.forbiddenOpperation();
		}
		return result;
	}

	// Save -------------------------------------------------------------
	@RequestMapping(value = "/provider/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(final Sponsorship prune, final BindingResult binding) {
		ModelAndView result;
		Sponsorship sponsorship;

		sponsorship = this.sponsorshipService.reconstruct(prune, binding);

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());
			result = this.createEditModelAndView(prune);
		} else
			try {
				this.sponsorshipService.save(sponsorship);
				result = new ModelAndView("redirect:/sponsorship/provider/list.do");
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = this.createEditModelAndView(prune, "profile.commit.error");
			}
		return result;
	}

	// Display -------------------------------------------------------------
	@RequestMapping(value = "/provider/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam final int sponsorshipId) {
		ModelAndView result;
		Sponsorship sponsorship;

		try {
			final Provider principal = this.providerService.findByPrincipal();
			sponsorship = this.sponsorshipService.findOne(sponsorshipId);
			Assert.isTrue(this.sponsorshipService.findByProvider(principal.getId()).contains(sponsorship));

			result = new ModelAndView("sponsorship/provider/display");
			result.addObject("sponsorship", sponsorship);
		} catch (final Throwable oops) {
			result = this.forbiddenOpperation();
		}
		return result;
	}

	// Display -------------------------------------------------------------
	@RequestMapping(value = "/provider/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam final int sponsorshipId) {
		ModelAndView result;
		Sponsorship sponsorship;

		try {
			final Provider principal = this.providerService.findByPrincipal();
			sponsorship = this.sponsorshipService.findOne(sponsorshipId);
			Assert.isTrue(this.sponsorshipService.findByProvider(principal.getId()).contains(sponsorship));
			this.sponsorshipService.delete(sponsorship);

			result = new ModelAndView("redirect:/sponsorship/provider/list.do");
		} catch (final Throwable oops) {
			result = this.forbiddenOpperation();
		}
		return result;
	}

	// Ancillary methods ------------------------------------------------------
	protected ModelAndView createEditModelAndView(final Sponsorship sponsorship) {
		ModelAndView result;

		result = this.createEditModelAndView(sponsorship, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final Sponsorship sponsorship, final String message) {
		ModelAndView result;

		result = new ModelAndView("sponsorship/provider/edit");
		result.addObject("sponsorship", sponsorship);
		result.addObject("positions", this.positionService.findAllFinal());
		result.addObject("message", message);

		return result;
	}

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}

}
