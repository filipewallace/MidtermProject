package com.skilldistillery.adoptapet.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String typeOfPet;
	
	// METHOD STARTS

	public Category() {
		super();
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