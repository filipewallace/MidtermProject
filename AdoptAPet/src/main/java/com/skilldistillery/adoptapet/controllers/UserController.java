package com.skilldistillery.adoptapet.controllers;

import java.text.DateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.adoptapet.data.UserDAO;
import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.Address;
import com.skilldistillery.adoptapet.entities.Pet;
import com.skilldistillery.adoptapet.entities.Role;
import com.skilldistillery.adoptapet.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	private String home(Model model) {

		model.addAttribute("DEBUG", userDao.findById(1));
		return "home";
	}

	@RequestMapping("userPage.do")
	private String showUser(@RequestParam("id") int id, Model model) {
		User user = userDao.findById(id);
		model.addAttribute("user", user);
		if(user.getRole().getId()==1){
			adminAttributes(model);
			return "views/adminPage"; 
		}
		return "views/userPage";
	}

	@RequestMapping(path = "userPageRedirect.do")
	public String showUserRedirect(HttpSession session) {
		User user2 = (User) session.getAttribute("user");
//		System.out.println("****************ACCOUNT*********************" + user2.getAccount());
//		System.out.println("****************PET LIST SIZE*********************" + user2.getAccount().getPetList().size());
		return "views/userPage";
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.GET)
	private String createAccountGet() {

		return "views/registrationPage";
	}

	@RequestMapping(path = "createAccountRedirect.do", method = RequestMethod.POST)
	private String createAccount(HttpSession session, User user, Account account, RedirectAttributes redir) {
		Role role = new Role();
		Address address = new Address();
		address = userDao.createAddress(address);
		role.setId(2);
		user.setRole(role);
		account.setAddress(address);
		user.setActive(true);
		account.setActive(true);
		user.setAccount(account);
		user = userDao.createUser(user);
		session.setAttribute("user", user);

		redir.addFlashAttribute("user", user);
		return "redirect:userPageRedirect.do";
	}

	@RequestMapping(path = "loginPage.do", method = RequestMethod.GET)
	private String loginPage() {

		return "views/loginPage";
	}

	@RequestMapping(path = "loginAttempt.do", method = RequestMethod.POST)
	private String loginAttempt(String username, String password, RedirectAttributes redir, HttpSession session, Model model) {
		User user = null;

		try {
			user = userDao.findByUsernameAndPassword(username, password);
			user.getAccount().getPetList().size();
		} catch (NullPointerException e) {
			return "views/failedLogin";
		}
		
		if (user.isActive()) {
			session.setAttribute("user", user);
			if (user.getRole().getId() == 1) {
				adminAttributes(model);
				return "views/adminPage";
			}
			redir.addFlashAttribute("user", user);
			return "redirect:userPageRedirect.do";
		} else {
			return "views/failedLogin";
		}
	}
	
	@RequestMapping(path = "updateUserInformation.do", method = RequestMethod.GET)
	private String userInformationUpdate(int id, HttpSession session, Model model) {
		Account account = userDao.findAccountByID(id);
		model.addAttribute("account" , account);
		return "views/userInformationUpdate";
	}
	@RequestMapping(path = "updateMyInformation.do", method = RequestMethod.POST)
	private String userUpdateMyInformation(Account account, String dateToBeChanged, RedirectAttributes redir, HttpSession session) {
		System.out.println(account);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate ld = LocalDate.parse(dateToBeChanged, dtf);
		System.out.println("**********" + ld + "******************");
		account.setDob(ld);
		Account accountUpdated = userDao.updateAccount(account);
		System.out.println(accountUpdated);
		accountUpdated.getPetList().size();
//		Account account = (User) session.getAttribute(null);
		session.setAttribute("user", accountUpdated.getUser());
		return "redirect:userPageRedirect.do";
		
	}
	
	@RequestMapping(path = "updateMyAddress.do", method = RequestMethod.POST)
	private String userUpdateAddress(Address address, RedirectAttributes redir, HttpSession session) {
		System.out.println(address.getPrimaryStreet());
		Address addressUpdate = userDao.updateMyAddress(address);
		System.out.println(addressUpdate.getPrimaryStreet());
		
		session.setAttribute("address", addressUpdate.getId());
		
		return "redirect:userPageRedirect.do"; 
	}
	
	@RequestMapping(path = "adminUpdateInformation.do")
	private String adminUpdateUserInfo(int id, RedirectAttributes redir, HttpSession session) {
		User adminToUpdate = userDao.updateUser(id); 
		
		session.setAttribute("adminToUpdate", adminToUpdate); 
		
		return "views/adminUpdateInformation"; 
	}
	
	@RequestMapping(path = "updateUserInformationAsAdmin.do")
	private String adminFormUpdateSubmit(User user, RedirectAttributes redir, HttpSession session, Model model) {
		
		User user2 = userDao.adminUpdateUser(user);
		user2.getId();
		
		
		adminAttributes(model);
		
		return "views/adminPage";
	}

	private void adminAttributes(Model model) {
		List<Pet> petList = userDao.showAllPets(); 
		model.addAttribute("petList", petList);
		
		List<User> userList = userDao.showAllUsers();
		model.addAttribute("userList", userList);
	}
	
	@RequestMapping(path = "adminUpdateActiveStatus.do")
	private String adminDeleteUser(int id, RedirectAttributes redir, HttpSession session, Model model) {
		
		boolean adminToSetToInactive = userDao.deleteUser(id); 
		
		adminAttributes(model);
		
		return "views/adminPage"; 
	}
	// TODO move this to PetController
//	@RequestMapping(path = "adminUpdateInformation.do")
//	private String adminUpdatePetInfo(Pet petListing, RedirectAttributes redir, HttpSession session) {
//		Pet adminToUpdate = petDao.updatedPet(petListing); 
//		session.setAttribute("pet", adminToUpdate); 
//		return "redirect:";
//	} 

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");

		return "redirect:home.do";
	}

}

