<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Your information</title>
<jsp:include page="../bootstrapAndCSSHeader.jsp"/>
</head>
<body>
<div class="container">
	<%@ include file="../nav.jsp"%>
	<div>
		<form action="updateMyInformation.do" method="POST">
			<label for="firstName"> First name: </label><input type="text"
				name="firstName" value="${account.firstName }" required><br>
				
			<label for="lastName"> Last name: </label><input type="text"
				name="lastName" value="${account.lastName }" required><br>
				
			<label for="email"> Email: </label><input type="text" name="email"
				value="${account.email }" required><br> 
				<label for="phoneNumber"> Phone Number: </label><input type="tel"
				name="phoneNumber" value="${account.phoneNumber }" required><br>
				
			<label for="dob"> Date of Birth: </label><input type="date"
				name="dateToBeChanged" value="${account.dob }" required><br>
				
			<%-- 	<label for="address"> Address: </label><input type="text" name="address.primaryStreet" value = "${account.address.primaryStreet }" required><br> 
 --%>

			<label for="aboutMe"> Bio: </label><input type="text" name="aboutMe"
				value="${account.aboutMe }" required><br> <input
				type="text" name="id" value="${account.id}" hidden> <input
				type="submit" name="account" value="Submit" />
		</form>
	</div>
	
	<c:if test="${not empty user.account.phoneNumber }">
	<div>
		<!-- insert rest of address here -->
		<form action="updateMyAddress.do" method="POST">
			<label for="primaryStreet">Street Address:</label><input type="text"
				name="primaryStreet" value="${account.address.primaryStreet}" required><br>
				
			<label for="secondaryStret">Apt or Unit#:</label><input type="text"
				name="secondaryStreet" value="${account.address.secondaryStreet}" ><br>
				
		
				
			<label for="city">City:</label><input type="text" name="city"
				value="${account.address.city}" required><br> 
				<label for="stateAbbreviation">State:</label><input type="text"
				name="stateAbbreviation" value="${account.address.stateAbbreviation}"
				size="2" required><br> 
				<label for="zipcode">Zip Code:</label><input type="text" name="zipcode" value="${account.address.zipcode}"
				required><br>
				
				<input type="text" name="id" value="${account.address.id}" hidden >
				<input type="submit" name="address" value="Update Address">

		</form>
	</div>
	</c:if>
</div>
</body>