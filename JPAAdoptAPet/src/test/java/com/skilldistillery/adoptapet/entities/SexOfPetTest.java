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

class SexOfSexOfPetTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private SexOfPet sexofpet;

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
		sexofpet = em.find(SexOfPet.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		sexofpet = null;
	}

	@Test
	void test() {
		assertNotNull(sexofpet);
		assertEquals("male", sexofpet.getMaleOrFemale());
	}

}
