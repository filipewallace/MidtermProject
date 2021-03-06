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

class SizeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Size size;
	
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
		size = em.find(Size.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		size = null;
	}

	@Test
	void test_basic_mapping() {
		assertNotNull(size);
		assertEquals("xsmall", size.getPetSize());
	}
	@Test
	void test_size_to_breed() {
		size = em.find(Size.class, 2);
		assertNotNull(size);
		assertNotNull(size.getBreedList());
		assertTrue(size.getBreedList().size() > 0);
	}
	
}
