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


		<c:choose>
			<c:when test="${empty user.account.petList }">No Pets Yet
		</c:when>
			<c:otherwise>
				<c:forEach var="pet" items="${user.account.petList}">
					<p>Pet is: ${pet.petName }</p>
					<p>${pet.breed}</p>
					<%-- <p>${user.account.petList.get(0).breed}</p> --%>

				</c:forEach>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${empty user.account.phoneNumber }"> Please Update your information before adding pets!
							<form action="updateUserInformation.do" method="GET">
					<input type="submit" value="Update Information">
					</form>
			
			</c:when>
			<c:otherwise>
			
				<form action="createPet.do" method="GET">
					<input type="submit" value="Create Pet Listing">
				</form>
				
			</c:otherwise>
		</c:choose>

	</div>


	<form action="logout.do" method="GET">
		<input type="submit" value="Log Out" />
	</form>



</body>
</html>
