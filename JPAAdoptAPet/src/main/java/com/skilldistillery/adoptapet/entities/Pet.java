package com.skilldistillery.adoptapet.entities;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
 
@Entity
public class Pet {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String petName;
	
	@Column(name="vaccinated")
	private boolean vaccinatedStatus;
	
	@Column(name="image_url")
	private String imageLink;
	
	@Column(name="date_of_birth")
	private LocalDate dob;
	
	private double weight;
	
	@Column(name="temperament")
	private String personality;
	
//	@ManyToOne
//	@JoinColumn(name="account_id")
//	private Account account;
	
	// ask and only dee OR alex or mason
	
	private boolean neutered;
	
	@ManyToOne
	@JoinColumn(name="breed_id")
	private Breed breed;
	
	@Column(name="about_me")
	private String aboutMe;
	
	@Column(name="active")
	private boolean activeListing;
	
	@ManyToOne
	@JoinColumn(name="pet_sex_id")
	private SexOfPet sexOfPet;

	//********************METHODS*******************************
	
	public Pet() {
		super();
	}
	
	
	//***************************************************
	//***************************************************
	//***************************************************
	//***************************************************
	//***************************************************
	//***************************************************
	
	//GETTERS N SETTERS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPetName() {
		return petName;
	}

	public void setPetName(String petName) {
		this.petName = petName;
	}

	public boolean isVaccinatedStatus() {
		return vaccinatedStatus;
	}

	public void setVaccinatedStatus(boolean vaccinatedStatus) {
		this.vaccinatedStatus = vaccinatedStatus;
	}

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	public LocalDate getDob() {
		return dob;
	}

	public void setDob(LocalDate dob) {
		this.dob = dob;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getPersonality() {
		return personality;
	}

	public void setPersonality(String personality) {
		this.personality = personality;
	}

	public boolean isNeutered() {
		return neutered;
	}

	public void setNeutered(boolean neutered) {
		this.neutered = neutered;
	}

	public Breed getBreed() {
		return breed;
	}

	public void setBreed(Breed breed) {
		this.breed = breed;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public boolean isActiveListing() {
		return activeListing;
	}

	public void setActiveListing(boolean activeListing) {
		this.activeListing = activeListing;
	}

	public SexOfPet getSexOfPet() {
		return sexOfPet;
	}

	public void setSexOfPet(SexOfPet sexOfPet) {
		this.sexOfPet = sexOfPet;
	}

	@Override
	public String toString() {
		return "Pet [id=" + id + ", petName=" + petName + ", vaccinatedStatus=" + vaccinatedStatus + ", imageLink="
				+ imageLink + ", dob=" + dob + ", weight=" + weight + ", personality=" + personality + ", neutered="
				+ neutered + ", breed=" + breed + ", aboutMe=" + aboutMe + ", activeListing=" + activeListing
				+ ", sexOfPet=" + sexOfPet + "]";
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
		Pet other = (Pet) obj;
		return id == other.id;
	}

	
	
	
}
