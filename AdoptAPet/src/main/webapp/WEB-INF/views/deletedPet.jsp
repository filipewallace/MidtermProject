<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Deleted Pet</title>
</head>
<body>
	<%@ include file="../nav.jsp"%>
	<p>
	Pet has successfully been deleted!</p>
	
  
	<form action="userPageRedirect.do" method="GET">
		<input type="submit" value="Go Back"/>
	</form>
		
</body>
</html>