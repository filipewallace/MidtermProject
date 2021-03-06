package com.skilldistillery.adoptapet.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class RoleTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Role role;
	
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
		role = em.find(Role.class, 2);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		role = null;
	}
	@Test
	void test_basic_role_mapping() {
		assertNotNull(role);
		assertEquals("registered_user", role.getRoleName());
		
	}
	@Test
	void test_role_to_user() {
		
		assertNotNull(role);
		assertTrue(role.getUserList().size() > 0);
	}
}
