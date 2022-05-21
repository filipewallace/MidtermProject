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
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

public class AccountTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Account account;
	private Pet pet;
	
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
		account = em.find(Account.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}
	
//	
	@Test
	@DisplayName("testing basic useraccount mapping")
	void test_useraccount_mapping() {
		assertNotNull(account);
		assertEquals("Ron", account.getFirstName());
		assertEquals("Weasley", account.getLastName());
	}
//	@Test
//	@DisplayName("testing basic useraccount mapping")
//	void test_pet_mapping() {
//		assertNotNull(pet);
//		assertEquals("Fluffy", pet.getPetName());
//		
//	}
}
