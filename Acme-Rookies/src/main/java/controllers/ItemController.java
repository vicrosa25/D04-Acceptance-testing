
package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.hibernate.TypeMismatchException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Item;
import domain.Provider;
import services.ItemService;
import services.ProviderService;

@Controller
@RequestMapping("/item")
public class ItemController extends AbstractController {

	@Autowired
	private ItemService		itemService;

	@Autowired
	private ProviderService	providerService;


	@ExceptionHandler(TypeMismatchException.class)
	public ModelAndView handleMismatchException(TypeMismatchException oops) {
		return new ModelAndView("redirect:/");
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "/provider/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Item> items;

		Provider principal = this.providerService.findByPrincipal();

		items = principal.getItems();

		result = new ModelAndView("item/provider/list");
		result.addObject("items", items);
		result.addObject("requestURI", "item/provider/list.do");

		return result;
	}

	// Create ---------------------------------------------------------------
	@RequestMapping(value = "/provider/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		Item item;

		item = this.itemService.create();
		result = this.createEditModelAndView(item);

		return result;
	}

	// Edit -------------------------------------------------------------
	@RequestMapping(value = "/provider/edit", method = RequestMethod.GET)
	public ModelAndView edit(@RequestParam int itemId) {
		ModelAndView result;
		Item item;

		Provider principal = this.providerService.findByPrincipal();

		try {
			item = this.itemService.findOne(itemId);
			Assert.isTrue(principal.getItems().contains(item));
		} catch (Throwable oops) {
			return this.forbiddenOpperation();
		}

		result = this.createEditModelAndView(item);
		return result;
	}

	// Save -------------------------------------------------------------
	@RequestMapping(value = "/provider/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid Item item, BindingResult binding) {
		ModelAndView result;

		if (binding.hasErrors())
			result = this.createEditModelAndView(item);
		else
			try {
				this.itemService.save(item);
				result = new ModelAndView("redirect:list.do");
			} catch (Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(item, "profile.commit.error");
			}
		return result;
	}

	// Delete ------------------------------------------------------
	@RequestMapping(value = "/provider/delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam int itemId) {
		ModelAndView result;
		Item identity;

		identity = this.itemService.findOne(itemId);

		try {
			this.itemService.delete(identity);
			result = new ModelAndView("redirect:list.do");
		} catch (Throwable oops) {
			result = this.createEditModelAndView(identity, "profile.commit.error");
		}

		return result;
	}

	// Ancillary methods ------------------------------------------------------
	protected ModelAndView createEditModelAndView(Item item) {
		ModelAndView result;

		result = this.createEditModelAndView(item, null);

		return result;
	}

	protected ModelAndView createEditModelAndView(Item item, String message) {
		ModelAndView result;

		result = new ModelAndView("item/provider/edit");
		result.addObject("item", item);
		result.addObject("message", message);

		return result;
	}

	private ModelAndView forbiddenOpperation() {
		return new ModelAndView("redirect:list.do");
	}

}
