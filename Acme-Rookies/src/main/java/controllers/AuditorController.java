
package controllers;

import java.util.Collection;
import java.util.List;

import javax.swing.JOptionPane;
import javax.validation.Valid;

import org.hibernate.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Auditor;
import services.AuditorService;
import utilities.Md5;

@Controller
@RequestMapping("/auditor")
public class AuditorController extends AbstractController {

	@Autowired
	private AuditorService auditorService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		JOptionPane.showMessageDialog(null, "Forbidden operation");
		return new ModelAndView("redirect:/");
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "/admin/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Auditor> auditors;

		auditors = this.auditorService.findAll();

		result = new ModelAndView("auditor/admin/list");
		result.addObject("auditors", auditors);
		result.addObject("requestURI", "auditor/admin/list.do");

		return result;
	}

	// Create -----------------------------------------------------------
	@RequestMapping(value = "/admin/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Auditor auditor;

		auditor = this.auditorService.create();

		result = new ModelAndView("auditor/admin/create");
		result.addObject("auditor", auditor);

		return result;
	}

	// Save -----------------------------------------------------------
	@RequestMapping(value = "/admin/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid final Auditor auditor, final BindingResult binding) {
		ModelAndView result;
		String password;
		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());
			result = new ModelAndView("auditor/admin/create");
			result.addObject("auditor", auditor);
		} else
			try {
				password = Md5.encodeMd5(auditor.getUserAccount().getPassword());
				auditor.getUserAccount().setPassword(password);
				this.auditorService.save(auditor);
				result = new ModelAndView("redirect:list.do");
			} catch (final Throwable oops) {
				oops.printStackTrace();
				result = new ModelAndView("auditor/admin/create");
				result.addObject("auditor", auditor);
				if (oops instanceof DataIntegrityViolationException)
					result.addObject("auditor", "admin.duplicated.username");
				else {
					System.out.println(oops.getCause().toString());
					result.addObject("auditor", "admin.registration.error");
				}
			}
		return result;
	}

}
