package com.skilldistillery.adoptapet.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="street")
	private String primaryStreet;
	
	@Column(name="street2")
	private String secondaryStreet;
	
	private String city;
	
	@Column(name="state_abbr")
	private char stateAbbreviation;
	
	private String zipcode;
	
	@OneToOne(mappedBy="address")
	private Account account;
	
	//METHOD START
	
	public Address() {
		super();
	}
	
	//METHOD END
	
	//GETTERS/SETTERS START

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPrimaryStreet() {
		return primaryStreet;
	}

	public void setPrimaryStreet(String primaryStreet) {
		this.primaryStreet = primaryStreet;
	}

	public String getSecondaryStreet() {
		return secondaryStreet;
	}

	public void setSecondaryStreet(String secondaryStreet) {
		this.secondaryStreet = secondaryStreet;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public char getStateAbbreviation() {
		return stateAbbreviation;
	}

	public void setStateAbbreviation(char stateAbbreviation) {
		this.stateAbbreviation = stateAbbreviation;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	
	
	//GETTERS/SETTERS END

	

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
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
		Address other = (Address) obj;
		return id == other.id;
	}

	
	
	

}
