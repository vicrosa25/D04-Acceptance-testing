package controllers;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ProviderService;
import utilities.Md5;
import domain.Provider;
import forms.ProviderForm;

@Controller
@RequestMapping("/provider")
public class ProviderController extends AbstractController {

	@Autowired
	private ProviderService providerService;

	@Autowired
	private ActorService actorService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Provider> providers;
		try {

			providers = this.providerService.findAll();

			result = new ModelAndView("provider/list");
			result.addObject("providers", providers);
			result.addObject("requestURI", "provider/list.do");

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// Display ------------------------------------------------------------------------------------
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam int providerId) {
		ModelAndView result;
		Provider provider;

		try {
			provider = this.providerService.findOne(providerId);

			result = new ModelAndView("provider/display");
			result.addObject("provider", provider);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
			result = this.forbiddenOpperation();
		}

		return result;
	}


	// Register ------------------------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		ProviderForm provider;

		try {
			provider = new ProviderForm();
			result = this.createEditModelAndView(provider);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// Save the new provider ------------------------------------------------------------------------------------
	@RequestMapping(value = "/create", method = RequestMethod.POST, params = "save")
	public ModelAndView save(final ProviderForm providerForm, final BindingResult binding) {
		ModelAndView result;
		Provider provider;
		String password;

		provider = this.providerService.reconstruct(providerForm, binding);

		if (!providerForm.isAccepted()) {
			binding.rejectValue("accepted", "register.terms.error", "Service terms must be accepted");
		}if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = this.createEditModelAndView(providerForm);
		}

		else
			try {
				password = Md5.encodeMd5(provider.getUserAccount().getPassword());
				provider.getUserAccount().setPassword(password);
				this.providerService.save(provider);
				result = new ModelAndView("redirect:../security/login.do");
			} catch (final Throwable oops) {
				System.out.println(provider);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = this.createEditModelAndView(providerForm);

				if (oops instanceof DataIntegrityViolationException)
					result = this.createEditModelAndView(providerForm, "provider.duplicated.username");
				else
					result = this.createEditModelAndView(providerForm, "provider.registration.error");
			}
		return result;
	}

	// Edit ------------------------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.GET)
	public ModelAndView edit() {
		ModelAndView result;
		Provider provider;
		Provider pruned = new Provider();

		try {
			provider = this.providerService.findByPrincipal();

			// Fill attributes to edit with the original ones
			pruned.setAddress(provider.getAddress());
			pruned.setCardNumber(provider.getCardNumber());
			pruned.setMake(provider.getMake());
			pruned.setEmail(provider.getEmail());
			pruned.setId(provider.getId());
			pruned.setName(provider.getName());
			pruned.setPhoneNumber(provider.getPhoneNumber());
			pruned.setPhoto(provider.getPhoto());
			pruned.setSurname(provider.getSurname());
			pruned.setVat(provider.getVat());

			result = new ModelAndView("provider/edit");
			result.addObject("provider", pruned);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// save edit ------------------------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView saveEdit(final Provider prune, final BindingResult binding) {
		ModelAndView result;
		final Provider provider;

		provider = this.providerService.reconstruct(prune, binding);

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("provider/edit");
			result.addObject("provider", prune);
		}

		else
			try {
				this.providerService.save(provider);
				result = new ModelAndView("redirect:/");
			} catch (final Throwable oops) {
				System.out.println(provider);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				result = this.editModelAndView(provider, "provider.registration.error");
			}
		return result;
	}

	// Generate pdf ------------------------------------------------------------------------------------
	@RequestMapping(value = "/generatePDF")
	public void generatePDF(HttpServletRequest request, HttpServletResponse response) throws IOException {
		Provider provider;

		try {
			final ServletContext servletContext = request.getSession().getServletContext();
			final File tempDirectory = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			final String temperotyFilePath = tempDirectory.getAbsolutePath();
			provider = this.providerService.findByPrincipal();

			String fileName = provider.getName() + ".pdf";
			response.setContentType("application/pdf");
			response.setHeader("Content-disposition", "attachment; filename=" + fileName);

			this.actorService.generatePersonalInformationPDF(provider, temperotyFilePath + "\\" + fileName);
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

	// Delete ------------------------------------------------------------------------------------
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public ModelAndView delete() {
		ModelAndView result;
		Provider provider;

		try {
			provider = this.providerService.findByPrincipal();
			this.providerService.delete(provider);
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

	// Ancillary methods -----------------------------------------------------------------------
	protected ModelAndView createEditModelAndView(final ProviderForm providerForm) {
		ModelAndView result;

		result = this.createEditModelAndView(providerForm, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(final ProviderForm providerForm, final String message) {
		ModelAndView result;

		result = new ModelAndView("provider/create");
		result.addObject("providerForm", providerForm);
		result.addObject("message", message);

		return result;
	}

	protected ModelAndView editModelAndView(final Provider provider) {
		ModelAndView result;

		result = this.editModelAndView(provider, null);

		return result;
	}

	protected ModelAndView editModelAndView(final Provider provider, final String message) {
		ModelAndView result;

		result = new ModelAndView("provider/edit");
		result.addObject("provider", provider);
		result.addObject("message", message);

		return result;
	}

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}
}
