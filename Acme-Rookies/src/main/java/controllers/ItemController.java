
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

import services.ItemService;
import services.ProviderService;
import domain.Item;
import domain.Provider;
import domain.Url;

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
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Item> items;

		Provider principal = this.providerService.findByPrincipal();

		items = principal.getItems();

		result = new ModelAndView("item/list");
		result.addObject("items", items);
		result.addObject("requestURI", "item/list.do");

		return result;
	}

	// List -------------------------------------------------------------
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public ModelAndView listAll() {
		ModelAndView result;
		Collection<Item> items;

		try {
			items = this.itemService.findAll();

			result = new ModelAndView("item/list");
			result.addObject("items", items);
			result.addObject("requestURI", "item/listAll.do");
		} catch (Throwable oops) {
			return this.forbiddenOperation();
		}

		return result;
	}

	// provider List -------------------------------------------------------------
	@RequestMapping(value = "/provider", method = RequestMethod.GET)
	public ModelAndView provider(@RequestParam int providerId) {
		ModelAndView result;
		Collection<Item> items;

		try {
			Provider principal = this.providerService.findOne(providerId);

			items = principal.getItems();

			result = new ModelAndView("item/list");
			result.addObject("items", items);
			result.addObject("requestURI", "item/provider.do");
		} catch (Throwable oops) {
			return this.forbiddenOperation();
		}

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
			return this.forbiddenOperation();
		}

		result = this.editModelAndView(item);
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
				result = new ModelAndView("redirect:../list.do");
			} catch (Throwable oops) {
				oops.printStackTrace();
				result = this.createEditModelAndView(item, "profile.commit.error");
			}
		return result;
	}

	// Delete ------------------------------------------------------
	@RequestMapping(value = "/provider/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(Item item, BindingResult binding) {
		ModelAndView result;

		try {
			Provider principal = this.providerService.findByPrincipal();
			Assert.notNull(item);
			Assert.isTrue(principal.getItems().contains(item));
			this.itemService.delete(item);
			result = new ModelAndView("redirect:../list.do");
		} catch (Throwable oops) {
			result = this.editModelAndView(item, "item.commit.error");
		}

		return result;
	}

	//Display
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ModelAndView display(@RequestParam int itemId) {
		ModelAndView result = null;
		Item item = null;

		result = new ModelAndView("item/display");

		try {
			item = this.itemService.findOne(itemId);
		} catch (final Exception e) {
			return this.forbiddenOperation();
		}

		result.addObject("item", item);
		result.addObject("pictures", item.getPictures());
		return result;
	}

	// Add Picture GET  ---------------------------------------------------------------
	@RequestMapping(value = "/provider/addPicture", method = RequestMethod.GET)
	public ModelAndView addLink(@RequestParam int itemId) {
		ModelAndView result;
		Item item;
		Url url;

		// Comprueba que el tutorial no es null y que le pertenece al worker
		try {
			Provider principal = this.providerService.findByPrincipal();
			item = this.itemService.findOne(itemId);
			Assert.notNull(item);
			Assert.isTrue(principal.getItems().contains(item));
		} catch (final Exception e) {
			return this.forbiddenOperation();
		}

		url = new Url();
		url.setTargetId(item.getId());

		result = new ModelAndView("item/provider/addPicture");
		result.addObject("url", url);
		result.addObject("item", item);

		return result;
	}

	// Add Picture POST -------------------------------------------------------------
	@RequestMapping(value = "/provider/addPicture", method = RequestMethod.POST, params = "save")
	public ModelAndView addLink(@Valid Url url, BindingResult binding) {
		ModelAndView result;

		Item item = this.itemService.findOne(url.getTargetId());

		if (binding.hasErrors()) {
			result = new ModelAndView("item/provider/addPicture");
			result.addObject("url", url);
			result.addObject("item", item);
		} else
			try {
				item.getPictures().add(url);
				this.itemService.save(item);
				result = new ModelAndView("redirect:/item/display.do?itemId=" + item.getId());
			} catch (final Throwable oops) {
				result = this.editModelAndView(item, "item.commit.error");
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

		result = new ModelAndView("item/provider/create");
		result.addObject("item", item);
		result.addObject("message", message);

		return result;
	}

	protected ModelAndView editModelAndView(Item item) {
		ModelAndView result;

		result = this.createEditModelAndView(item, null);

		return result;
	}

	protected ModelAndView editModelAndView(Item item, String message) {
		ModelAndView result;

		result = new ModelAndView("item/provider/edit");
		result.addObject("item", item);
		result.addObject("message", message);

		return result;
	}

	private ModelAndView forbiddenOperation() {
		return new ModelAndView("redirect:list.do");
	}

}
