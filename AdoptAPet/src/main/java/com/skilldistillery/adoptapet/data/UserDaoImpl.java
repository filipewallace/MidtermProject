package com.skilldistillery.adoptapet.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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

}