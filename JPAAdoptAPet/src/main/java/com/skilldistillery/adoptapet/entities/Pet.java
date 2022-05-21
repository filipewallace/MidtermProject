package com.skilldistillery.adoptapet.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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

	
	
}
