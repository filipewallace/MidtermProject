<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Pet Listing</title>
</head>
<body>
<%@ include file="../nav.jsp" %>
	<h2>Create a Pet Listing:</h2>
	
	<form action="createPetRedirect.do" method="POST">
	
	Please enter your pet's name:
	 <input type="text" name="petName"required  /><br><br>
	 
	 Please enter your pet's DOB:
	 <input type="date" name="dateofbirth" required /><br><br>
	 
	  Please enter your pet's vaccination status:
	 <select name="vaccinatedStatus" id="vaccinatedStatus"required >
	<option value="true">True</option>
	<option value="false">False</option>	
	 </select>
	 
	  Please include a image url of your pet
	<input type="text" name="imageLink"/>
	<br><br>
	 
	Please enter your pet's weight:
	 <input type="text" name="weight"required /><br><br>
	 
	  Please enter your pet's personality:
	 <input type="text" name="personality"required /><br><br>
	
	Is your pet neutered?
	<select name="neutered" id="neutered" required >
	<option value="true">True</option>
	<option value="false">False</option>
	</select><br><br>
	
	Tell us about your pet:
	<input type="text" name="aboutMe"required /><br><br>
	
	Please enter your animals breed:
	<select name="breedName" id="breedName"required >
	<option value="1">Golden Retriever</option>
	<option value="2">Persian</option>
	<option value="3">Mutt Medium Dog</option>
	<option value="4">Mutt Small Dog</option>
	</select><br><br>
	
	What type of animal is your pet?
	<select name="typeOfPet" id="typeOfPet"required >
	<option value="dog">Dog</option>
	<option value="cat">Cat</option>
	<option value="bird">Bird</option>
	<option value="hamster">Hamster</option>
	</select><br><br>
	
	Is your animal male or female?
	<select name="sexOfPetType" id="sexOfPet"required >
	<option value="1">Male</option>
	<option value="2">Female</option>
	</select><br><br>
	
	<input type="submit" value="Create Pet Listing">
	</form>
	
</body>
</html>