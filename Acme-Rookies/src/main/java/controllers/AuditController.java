
package controllers;

import java.util.Collection;

import org.springframework.beans.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.AuditService;
import services.AuditorService;
import services.PositionService;
import domain.Audit;
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
			audits = this.auditorService.findByPrincipal().getAudits();

			result = new ModelAndView("audit/auditor/list");
			result.addObject("audits", audits);

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

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}

}
