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
	<h1>This is a user page: BEHOLD!!!</h1>
	<div>

		<h1>Users username: ${user.username }</h1>

		<c:forEach var="pet" items="${user.account.petList}">
			<p>Pet is: ${pet.petName }</p>
			<p>${user.account.petList.get(0).breed}</p>

		</c:forEach>


	</div>
	<a href="home.do"> Return to home</a>


</body>
</html>