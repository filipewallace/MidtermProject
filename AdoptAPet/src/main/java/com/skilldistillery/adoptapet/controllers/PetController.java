package com.skilldistillery.adoptapet.controllers;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.adoptapet.data.PetDAO;
import com.skilldistillery.adoptapet.data.UserDAO;
import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.Pet;
import com.skilldistillery.adoptapet.entities.User;

@Controller
public class PetController {

	@Autowired
	private PetDAO petDao;
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "showPetPage.do")
	public String showPet(Model model, Integer id) {
	Pet pet = petDao.showPet(id);
	model.addAttribute("pet", pet);
	return "views/showPetPage";
	
	
	}
	@RequestMapping(path = "showAllPets.do")
	public String showAllPets(Model model) {
		List<Pet> petList = petDao.showAllPets();
		model.addAttribute("petList", petList);
		return "views/showAllPetsPage";
	}

	@RequestMapping(path = "createPet.do", method = RequestMethod.GET)
	public String createPetGet(Account account, Pet pet, RedirectAttributes redir) {
		return "views/createPetPage";
	}

	@RequestMapping(path = "createPetRedirect.do", method = RequestMethod.POST)
	private String createPet(String breedName, String sexOfPetType, HttpSession session, Pet pet, RedirectAttributes redir, String dateofbirth) {
		
		System.out.println("**********SEX/BREED*******" + breedName + " " + sexOfPetType);
		DateTimeFormatter dtformatter = DateTimeFormatter.ISO_DATE;
		LocalDate ld = LocalDate.parse(dateofbirth, dtformatter);
		pet.setDob(ld);
		
		User user = (User) session.getAttribute("user");
		user.getAccount().addPet(pet);


		pet = petDao.createPetListing(pet, sexOfPetType, breedName);
		session.setAttribute("user", user);

//		redir.addFlashAttribute("pet", pet);

		return "redirect:userPageRedirect.do";
	}
	
	@RequestMapping(path="deleted.do", method = RequestMethod.GET)
	public String deletePet(HttpSession session, Integer id, Model model) {
		Pet pet = petDao.findById(id);
		User user = (User) session.getAttribute("user");
		user.getAccount().removeFilm(pet);
		session.setAttribute("user", user);
		
		boolean deleted = petDao.deletePet(id);
		model.addAttribute("deleted", deleted);
		
		
		return "views/deletedPet";
	}
	
	@RequestMapping(path="updated.do", method = RequestMethod.GET)
	public String updatePetGet(Integer id, Model model) {
		System.out.println("***************" + id + "********************");
		Pet pet = petDao.findById(id);
		model.addAttribute("pet", pet);
		return "views/updatePetPage";
	}
	@RequestMapping(path="actuallyUpdating.do", method = RequestMethod.POST)
	public String updatePet(HttpSession session, Pet pet) {
		
		petDao.updatedPet(pet);
		User user = (User) session.getAttribute("user");
		User managedUser = userDao.findById(user.getId());
		managedUser.getAccount().getPetList().size();
		session.setAttribute("user", managedUser);
		
		return "redirect:userPageRedirect.do";
	}
}
