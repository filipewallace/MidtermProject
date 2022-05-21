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

class PetTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
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
		pet = em.find(Pet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		pet = null;
	}

	@Test
	void test_basic_mapping() {
		assertNotNull(pet);
		assertEquals("Fluffy", pet.getPetName());
		assertEquals("Friendly", pet.getPersonality());
		assertEquals(12.50, pet.getWeight());
		
	}
	@Test
	void test_pet_to_account_mappings() {
		assertNotNull(pet);
		assertEquals("Ron", pet.getAccount().getFirstName());
		assertEquals("Weasley", pet.getAccount().getLastName());
	}
	@Test
	void test_pet_to_sex_mapping() {
		assertNotNull(pet);
		assertNotNull(pet.getSexOfPet());
		assertEquals("male" , pet.getSexOfPet().getMaleOrFemale());
	}
	@Test
	void test_pet_to_sex_mapping2() {
		pet = em.find(Pet.class, 2);
		assertNotNull(pet);
		assertNotNull(pet.getSexOfPet());
		assertEquals("female" , pet.getSexOfPet().getMaleOrFemale());
	}
	@Test
	void test_pet_to_breed() {
		assertNotNull(pet);
		assertNotNull(pet.getBreed());
		assertEquals("Persian", pet.getBreed().getBreedName());
	}
}
