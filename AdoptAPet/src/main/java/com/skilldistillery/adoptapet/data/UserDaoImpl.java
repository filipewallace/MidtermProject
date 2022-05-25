package com.skilldistillery.adoptapet.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.Address;
import com.skilldistillery.adoptapet.entities.Pet;
import com.skilldistillery.adoptapet.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {

		return em.find(User.class, userId);
	}

//	@Override
//	public User findByUsernameAndPassword(String username, String password) {
//		
//		return null;
////		return em.find(User.class, username, password);
//	}
	 
	@Override
	public User findByUsernameAndPassword(String username, String password) {
		User u = null;
		String query2 = "SELECT u FROM User u";
		List<User> users = em.createQuery(query2, User.class).getResultList();
		for (User user : users) {
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}
	

	@Override
	public List<Pet> showAllPets() {
		String jpql = "SELECT pet FROM Pet pet";

		return em.createQuery(jpql, Pet.class).getResultList();
	}
	
	@Override
	public List<User> showAllUsers() {
		String jpql = "SELECT u FROM User u";
		
		return em.createQuery(jpql, User.class).getResultList();
	}
	

	@Override
	public Account findAccountByID(int id) {
//		String query = "SELECT a FROM Account a WHERE a.id = :id";
		Account account = em.find(Account.class, id);
		return account;
	}
	@Override
	public User createUser(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public User updateUser(int id) {
		User user = em.find(User.class, id);
		return user;
	}
	
	@Override
	public User adminUpdateUser(User user) {
		User updatedUser = em.find(User.class, user.getId());
		
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		return updatedUser;
	}

	@Override
	public boolean deleteUser(int id) {
		User userToDelete = em.find(User.class, id);
		if(userToDelete.isActive()) {
			userToDelete.setActive(false);
		}
		else {
			userToDelete.setActive(true); 
		}
		userToDelete.isActive();
		 
		return false; 
	}

	@Override
	public Account updateAccount(Account account) {
		Account updatedAccount = em.find(Account.class, account.getId());
		
		updatedAccount.setFirstName(account.getFirstName());
		updatedAccount.setLastName(account.getLastName());
		updatedAccount.setEmail(account.getEmail());
		updatedAccount.setPhoneNumber(account.getPhoneNumber());
		updatedAccount.setDob(account.getDob());

		updatedAccount.setAboutMe(account.getAboutMe());
		
		return updatedAccount;
	}

	@Override
	public Address updateMyAddress(Address address) {
		Address updatedAddress = em.find(Address.class, address.getId());
		
		updatedAddress.setPrimaryStreet(address.getPrimaryStreet());
		updatedAddress.setSecondaryStreet(address.getSecondaryStreet());
		updatedAddress.setCity(address.getCity());
		updatedAddress.setStateAbbreviation(address.getStateAbbreviation());
		updatedAddress.setZipcode(address.getZipcode());
		
		return updatedAddress;  
	}

	@Override
	public Address createAddress(Address address) {
		em.persist(address);
		
		return address;
	}




}