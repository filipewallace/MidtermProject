package com.skilldistillery.adoptapet.data;

import java.util.List;

import com.skilldistillery.adoptapet.entities.Pet;

public interface PetDAO {

	List<Pet> showAllPets();
	Pet createPetListing(Pet pet);
}
