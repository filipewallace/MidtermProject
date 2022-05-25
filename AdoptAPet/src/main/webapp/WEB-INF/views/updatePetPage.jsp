<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../bootstrapAndCSSHeader.jsp"/>
</head>
<body>
<div class="container">
<%@ include file="../nav.jsp" %>
	<h2>Update a Pet Listing:</h2>
	
	<form action="actuallyUpdating.do" method="POST">
	<input type="text" name="id" value="${pet.id }" hidden="true">
	
	<label for="petName">Please enter your pet's name:</label>
	 <input type="text" name="petName" value= "${pet.petName }" /><br><br>
	 
	 Please enter your pet's vaccination status:
	 <select name="vaccinatedStatus" id="vaccinatedStatus" > 
	<option value="true">Yes</option>
	<option value="false">No</option>	
	
	 </select><br><br>
	 
	 <label for="imageLink">Please include a image url of your pet</label>
	<input type="url" name="imageLink" value= "${pet.imageLink }"/><br><br>
	
	<label for="weight">Please enter your pet's weight:</label>
	 <input type="number" name="weight" step=".01" value= "${pet.weight }" required/><br><br>
	 
	 <label for="personality">Please enter your pet's personality:</label>
	 <input type="text" name="personality" value= "${pet.personality }"/><br><br>
	
	Is your pet neutered?
	<select name="neutered" id="neutered">
	<option value="true">True</option>
	<option value="false">False</option>
	</select><br><br>
	
	<label for="aboutMe">Tell us about your pet:</label>
	<input type="text" name="aboutMe" value= "${pet.personality }"/><br><br>
	
	Please enter your animals breed:
	<select name="breed.id" id="breedName">
	<option value="1">Golden Retriever</option>
	<option value="2">Persian</option>
	<option value="3">Mutt Medium Dog</option>
	<option value="4">Mutt Small Dog</option>
	</select><br><br>
	
	What type of animal is your pet?
	<select name="typeOfPet.id" id="typeOfPet">
	<option value="1">Dog</option>
	<option value="2">Cat</option>
	<option value="3">Bird</option>
	<option value="4">Hamster</option>
	</select><br><br>
	
	Is your animal male or female?
	<select name="sexOfPet.id" id="sexOfPet">
	<option value="1">Male</option>
	<option value="2">Female</option>
	</select><br><br>
	
	<input type="submit" value="Update Listing">
	
</form>

</div>
</body>
</html>