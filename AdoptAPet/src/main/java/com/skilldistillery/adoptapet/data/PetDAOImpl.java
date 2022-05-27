package com.skilldistillery.adoptapet.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.adoptapet.entities.Breed;
import com.skilldistillery.adoptapet.entities.Pet;
import com.skilldistillery.adoptapet.entities.SexOfPet;

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
	public Pet createPetListing(Pet pet, String sexOfPetType, String breedName) {
		SexOfPet sex = em.find(SexOfPet.class, Integer.parseInt(sexOfPetType));
		
		Breed breed = em.find(Breed.class, Integer.parseInt(breedName));
		
		pet.setSexOfPet(sex);
		pet.setBreed(breed);
		
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

	@Override
	public boolean deletePet(Integer id) {
		
		boolean deleted = false;
		Pet deletedPet = em.find(Pet.class, id);

		if (deletedPet != null) {
			em.remove(deletedPet);
			deleted = !em.contains(deletedPet);
		}
		return deleted;
	}

	@Override
	public Pet findById(Integer id) {
		
		
		return em.find(Pet.class, id);
	}

	@Override
	public Pet updatedPet(Pet pet) {
		Pet updatedPet = em.find(Pet.class, pet.getId());
		updatedPet.setPetName(pet.getPetName());
		updatedPet.setVaccinatedStatus(pet.isVaccinatedStatus());
		updatedPet.setImageLink(pet.getImageLink());
		updatedPet.setDob(pet.getDob());
		updatedPet.setWeight(pet.getWeight());
		updatedPet.setPersonality(pet.getPersonality());
		updatedPet.setNeutered(pet.isNeutered());
		updatedPet.setAboutMe(pet.getAboutMe());
		
		try {
			updatedPet.setBreed(em.find(Breed.class, pet.getBreed().getId()));
		} catch (NullPointerException e) {
			e.printStackTrace();
		}
		try {
			updatedPet.setSexOfPet(em.find(SexOfPet.class, pet.getSexOfPet().getId()));
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		return null;
	}

}
