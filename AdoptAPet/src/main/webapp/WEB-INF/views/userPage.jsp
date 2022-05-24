<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<h1>This is a user page: BEHOLD!!!</h1>
	<div>

		<h1>Users username: ${user.username }</h1>
		
		<c:forEach var="pet" items="${user.account.petList}">
		<ol>
		<li>Name : ${pet.petName }</li>
		<li>Vaccination Status: ${pet.vaccinatedStatus }</li>
		<li>Pet Weight: ${pet.weight }</li>
		<li>Pet's Personality: ${pet.personality }</li>
		<li>Neutered? ${pet.neutered }</li>
		<li>About me: ${pet.aboutMe }</li>
		<li>Pet's Breed: ${pet.breed }</li>
		<li>Sex: ${pet.sexOfPet }</li>
		</ol>
			<form action="deleted.do" method="GET">
				<input type="hidden" name="id" value=${pet.id } /> <input
					type="submit" class="button" value="Delete Pet" />
			</form>
			<form action="updated.do" method="GET">
				<input type="hidden" name="id" value=${pet.id } /> <input
					type="submit" class="button" value="Update Pet" />
			</form>
		</c:forEach>
		
		<%-- 	<p>Pet is: ${pet.petName }</p>
			<p>${pet.breed}</p> --%>
		
	</div>
	<form action="createPet.do" method="GET">
		<input type="submit" value="Create Pet Listing" />
	</form>

	<form action="logout.do" method="GET">
		<input type="submit" value="Log Out" />
	</form>
	<form action="home.do" method="GET">
		<input type="submit" value="Home" />
	</form>



</body>
</html>
