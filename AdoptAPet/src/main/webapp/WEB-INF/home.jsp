<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Adopt A Pet</title>
</head>
<body>

	<h1>THIS IS WHERE I WOULD PUT A HOME PAGE..... IF I HAD ONE</h1>

	<form action="userPage.do" method="GET">
		Pet Name: <input type="text" name="petName" /> <input type="submit"
			value="Show Pet" />
	</form>

	<form action="loginPage.do" method="GET">
		<input type="submit" value="Login" />
	</form>
	<form action="createAccount.do" method="GET">
		<input type="submit" value="Create Account" />
	</form>
	<form action="showAllPets.do" method="GET">
		<input type="submit" value="Pet List" />
	</form>

</body>
</html>