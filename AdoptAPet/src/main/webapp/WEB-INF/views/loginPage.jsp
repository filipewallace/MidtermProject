<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<form action="home.do" method="GET">
		<input type="submit" value="Home" />
	</form>
	
	<form action="loginAttempt.do" method="POST">
		<h1>Please enter username:</h1>
		<input type="text" name="username" />
		<h1>Please enter password:</h1>
		<input type="text" name="password" /> 
		<input type="submit" value="Login" />
	</form>

</body>