package com.skilldistillery.adoptapet.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.adoptapet.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
}
