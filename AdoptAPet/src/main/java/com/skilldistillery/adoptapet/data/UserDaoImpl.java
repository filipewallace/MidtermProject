package com.skilldistillery.adoptapet.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.adoptapet.entities.Account;
import com.skilldistillery.adoptapet.entities.Address;
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
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return user;
	}

	@Override
	public boolean deleteUser(int id) {
		// TODO Auto-generated method stub
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