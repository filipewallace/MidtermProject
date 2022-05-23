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
import javax.persistence.Table;

@Entity
@Table(name="pet_sex")
public class SexOfPet {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String maleOrFemale;
	
	@OneToMany(mappedBy="sexOfPet")
	private List<Pet> petList;

	// METHODS
	
	public SexOfPet() {
		super();
	}
	public void addPet(Pet pet) {
		if (petList == null)
			petList = new ArrayList<>();
		if (!petList.contains(pet)) {
			petList.add(pet);
		}
		pet.setSexOfPet(this);
	}

	public void removePet(Pet pet) {
		pet.setSexOfPet(null);
		if (petList != null) {
			petList.remove(pet);
		}
	}
	
 // METHODS END
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMaleOrFemale() {
		return maleOrFemale;
	}

	public void setMaleOrFemale(String maleOrFemale) {
		this.maleOrFemale = maleOrFemale;
	}

	

	public List<Pet> getPetList() {
		return petList;
	}

	public void setPetList(List<Pet> petList) {
		this.petList = petList;
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
		SexOfPet other = (SexOfPet) obj;
		return id == other.id;
	}
	@Override
	public String toString() {
		return "SexOfPet [id=" + id + ", maleOrFemale=" + maleOrFemale + "]";
	}
	
	
}
