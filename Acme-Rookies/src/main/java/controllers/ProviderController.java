package controllers;

import org.hibernate.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.ProviderService;

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
}
