package com.skilldistillery.adoptapet.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAAdoptAPet");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		user = em.find(User.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("sarah", user.getUsername());
	}


	@Test
	void test_user_to_account_mapping() {
		assertNotNull(user);
		assertEquals("Sarah", user.getAccount().getFirstName());
		assertEquals("Nelson", user.getAccount().getLastName());
	}
//	 SELECT role.name FROM role JOIN user ON role.id = user.role_id WHERE role.id =2;
	@Test
	void test_user_to_role_mapping() {
		assertNotNull(user);
		assertNotNull(user.getRole().getRoleName());
		assertEquals("registered_user", user.getRole().getRoleName());
	}
}
