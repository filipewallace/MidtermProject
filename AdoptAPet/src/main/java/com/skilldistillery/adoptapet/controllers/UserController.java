package com.skilldistillery.adoptapet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.adoptapet.data.UserDAO;
import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/", "home.do" } )
	private String home(Model model) {
		
		model.addAttribute("DEBUG", userDao.findById(1));
		return "home";
	}
	
	@RequestMapping("userPage.do")
	private String showUser(@RequestParam("id")int id, Model model) {
		User user = userDao.findById(id);
		model.addAttribute("user", user);
		return "views/userPage";
	}
	@RequestMapping(path="userPageRedirect.do")
	public String showUserRedirect() {
		
		return "views/userPage";
	}
	@RequestMapping(path="loginPage.do", method= RequestMethod.GET)
	private String loginPage(Model model) {
		
		return "views/loginPage";
	}
	@RequestMapping(path="create.do", method= RequestMethod.GET)
	private String createAccountGet() {
		
		return "views/createAccount";
	}
	@RequestMapping(path="createAccount.do", method= RequestMethod.POST)
	private String createAccount(User user, Account account, RedirectAttributes redir) {
		user.setAccount(account);
		user = userDao.createUser(user);
		
		redir.addFlashAttribute("user", user);
		return "";
	}
}
