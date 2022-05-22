<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

	<ul>
		<c:forEach var="pet" items="${petList }">
			<li>Name: ${pet.petName }</li>
			<li>Breed: ${pet.breed.breedName }</li>
		</c:forEach>


	</ul>
	<form action="home.do" method="GET">
		<input type="submit" value="Home" />
	</form>

</body>
</html>