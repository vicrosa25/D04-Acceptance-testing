
package controllers;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Rookie;
import forms.RookieForm;
import services.ActorService;
import services.RookieService;
import utilities.Md5;

@Controller
@RequestMapping("/rookie")
public class RookieController extends AbstractController {

	@Autowired
	private RookieService rookieService;
	
	
	@Autowired
	private ActorService actorService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}

	/********************************************
	 * Register a Rookie from a rookieForm object
	 ********************************************/

	// Register Form Object GEST------------------------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		RookieForm rookieForm;

		try {
			//Se crea un rookieform vacio
			rookieForm = new RookieForm();
			result = new ModelAndView("rookie/create");
			result.addObject("rookieForm", rookieForm);
		} catch (final Throwable oops) {
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// Register Form Object POST ----------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(RookieForm rookieForm, BindingResult binding) {
		ModelAndView result;
		String password;

		Rookie rookie = this.rookieService.reconstruct(rookieForm, binding);

		if (!rookieForm.isAccepted()) {
			binding.rejectValue("accepted", "register.terms.error", "Service terms must be accepted");
		}
		if (binding.hasErrors()) {
			result = this.createEditModelAndView(rookieForm);
		} else {
			try {
				password = Md5.encodeMd5(rookie.getUserAccount().getPassword());
				rookie.getUserAccount().setPassword(password);
				this.rookieService.save(rookie);
				result = new ModelAndView("redirect:../security/login.do");

			} catch (final Throwable oops) {
				result = this.createEditModelAndView(rookieForm, "rookie.commit.error");
			}
		}
		return result;
	}

	/********************************************
	 * Edit a Rookie from a pruned object
	 ********************************************/

	// Edit GET------------------------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {
		ModelAndView result;
		Rookie rookie;

		try {
			rookie = this.rookieService.findByPrincipal();

			// Set relations to null to use as a prune object
			rookie.setApplications(null);

			result = new ModelAndView("rookie/edit");
			result.addObject("rookie", rookie);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// Edit POST ------------------------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(Rookie prune, final BindingResult binding) {
		ModelAndView result;
		Rookie rookie;

		rookie = this.rookieService.reconstruct(prune, binding);

		if (binding.hasErrors()) {
			List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors) {
				System.out.println(e.toString());
			}
			result = new ModelAndView("rookie/edit");
			result.addObject("rookie", prune);
		} else {
			try {
				this.rookieService.save(rookie);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable oops) {
				System.out.println();
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = this.editModelAndView(rookie, "rookie.registration.error");
			}
		}
		return result;
	}

	/*********************
	 * Delete
	 *********************/
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete() {
		ModelAndView result;
		Rookie rookie;

		try {
			rookie = this.rookieService.findByPrincipal();
			this.rookieService.delete(rookie);
			result = new ModelAndView("redirect:/j_spring_security_logout");
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
			result = this.forbiddenOpperation();
		}
		return result;
	}

	/*********************
	 * Generate PDG
	 *********************/
	@RequestMapping(value = "/generatePDF")
	public void generatePDF(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Rookie rookie;

		try {
			final ServletContext servletContext = request.getSession().getServletContext();
			final File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			final String temperotyFilePath = tempDirectory.getAbsolutePath();
			rookie = this.rookieService.findByPrincipal();

			String fileName = rookie.getName() + ".pdf";
			response.setContentType("application/pdf");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName);

			this.actorService.generatePersonalInformationPDF(rookie, temperotyFilePath + "\\" + fileName);
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			baos = convertPDFToByteArrayOutputStream(temperotyFilePath + "\\" + fileName);
			OutputStream os = response.getOutputStream();
			baos.writeTo(os);
			os.flush();
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
		}
	}

	/*********************
	 * Ancillary Methods
	 *********************/
	protected ModelAndView createEditModelAndView(RookieForm rookieForm) {
		ModelAndView result;

		result = this.createEditModelAndView(rookieForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(RookieForm rookieForm, String messageCode) {
		final ModelAndView result;

		result = new ModelAndView("rookie/create");
		result.addObject("rookieForm", rookieForm);
		result.addObject("message", messageCode);

		return result;

	}

	protected ModelAndView editModelAndView(Rookie rookie) {
		ModelAndView result;

		result = this.editModelAndView(rookie, null);

		return result;
	}

	protected ModelAndView editModelAndView(Rookie rookie, String message) {
		ModelAndView result;

		result = new ModelAndView("rookie/edit");
		result.addObject("rookie", rookie);
		result.addObject("message", message);

		return result;
	}

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}

}
