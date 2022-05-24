package com.skilldistillery.adoptapet.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

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
	void test_basic_mapping() {
		assertNotNull(breed);
		assertEquals("Golden Retriever", breed.getBreedName());
		assertTrue(breed.getIsAllergic());
	}
	@Test
	void test_breed_to_pet_mapping() {
		breed = em.find(Breed.class,4);
		assertNotNull(breed);
		assertNotNull(breed.getPetList());
		assertTrue(breed.getPetList().size() > 0);
	}
	@Test
	void test_breed_to_category_mapping() {
		breed = em.find(Breed.class, 1);
		assertNotNull(breed);
		assertNotNull(breed.getCategory());
		assertEquals("dog", breed.getCategory().getTypeOfPet());
	}
	@Test
	void test_breed_to_size() {
		breed = em.find(Breed.class, 2);
		assertNotNull(breed);
		assertNotNull(breed.getSize());
		assertEquals("small" , breed.getSize().getPetSize());
	}
}
