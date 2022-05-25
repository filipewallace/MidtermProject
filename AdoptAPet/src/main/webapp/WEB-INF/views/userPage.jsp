<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
<style>
.resize{
width: 10%;
height: auto;
}
</style>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<h1>This is a user page: BEHOLD!!!</h1>
	 <div>



		<h1>Users username: ${user.username }</h1>
	<c:choose>
			<c:when test="${empty user.account.petList }">No Pets Yet
		</c:when>
		<c:otherwise>
		
		<c:forEach var="pet" items="${user.account.petList}">
		 <ul>
		 <li> <img class="resize" src= "${pet.imageLink }" > </li>
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
		</ul>
		 <form action="deleted.do" method="GET">
				<input type="hidden" name="id" value=${pet.id } /> <input
					type="submit" class="button" value="Delete Pet" />
			</form>
			<form action="updated.do" method="GET">
				<input type="hidden" name="id" value=${pet.id } /> <input
					type="submit" class="button" value="Update Pet" />
			</form> 
		</c:forEach>
	</c:otherwise>
</c:choose>

		
	</div> 
	<div>

		<c:choose>
			<c:when test="${empty sessionScope.user.account.phoneNumber }"> Please Update your information before adding pets!
							<form action="updateUserInformation.do" method="GET">
					<input type="submit" value="Update Information"> <input
						name="id" value="${user.account.id }" hidden />
				</form>

			</c:when>
			<c:otherwise>

				<form action="createPet.do" method="GET">
					<input type="submit" value="Create Pet Listing">
				</form>


			</c:otherwise>
		</c:choose>

	</div>

</body>
</html>
