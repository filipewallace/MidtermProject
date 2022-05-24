package com.skilldistillery.adoptapet.data;

import java.util.List;

import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.Address;
import com.skilldistillery.adoptapet.entities.Pet;
import com.skilldistillery.adoptapet.entities.User;

public interface UserDAO {

	User findById(int userId);
	User findByUsernameAndPassword(String username, String password);
	User createUser(User user);
	User updateUser(User user);
	boolean deleteUser(int id);
	Account findAccountByID(int id);
	Account updateAccount(Account account);
	Address updateMyAddress(Address address);
	Address createAddress(Address address);
	List<Pet> showAllPets();
	List<User> showAllUsers();
}
