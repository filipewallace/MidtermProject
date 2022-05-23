<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I am Me</title>
</head>
<body>
<c:choose>
<c:when test="${empty pet }">Invalid Pet</c:when>
<c:otherwise>
Name: ${pet.petName }
Breed: ${pet.breed.breedName }
</c:otherwise>
</c:choose>
</body>
</html>