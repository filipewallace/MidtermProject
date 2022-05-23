package com.skilldistillery.adoptapet.data;

import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.User;

public interface UserDAO {

	User findById(int userId);
	User findByUsernameAndPassword(String username, String password);
	User createUser(User user);
	User updateUser(User user);
	boolean deleteUser(int id);
	Account findAccountByID(int id);
	Account updateAccount(Account account);
}
