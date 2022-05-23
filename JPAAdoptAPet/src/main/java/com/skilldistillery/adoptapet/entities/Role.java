package com.skilldistillery.adoptapet.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Role {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

	private int id;

	@Column(name = "name")
	private String roleName;

	@OneToMany(mappedBy= "role")
	private List<User> userList;

	// METHOD START
	public Role() {
		super();
	}
	public void addUser(User user) {
		if (userList == null)
			userList = new ArrayList<>();
		if (!userList.contains(user)) {
			userList.add(user);
		}
		user.setRole(this);
	}

	public void removeUser(User user) {
		user.setRole(null);
		if (userList != null) {
			userList.remove(user);
		}
	}

	// METHOD END

	// GETTER/SETTER START

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	// GETTER/SETTER END



	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + ", userList=" + userList + "]";
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
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
		Role other = (Role) obj;
		return id == other.id;
	}

}
