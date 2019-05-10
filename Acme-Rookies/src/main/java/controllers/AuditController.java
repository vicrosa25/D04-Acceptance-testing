
package controllers;

import java.util.Collection;
import java.util.List;

import javax.validation.Valid;

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

import services.AuditService;
import services.AuditorService;
import services.PositionService;
import domain.Audit;
import domain.Auditor;
import domain.Position;

@Controller
@RequestMapping("/audit")
public class AuditController extends AbstractController {

	@Autowired
	private AuditService auditService;

	@Autowired
	private AuditorService	auditorService;

	@Autowired
	private PositionService	positionService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "auditor/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Audit> audits;
		try {
			Auditor principal =this.auditorService.findByPrincipal();
			audits = this.auditService.findAll();

			result = new ModelAndView("audit/auditor/list");
			result.addObject("audits", audits);
			result.addObject("positions", this.positionService.findByAuditor(principal));

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "auditor/display", method = RequestMethod.GET)
	public ModelAndView dispaly(@RequestParam int auditId) {
		ModelAndView result;
		Audit audit;
		Position position;
		try {
			audit = this.auditService.findOne(auditId);
			position = this.positionService.findByAudit(auditId);

			result = new ModelAndView("audit/auditor/display");
			result.addObject("audit", audit);
			result.addObject("position", position);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// create -------------------------------------------------------------
	@RequestMapping(value = "/auditor/create", method = RequestMethod.GET)
	public ModelAndView create(@RequestParam int positionId) {
		ModelAndView result;
		Position position;
		Audit audit;
		try {
			audit = this.auditService.create();
			position = this.positionService.findOne(positionId);

			Assert.isTrue(position.getAuditor() == this.auditorService.findByPrincipal());
			audit.setPosition(position);

			result = new ModelAndView("audit/auditor/create");
			result.addObject("audit", audit);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// edit -------------------------------------------------------------
	@RequestMapping(value = "/auditor/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int auditId) {
		ModelAndView result;
		Audit audit;
		try {
			audit = this.auditService.findOne(auditId);

			Assert.notNull(audit);
			Assert.isTrue(!audit.getFinalMode());
			Assert.isTrue(this.auditorService.findByPrincipal().getAudits().contains(audit));

			result = new ModelAndView("audit/auditor/edit");
			result.addObject("audit", audit);


		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// save ------------------------------------------------------------------------------------
	@RequestMapping(value = "auditor/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(@Valid final Audit audit, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("audit/auditor/edit");
			result.addObject("audit", audit);
		}

		else
			try {
				this.auditService.save(audit);
				result = new ModelAndView("redirect:/audit/auditor/list.do");
			} catch (final Throwable oops) {
				System.out.println(audit);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();

				result = new ModelAndView("audit/auditor/edit");
				result.addObject("audit", audit);
			}
		return result;
	}

	// delete -------------------------------------------------------------
	@RequestMapping(value = "/auditor/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam int auditId) {
		ModelAndView result;
		Audit audit;
		try {
			audit = this.auditService.findOne(auditId);

			Assert.notNull(audit);
			Assert.isTrue(!audit.getFinalMode());
			Assert.isTrue(this.auditorService.findByPrincipal().getAudits().contains(audit));

			this.auditService.delete(audit);

			result = new ModelAndView("redirect:/audit/auditor/list.do");
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;

	}



	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}

}
