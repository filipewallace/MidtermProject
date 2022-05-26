<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Update Page</title>
<jsp:include page="../bootstrapAndCSSHeader.jsp"/>
</head>
<body>
<div class="container">
	<%@ include file="../nav.jsp"%>
	<form action="updateUserInformationAsAdmin.do" method="POST">
		<label for="username"> Username: </label><input type="text"
			name="username" value="${adminToUpdate.username }" required><br>

		<label for="password"> Password: </label><input type="text"
			name="password" value="${adminToUpdate.password }" required><br>

		<input type="text" name="id" value="${adminToUpdate.id}" hidden>
		<input type="submit" name="user" value="Submit" />

	</form>
	</div>
</body>
</html>