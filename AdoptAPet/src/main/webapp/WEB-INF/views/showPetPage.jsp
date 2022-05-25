<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I am Me</title>
<jsp:include page="../bootstrapAndCSSHeader.jsp"/>
<style>
.resize {
	width: 10%;
	height: auto;
}
</style>
</head>
<body>
<div class="container">
	<%@ include file="../nav.jsp"%>
	
	         <c:if test="${not empty user  }">
        <%--  <c:when test="${empty pet }">Invalid Pet</c:when> --%>
    
         <ul>
        <li> <img class="resize" src= "${pet.imageLink }" > <br>
        <li>Name : ${pet.petName }</li>
        <li>Vaccination Status: ${pet.vaccinatedStatus }</li>
         <li>Pet Weight: ${pet.weight }</li>
        <li>Pet's Personality: ${pet.personality }</li>
        <li>Neutered? ${pet.neutered }</li>
        <li>About me: ${pet.aboutMe }</li>
        <li>Sex: ${pet.sexOfPet }</li>
        
         <li>Pet's Breed: ${pet.breed }<br> 
            Is Hypoallergenic: ${pet.breed.isAllergic }<br> 
            Breed's Size: ${pet.breed.size.petSize }<br>
            Type of Animal: ${pet.breed.category.typeOfPet }<br> 
            Description of Breed: ${pet.breed.description }</li> 
            
        </ul>
        
        <p>Please contact my owner at: ${pet.account.phoneNumber } if you want to adopt me!</p>
        
        <c:if test="${allowUpdate }">
            <form action="updated.do" method="GET">
                <input type="hidden" name="id" value=${pet.id } /> <input
                    type="submit" class="button" value="Update Pet" />
            </form> 
        </c:if>
        	<c:if test="${user.role.id == 1}">
							<form action="deleted.do" method="GET">
								<input type="hidden" name="id" value=${pet.id } /> <input
									type="submit" class="button" value="Delete Pet" />
							</form>

							<form action="updated.do" method="GET">
								<input type="hidden" name="id" value=${pet.id } /> <input
									type="submit" class="button" value="Update Pet" />
							</form>
						</c:if>
 
        </c:if>
         <c:if test="${ empty user  }">Create an account to see full pet listing </c:if>


</div>
</body>
</html>

					