package com.skilldistillery.adoptapet.entities;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Breed {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="breed_name")
	private String breedName;
	
	@Column(name="hypoallergenic")
	private boolean isAllergic;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name="size_id")
	private Size size;
	
	@ManyToOne
	@JoinColumn(name="category_id")
	private Category category;

	
	// METHOD STARTS
	public Breed() {
		super();
	}

	
	
	
	
	// METHOD ENDS
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBreedName() {
		return breedName;
	}

	public void setBreedName(String breedName) {
		this.breedName = breedName;
	}

	public boolean isAllergic() {
		return isAllergic;
	}

	public void setAllergic(boolean isAllergic) {
		this.isAllergic = isAllergic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Size getSize() {
		return size;
	}

	public void setSize(Size size) {
		this.size = size;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
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
		Breed other = (Breed) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "Breed [id=" + id + ", breedName=" + breedName + ", isAllergic=" + isAllergic + ", description="
				+ description + ", size=" + size + ", category=" + category + "]";
	}
	
	
}
