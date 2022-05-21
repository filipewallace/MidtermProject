package com.skilldistillery.adoptapet.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pet_sex")
public class SexOfPet {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String maleOrFemale;

	// METHODS
	
	public SexOfPet() {
		super();
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
