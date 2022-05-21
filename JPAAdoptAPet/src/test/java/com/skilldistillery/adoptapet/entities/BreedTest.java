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

class BreedTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Breed breed;

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
		breed = em.find(Breed.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		breed = null;
	}

	@Test
	void test() {
		assertNotNull(breed);
		assertEquals("Golden Retriever", breed.getBreedName());
	}

}
