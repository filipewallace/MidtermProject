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
public class Size {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String petSize;
	
	@OneToMany(mappedBy="size")
	private List<Breed> breedList;

	public List<Breed> getBreedList() {
		return breedList;
	}

	public void setBreedList(List<Breed> breedList) {
		this.breedList = breedList;
	}

	// METHODS START
	public Size() {
		super();
	}
	
	public void addBreed(Breed breed) {
		if (breedList == null)
			breedList = new ArrayList<>();
		if (!breedList.contains(breed)) {
			breedList.add(breed);
		}
		breed.setSize(this);
	}

	public void removeBreed(Breed breed) {
		breed.setSize(null);
		if (breedList != null) {
			breedList.remove(breed);
		}
	}

	// METHODS END

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPetSize() {
		return petSize;
	}

	public void setPetSize(String petSize) {
		this.petSize = petSize;
	}

	@Override
	public String toString() {
		return "Size [id=" + id + ", petSize=" + petSize + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Size other = (Size) obj;
		return id == other.id;
	}

}
