
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

import domain.Curricula;
import domain.EducationData;
import domain.MiscellaneousData;
import domain.PersonalData;
import domain.PositionData;
import domain.Rookie;
import domain.Url;
import services.CurriculaService;
import services.EducationDataService;
import services.MiscellaneousDataService;
import services.PersonalDataService;
import services.PositionDataService;
import services.RookieService;

@Controller
@RequestMapping("/curricula")
public class CurriculaController extends AbstractController {

	@Autowired
	private CurriculaService			curriculaService;

	@Autowired
	private RookieService				rookieService;

	@Autowired
	private PersonalDataService			personalDataService;

	@Autowired
	private PositionDataService			positionDataService;

	@Autowired
	private EducationDataService		educationDataService;

	@Autowired
	private MiscellaneousDataService	miscellaneousDataService;

	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(final TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "/rookie/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Curricula> curriculas;
		try {
			Rookie principal = this.rookieService.findByPrincipal();
			Assert.notNull(principal);
			curriculas = this.curriculaService.findAllPrincipalNotApplied();

			result = new ModelAndView("curricula/list");
			result.addObject("curriculas", curriculas);
			result.addObject("requestURI", "curricula/rookie/list.do");

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// Display -------------------------------------------------------------
	@RequestMapping(value = "/rookie/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam int curriculaId) {
		ModelAndView result;
		Curricula curricula;
		try {
			Rookie principal = this.rookieService.findByPrincipal();
			curricula = this.curriculaService.findOne(curriculaId);

			Assert.isTrue(principal.getCurriculas().contains(curricula));
			Assert.isTrue(!curricula.getApplied());

			result = new ModelAndView("curricula/display");
			result.addObject("curricula", curricula);
			result.addObject("requestURI", "curricula/rookie/display.do");

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// create -------------------------------------------------------------
	@RequestMapping(value = "/rookie/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		try {
			Curricula curricula = this.curriculaService.create();

			result = new ModelAndView("curricula/rookie/create");
			result.addObject(curricula);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// save ------------------------------------------------------------------------------------
	@RequestMapping(value = "/rookie/create", method = RequestMethod.POST, params = "save")
	public ModelAndView personalDataSave(@Valid final Curricula curricula, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("curricula/rookie/create");
			result.addObject(curricula);
		}

		else
			try {
				Curricula clean = this.curriculaService.create();
				clean.setTitle(curricula.getTitle());
				this.curriculaService.save(clean);
				result = new ModelAndView("redirect:/curricula/rookie/list.do");
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = new ModelAndView("curricula/rookie/create");
				result.addObject(curricula);
			}
		return result;
	}

	// Delete -------------------------------------------------------------
	@RequestMapping(value = "/rookie/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam int curriculaId) {
		ModelAndView result;
		Curricula curricula;
		try {
			Rookie principal = this.rookieService.findByPrincipal();
			curricula = this.curriculaService.findOne(curriculaId);
			Assert.isTrue(!curricula.getApplied());

			Assert.isTrue(principal.getCurriculas().contains(curricula));

			this.curriculaService.delete(curricula);

			result = this.list();

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			oops.printStackTrace();
			result = this.forbiddenOpperation();

		}

		return result;
	}

	/** PERSONAL DATA **/
	// create -------------------------------------------------------------
	@RequestMapping(value = "/personalData/rookie/create", method = RequestMethod.GET)
	public ModelAndView personalDataCreate(@RequestParam int curriculaId) {
		ModelAndView result;
		PersonalData personalData;
		Rookie principal;
		Curricula curricula;
		try {
			principal = this.rookieService.findByPrincipal();
			curricula = this.curriculaService.findOne(curriculaId);
			Assert.isTrue(!curricula.getApplied());
			personalData = this.personalDataService.create();

			personalData.setCurricula(curricula);

			Assert.isTrue(principal.getCurriculas().contains(curricula));

			result = new ModelAndView("curricula/personalData/rookie/edit");
			result.addObject("personalData", personalData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	@RequestMapping(value = "/personalData/rookie/edit", method = RequestMethod.GET)
	public ModelAndView personalDataEdit(@RequestParam int curriculaId) {
		ModelAndView result;
		PersonalData personalData;
		Rookie principal;
		Curricula curricula;
		try {
			principal = this.rookieService.findByPrincipal();
			curricula = this.curriculaService.findOne(curriculaId);
			Assert.isTrue(!curricula.getApplied());

			Assert.isTrue(curricula.getPersonalData() != null);
			Assert.isTrue(principal.getCurriculas().contains(curricula));

			personalData = curricula.getPersonalData();

			result = new ModelAndView("curricula/personalData/rookie/edit");
			result.addObject("personalData", personalData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// save ------------------------------------------------------------------------------------
	@RequestMapping(value = "/personalData/rookie/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView personalDataSave(@Valid final PersonalData personalData, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("curricula/personalData/rookie/edit");
			result.addObject("personalData", personalData);
		}

		else
			try {
				this.personalDataService.save(personalData);
				result = new ModelAndView("redirect:/curricula/rookie/display.do?curriculaId=" + personalData.getCurricula().getId());
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = new ModelAndView("curricula/personalData/rookie/edit");
				result.addObject("personalData", personalData);
			}
		return result;
	}


	/** POSITION DATA **/
	// create -------------------------------------------------------------
	@RequestMapping(value = "/positionData/rookie/create", method = RequestMethod.GET)
	public ModelAndView positionDataCreate(@RequestParam int curriculaId) {
		ModelAndView result;
		PositionData positionData;
		Rookie principal;
		Curricula curricula;
		try {
			principal = this.rookieService.findByPrincipal();
			curricula = this.curriculaService.findOne(curriculaId);
			positionData = this.positionDataService.create();

			positionData.setCurricula(curricula);

			Assert.isTrue(principal.getCurriculas().contains(curricula));
			Assert.isTrue(!curricula.getApplied());

			result = new ModelAndView("curricula/positionData/rookie/edit");
			result.addObject("positionData", positionData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	@RequestMapping(value = "/positionData/rookie/edit", method = RequestMethod.GET)
	public ModelAndView positionDataEdit(@RequestParam int positionDataId) {
		ModelAndView result;
		PositionData positionData;
		Rookie principal;
		try {
			principal = this.rookieService.findByPrincipal();
			positionData = this.positionDataService.findOne(positionDataId);

			Assert.isTrue(principal.getCurriculas().contains(positionData.getCurricula()));
			Assert.isTrue(!positionData.getCurricula().getApplied());

			result = new ModelAndView("curricula/positionData/rookie/edit");
			result.addObject("positionData", positionData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// save pos data ------------------------------------------------------------------------------------
	@RequestMapping(value = "/positionData/rookie/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView positionDataSave(@Valid final PositionData positionData, final BindingResult binding) {
		ModelAndView result;

		if (positionData.getStartDate() != null && positionData.getEndDate() != null) {
			if (positionData.getStartDate().after(positionData.getEndDate())) {
				binding.rejectValue("startDate", "curricula.startDate.error", "Start date must be before end date");
			}
		}

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("curricula/positionData/rookie/edit");
			result.addObject("positionData", positionData);
		}

		else
			try {
				this.positionDataService.save(positionData);
				result = new ModelAndView("redirect:/curricula/rookie/display.do?curriculaId=" + positionData.getCurricula().getId());
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = new ModelAndView("curricula/positionData/rookie/edit");
				result.addObject("positionData", positionData);
			}
		return result;
	}

	@RequestMapping(value = "/positionData/rookie/delete", method = RequestMethod.GET)
	public ModelAndView positionDataDelete(@RequestParam int positionDataId) {
		ModelAndView result;
		PositionData positionData;
		Rookie principal;
		try {
			principal = this.rookieService.findByPrincipal();
			positionData = this.positionDataService.findOne(positionDataId);

			Assert.isTrue(principal.getCurriculas().contains(positionData.getCurricula()));
			Assert.isTrue(!positionData.getCurricula().getApplied());

			result = new ModelAndView("redirect:/curricula/rookie/display.do?curriculaId=" + positionData.getCurricula().getId());

			this.positionDataService.delete(positionData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	/** EDUCATION DATA **/
	// create -------------------------------------------------------------
	@RequestMapping(value = "/educationData/rookie/create", method = RequestMethod.GET)
	public ModelAndView educationDataCreate(@RequestParam int curriculaId) {
		ModelAndView result;
		EducationData educationData;
		Rookie principal;
		Curricula curricula;
		try {
			principal = this.rookieService.findByPrincipal();
			curricula = this.curriculaService.findOne(curriculaId);
			educationData = this.educationDataService.create();

			educationData.setCurricula(curricula);

			Assert.isTrue(principal.getCurriculas().contains(curricula));
			Assert.isTrue(!curricula.getApplied());

			result = new ModelAndView("curricula/educationData/rookie/edit");
			result.addObject("educationData", educationData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// edit education data-------------------------------------------------------------------
	@RequestMapping(value = "/educationData/rookie/edit", method = RequestMethod.GET)
	public ModelAndView educationDataEdit(@RequestParam int educationDataId) {
		ModelAndView result;
		EducationData educationData;
		Rookie principal;
		try {
			principal = this.rookieService.findByPrincipal();
			educationData = this.educationDataService.findOne(educationDataId);

			Assert.isTrue(principal.getCurriculas().contains(educationData.getCurricula()));
			Assert.isTrue(!educationData.getCurricula().getApplied());

			result = new ModelAndView("curricula/educationData/rookie/edit");
			result.addObject("educationData", educationData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// save educ data ------------------------------------------------------------------------------------
	@RequestMapping(value = "/educationData/rookie/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView educationDataSave(@Valid final EducationData educationData, final BindingResult binding) {
		ModelAndView result;

		if (educationData.getStartDate() != null && educationData.getEndDate() != null) {
			if (educationData.getStartDate().after(educationData.getEndDate())) {
				binding.rejectValue("startDate", "curricula.startDate.error", "Start date must be before end date");
			}
		}

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("curricula/educationData/rookie/edit");
			result.addObject("educationData", educationData);
		}

		else
			try {
				this.educationDataService.save(educationData);
				result = new ModelAndView("redirect:/curricula/rookie/display.do?curriculaId=" + educationData.getCurricula().getId());
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = new ModelAndView("curricula/educationData/rookie/edit");
				result.addObject("educationData", educationData);
			}
		return result;
	}

	// delete educatiuon data -----------------------------------------------------------
	@RequestMapping(value = "/educationData/rookie/delete", method = RequestMethod.GET)
	public ModelAndView educationDataDelete(@RequestParam int educationDataId) {
		ModelAndView result;
		EducationData educationData;
		Rookie principal;
		try {
			principal = this.rookieService.findByPrincipal();
			educationData = this.educationDataService.findOne(educationDataId);

			Assert.isTrue(principal.getCurriculas().contains(educationData.getCurricula()));
			Assert.isTrue(!educationData.getCurricula().getApplied());

			result = new ModelAndView("redirect:/curricula/rookie/display.do?curriculaId=" + educationData.getCurricula().getId());

			this.educationDataService.delete(educationData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	/** MISCELLANEOUS DATA **/
	// create -------------------------------------------------------------
	@RequestMapping(value = "/miscellaneousData/rookie/create", method = RequestMethod.GET)
	public ModelAndView miscellaneousDataCreate(@RequestParam int curriculaId) {
		ModelAndView result;
		MiscellaneousData miscellaneousData;
		Rookie principal;
		Curricula curricula;
		try {
			principal = this.rookieService.findByPrincipal();
			curricula = this.curriculaService.findOne(curriculaId);
			miscellaneousData = this.miscellaneousDataService.create();

			miscellaneousData.setCurricula(curricula);
			Assert.isTrue(!curricula.getApplied());

			Assert.isTrue(principal.getCurriculas().contains(curricula));

			result = new ModelAndView("curricula/miscellaneousData/rookie/edit");
			result.addObject("miscellaneousData", miscellaneousData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// edit miscellaneous data-------------------------------------------------------------------
	@RequestMapping(value = "/miscellaneousData/rookie/edit", method = RequestMethod.GET)
	public ModelAndView miscellaneousDataEdit(@RequestParam int miscellaneousDataId) {
		ModelAndView result;
		MiscellaneousData miscellaneousData;
		Rookie principal;
		try {
			principal = this.rookieService.findByPrincipal();
			miscellaneousData = this.miscellaneousDataService.findOne(miscellaneousDataId);

			Assert.isTrue(principal.getCurriculas().contains(miscellaneousData.getCurricula()));
			Assert.isTrue(!miscellaneousData.getCurricula().getApplied());

			result = new ModelAndView("curricula/miscellaneousData/rookie/edit");
			result.addObject("miscellaneousData", miscellaneousData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// save miscellaneous data ------------------------------------------------------------------------------------
	@RequestMapping(value = "/miscellaneousData/rookie/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView miscellaneousDataSave(@Valid final MiscellaneousData miscellaneousData, final BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors)
				System.out.println(e.toString());

			result = new ModelAndView("curricula/miscellaneousData/rookie/edit");
			result.addObject("miscellaneousData", miscellaneousData);
		}

		else
			try {
				this.miscellaneousDataService.save(miscellaneousData);
				result = new ModelAndView("redirect:/curricula/rookie/display.do?curriculaId=" + miscellaneousData.getCurricula().getId());
			} catch (final Throwable oops) {
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = new ModelAndView("curricula/miscellaneousData/rookie/edit");
				result.addObject("miscellaneousData", miscellaneousData);
			}
		return result;
	}

	// delete misc data -----------------------------------------------------------
	@RequestMapping(value = "/miscellaneousData/rookie/delete", method = RequestMethod.GET)
	public ModelAndView miscellaneousDataDelete(@RequestParam int miscellaneousDataId) {
		ModelAndView result;
		MiscellaneousData miscellaneousData;
		Rookie principal;
		try {
			principal = this.rookieService.findByPrincipal();
			miscellaneousData = this.miscellaneousDataService.findOne(miscellaneousDataId);

			Assert.isTrue(principal.getCurriculas().contains(miscellaneousData.getCurricula()));
			Assert.isTrue(!miscellaneousData.getCurricula().getApplied());

			result = new ModelAndView("redirect:/curricula/rookie/display.do?curriculaId=" + miscellaneousData.getCurricula().getId());

			this.miscellaneousDataService.delete(miscellaneousData);

		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();

		}

		return result;
	}

	// Attachment  ------------------------------------------------------------------------------------
	@RequestMapping(value = "/miscellaneousData/rookie/addAttachment", method = RequestMethod.GET)
	public ModelAndView addAttachment(@RequestParam final int miscellaneousDataId) {
		ModelAndView result;
		final Url url;
		MiscellaneousData miscellaneousData;

		try {
			miscellaneousData = this.miscellaneousDataService.findOne(miscellaneousDataId);
			Assert.notNull(miscellaneousData);
			Assert.isTrue(this.rookieService.findByPrincipal().getCurriculas().contains(miscellaneousData.getCurricula()));
			url = new Url();
			url.setTargetId(miscellaneousDataId);
			result = new ModelAndView("curricula/miscellaneousData/rookie/addAttachment");
			result.addObject("url", url);
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	@RequestMapping(value = "/miscellaneousData/rookie/deleteAttachment", method = RequestMethod.GET)
	public ModelAndView deletePicture(@RequestParam final String link, @RequestParam final int miscellaneousDataId) {
		ModelAndView result;
		MiscellaneousData miscellaneousData;
		try {
			System.out.println("Controller");
			miscellaneousData = this.miscellaneousDataService.findOne(miscellaneousDataId);
			Assert.notNull(miscellaneousData);
			Assert.isTrue(this.rookieService.findByPrincipal().getCurriculas().contains(miscellaneousData.getCurricula()));
			for (final Url attachment : miscellaneousData.getAttachments()) {
				if (attachment.getLink().equals(link)) {
					System.out.println("URL igual encontrada, borrando y guardando");
					miscellaneousData.getAttachments().remove(attachment);
					this.miscellaneousDataService.save(miscellaneousData);
					break;
				}
			}
			result = new ModelAndView("redirect:/curricula/miscellaneousData/rookie/edit.do?miscellaneousDataId=" + miscellaneousData.getId());
		} catch (final Throwable oops) {
			System.out.println(oops.getMessage());
			System.out.println(oops.getClass());
			System.out.println(oops.getCause());
			result = this.forbiddenOpperation();
		}

		return result;
	}

	// save attachment ------------------------------------------------------------------------------------
	@RequestMapping(value = "/miscellaneousData/rookie/addAttachment", method = RequestMethod.POST, params = "save")
	public ModelAndView savePicture(@Valid final Url url, final BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			final List<ObjectError> errors = binding.getAllErrors();
			for (final ObjectError e : errors) {
				System.out.println(e.toString());
			}

			result = new ModelAndView("curricula/miscellaneousData/rookie/addAttachment");
			result.addObject("url", url);
		} else {
			try {
				MiscellaneousData miscellaneousData = this.miscellaneousDataService.findOne(url.getTargetId());
				Assert.notNull(miscellaneousData);
				Assert.isTrue(this.rookieService.findByPrincipal().getCurriculas().contains(miscellaneousData.getCurricula()));
				miscellaneousData.getAttachments().add(url);
				miscellaneousData = this.miscellaneousDataService.save(miscellaneousData);
				result = new ModelAndView("redirect:/curricula/miscellaneousData/rookie/edit.do?miscellaneousDataId=" + miscellaneousData.getId());
			} catch (final Throwable oops) {
				System.out.println(url);
				System.out.println(oops.getMessage());
				System.out.println(oops.getClass());
				System.out.println(oops.getCause());
				oops.printStackTrace();
				result = new ModelAndView("curricula/miscellaneousData/rookie/addAttachment");
				result.addObject("url", url);
			}
		}
		return result;
	}

	// Ancillary methods ------------------------------------------------------

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:/");
	}
}
