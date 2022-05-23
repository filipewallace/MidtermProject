package com.skilldistillery.adoptapet.controllers;

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
		return "views/userPage";
	}

	@RequestMapping(path = "userPageRedirect.do")
	public String showUserRedirect() {

		return "views/userPage";
	}

	@RequestMapping(path = "createAccount.do", method = RequestMethod.GET)
	private String createAccountGet() {

		return "views/registrationPage";
	}

	@RequestMapping(path = "createAccountRedirect.do", method = RequestMethod.POST)
	private String createAccount(HttpSession session, User user, Account account, RedirectAttributes redir) {
		Address address = new Address();
		address.setId(1);
		Role role = new Role();
		role.setId(2);
		user.setRole(role);
		user.setActive(true);
		account.setAddress(address);
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
	private String loginAttempt(String username, String password, RedirectAttributes redir, HttpSession session) {

		User user = userDao.findByUsernameAndPassword(username, password);
		user.getAccount().getPetList().size();
		session.setAttribute("user", user);
		redir.addFlashAttribute("user", user);
		return "redirect:userPageRedirect.do";
	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user");

		return "redirect:home.do";
	}

}
