package com.skilldistillery.adoptapet.data;

import java.util.List;

import com.skilldistillery.adoptapet.entities.Pet;

public interface PetDAO {

	List<Pet> showAllPets();
	Pet createPetListing(Pet pet);
	Pet showPet(Integer id);
	boolean deletePet(Integer id);
	Pet findById(Integer id);
	Pet updatedPet(Pet pet);
}
