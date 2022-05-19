package com.skilldistillery.adoptapet.data;

import com.skilldistillery.adoptapet.entities.User;

public interface UserDAO {

	User findById(int userId);
	User findByUsernameAndPassword(String username, String password);
	
}
