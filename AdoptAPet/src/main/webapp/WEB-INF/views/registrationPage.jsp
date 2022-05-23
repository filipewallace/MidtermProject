<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
</head>
<body>
<form action="createAccountRedirect.do" method="POST">
	<h1>Please enter username:</h1>
	<input type="text" name="username" />
	<h1>Please enter password:</h1>
	<input type="text" name="password" />
	<h1>First Name: </h1>
	<input type="text" name="firstName"/>
	<h1>Last Name: </h1>
	<input type="text" name="lastName" />
	<h1>Email: </h1>
	<input type="text" name="email"/>
	<input type="submit" value="Submit"/>
	
	</form>
	<form action="home.do" method="GET">
		<input type="submit" value="Home" />
	</form>
	</body>
</html>