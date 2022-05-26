<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
<jsp:include page="../bootstrapAndCSSHeader.jsp" />

</head>
<body>
	<div class="container">
		<%@ include file="../nav.jsp"%>
		<h1>This is a user page: BEHOLD!!!</h1>
		<div>



			<h1>Users username: ${user.username }</h1>
			<div class="userpagetext">
				<c:choose>


					<c:when test="${empty user.account.petList }">No Pets Yet
		</c:when>
					<c:otherwise>
						<c:forEach var="pet" items="${user.account.petList}">
							<div class="container">
								<div class="row">
									<div class="col-sm">

										<img class="resize" src="${pet.imageLink }">
									</div>
									<div class="col-sm">
										<ul>
											<li>Name : ${pet.petName }</li>
											<li>Vaccination Status: ${pet.vaccinatedStatus }</li>
											<li>Pet Weight: ${pet.weight }</li>
											<li>Pet's Personality: ${pet.personality }</li>
											<li>Neutered? ${pet.neutered }</li>
											<li>About me: ${pet.aboutMe }</li>
											<li>Sex: ${pet.sexOfPet }</li>
											<li>Pet's Breed: ${pet.breed }<br> Is
												Hypoallergenic: ${pet.breed.isAllergic }<br> Breed's
												Size: ${pet.breed.size.petSize }<br> Type of Animal:
												${pet.breed.category.typeOfPet }<br> Description of
												Breed: ${pet.breed.description }
											</li>
										</ul>
									</div>
									<div class="col-sm">
										<div class="userpagebuttons">
											<form action="deleted.do" method="GET">
												<input type="hidden" name="id" value=${pet.id } /> <input
													type="submit" class="button" value="Delete Pet" />
											</form>
											<form action="updated.do" method="GET">
												<input type="hidden" name="id" value=${pet.id } /> <input
													type="submit" class="button" value="Update Pet" />
											</form>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>

					</c:otherwise>
				</c:choose>
			</div>


		</div>
		<div>

			<c:choose>
				<c:when test="${empty sessionScope.user.account.phoneNumber }">
					<h3>Please Update your information before adding pets!</h3>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>

		</div>

	</div>
</body>
</html>
