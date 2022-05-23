package com.skilldistillery.adoptapet.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String typeOfPet;

	@OneToMany(mappedBy = "category")
	private List<Breed> breedList;

	// METHOD STARTS

	public Category() {
		super();
	}

	public void addBreed(Breed breed) {
		if (breedList == null)
			breedList = new ArrayList<>();
		if (!breedList.contains(breed)) {
			breedList.add(breed);
		}
		breed.setCategory(this);
	}

	public void removeBreed(Breed breed) {
		breed.setCategory(null);
		if (breedList != null) {
			breedList.remove(breed);
		}
	}

	// METHOD ENDS

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTypeOfPet() {
		return typeOfPet;
	}

	public void setTypeOfPet(String typeOfPet) {
		this.typeOfPet = typeOfPet;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	public List<Breed> getBreedList() {
		return breedList;
	}

	public void setBreedList(List<Breed> breedList) {
		this.breedList = breedList;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Category other = (Category) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Category [id=" + id + ", typeOfPet=" + typeOfPet + "]";
	}

}
