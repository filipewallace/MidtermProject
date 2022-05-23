package com.skilldistillery.adoptapet.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.adoptapet.entities.Pet;

@Service
@Transactional
public class PetDAOImpl implements PetDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Pet> showAllPets() {
		String jpql = "SELECT pet FROM Pet pet";
		
		return em.createQuery(jpql, Pet.class).getResultList();
	}

	@Override
	public Pet createPetListing(Pet pet) {
		em.persist(pet);
		return pet;
	}

	@Override
	public Pet showPet(Integer id) {
		String jpql = "SELECT p FROM Pet p WHERE p.id = :id";
		Pet pet = null;
		pet = em.createQuery(jpql, Pet.class).setParameter("id", id).getSingleResult();
		return pet;
	}
	

}
