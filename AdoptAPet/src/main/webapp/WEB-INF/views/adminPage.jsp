<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<h1>This is a admin page: I AM ALL POWERFUL!!!</h1>
	<div>
		<!-- As an admin: I can update / delete any record of type pet or of type user -->
		<h1>Users username: ${user.username }</h1>
		<c:choose>
			<c:when test="${empty user.account.petList }">No Pets Yet
		</c:when>

		</c:choose>

	</div>
	<div>
		<h1>Update Pets</h1>

		<ul>
			<c:forEach var="pet" items="${petList }">
				<li>Name:<a href="showPetPage.do?id=${pet.id }">
						${pet.petName } </a>
				</li>

			</c:forEach>

		</ul>

	</div>

	<div>
		<h1>Update Users</h1>

		<ul>
			<c:forEach var="user" items="${userList }">
				<li>User Id:

					<form action="adminUpdateInformation.do" method="GET">
						<!-- UPDATE -->
						<input type="submit" value="${user.id}"> 
						<input name="id" value="${user.id}" hidden />
					</form> 
					
					Name: ${user.username } Status:
					
					<form action="adminUpdateActiveStatus.do" method="GET">
						<!-- DELETE -->
						<input type="submit" value="${user.active}"> <input
							name="id" value="${user.id}" hidden />
					</form>
				</li>

			</c:forEach>

		</ul>
	</div>


</body>
</html>
