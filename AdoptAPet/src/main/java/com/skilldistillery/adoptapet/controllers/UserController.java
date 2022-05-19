package com.skilldistillery.adoptapet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.adoptapet.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/", "home.do" } )
	private String home(Model model) {
		
		model.addAttribute("DEBUG", userDao.findById(1));
		return "home";
	}
}
