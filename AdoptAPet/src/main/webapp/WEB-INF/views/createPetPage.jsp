<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Pet Listing</title>
</head>
<body>
	<h2>Create a Pet Listing:</h2>
	
	<form action="createPetRedirect.do" method="POST">
	
	Please enter your pet's name:
	 <input type="text" name="petName" /><br><br>
	 
	Please enter your pet's weight:
	 <input type="text" name="weight"/><br><br>
	
	Is your pet neutered?
	<select name="neutered" id="neutered">
	<option value="true">True</option>
	<option value="false">False</option>
	</select><br><br>
	
	What type of animal is your pet?
	<select name="typeOfPet" id="typeOfPet">
	<option value="dog">Dog</option>
	<option value="cat">Cat</option>
	<option value="bird">Bird</option>
	<option value="hamster">Hamster</option>
	</select><br><br>
	How big is your pet?
	<select name="petSize" id="petSize">
	<option value="xsmall">X-Small</option>
	<option value="small">Small</option>
	<option value="medium">Medium</option>
	<option value="large">Large</option>
	<option value="xlarge">X-Large</option>
	<option value="giant">Giant</option>
	</select><br><br>
	
	Please include a image url of your pet
	<input type="text" name="imageLink"/><br><br>
	<input type="submit" value="Create Pet Listing">
	</form>
	
	
</body>
</html>