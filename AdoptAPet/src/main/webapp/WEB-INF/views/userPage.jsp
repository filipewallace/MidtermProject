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
	<h3>${user.account }</h3>
	<h3>${user.account.petList }</h3>
	 <div>

		<h1>Users username: ${user.username }</h1>
		
		<c:forEach var="pet" items="${user.account.petList}">
		<h1>${pet }</h1>
		 <ol>
		<li>Name : ${pet.petName }</li>
		<li>Vaccination Status: ${pet.vaccinatedStatus }</li>
		 <li>Pet Weight: ${pet.weight }</li>
		<li>Pet's Personality: ${pet.personality }</li>
		<li>Neutered? ${pet.neutered }</li>
		<li>About me: ${pet.aboutMe }</li>
		<li>Sex: ${pet.sexOfPet }</li>
		 <li>Pet's Breed: ${pet.breed }<br> 
			 Is Hypoallergenic: ${pet.breed.isAllergic }<br> 
			Breed's Size: ${pet.breed.size.petSize }<br>
			Type of Animal: ${pet.breed.category.typeOfPet }<br> 
			Description of Breed: ${pet.breed.description }</li> 
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
