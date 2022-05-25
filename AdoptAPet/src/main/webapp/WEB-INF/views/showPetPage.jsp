<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I am Me</title>
<style>
.resize{
width: 10%;
height: auto;
}
</style>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<c:choose>
		
		 <c:when test="${not empty user  }">
		 <c:choose> 
		 <c:when test="${empty pet }">Invalid Pet</c:when>
		 <c:otherwise> 
		 <ul>
		<li> <img class="resize" src= "${pet.imageLink }" > <br>
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
		  </c:otherwise>
		 </c:choose>
		
 
		</c:when>
		<c:otherwise>Create an account to see full pet listing </c:otherwise>

	</c:choose>
</body>
</html>