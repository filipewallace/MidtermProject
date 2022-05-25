<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.resize{
width: 10%;
height: auto;
}
</style>
</head>
<body>
<%@ include file="../nav.jsp" %>
	<ul>
		<c:forEach var="pet" items="${petList }">
		<li> <img class="resize" src= "${pet.imageLink }" > <br>
		
			<a href="showPetPage.do?id=${pet.id }">
					${pet.petName } </a>
			</li>

			<%--   <form action="showPetPage.do" method="GET">
			<input type="submit" id="${pet.id }" value="Show Me" />  --%>
		</c:forEach>


	</ul>

</body>
</html>