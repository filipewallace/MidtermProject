package com.skilldistillery.adoptapet.controllers;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.adoptapet.data.PetDAO;
import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.Pet;
import com.skilldistillery.adoptapet.entities.User;

@Controller
public class PetController {

	@Autowired
	private PetDAO petDao;
	
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
	private String createPet(HttpSession session, Pet pet, RedirectAttributes redir) {
		User user = (User) session.getAttribute("user");
		user.getAccount().addPet(pet);

//		pet.setAccount(user.getAccount());

		pet = petDao.createPetListing(pet);
		user.getAccount().getPetList().add(pet);
		session.setAttribute("user", user);

		redir.addFlashAttribute("pet", pet);

		return "redirect:userPageRedirect.do";
	}
//	private String updatePetListing(Model model, Pet Pet, )
}
