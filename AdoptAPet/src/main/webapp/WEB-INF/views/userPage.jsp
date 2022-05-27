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
		<div class="body">
			<h1>${user.account.firstName }'s Profile Page</h1>
			<footer class="footer">
				<div class="container">
					<span class="text-muted"></span>
				</div>
			</footer>
			</div>
		<div>
			<div class="userpagetext">
				<c:choose>


					<c:when test="${empty user.account.petList }"><h1>No Pets Yet</h1>
		</c:when>
					<c:otherwise>
						<c:forEach var="pet" items="${user.account.petList}">
							<div class="container">
								<div class="row">
									<div class="col-sm">

										<img class="img-fluid" src="${pet.imageLink }">
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
										<br><br><br><br><br>
											<form action="deleted.do" method="GET">
												<input type="hidden" name="id" value=${pet.id } /> <input
													type="submit" class="button" value="Delete Pet" />
											</form>
											<form action="updated.do" method="GET">
												<input type="hidden" name="id" value=${pet.id } /> <input
													type="submit" class="button" value="Update Pet" />
											</form>
											<br><br><br>
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
					<h1>Please Update your information before adding pets!</h1>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>

		</div>

	</div>
</body>
</html>
