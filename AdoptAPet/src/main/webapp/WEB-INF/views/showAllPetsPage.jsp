<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<jsp:include page="../bootstrapAndCSSHeader.jsp" />
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
		<c:forEach var="pet" items="${petList }">



			<div class="container">

				<div class="row">

					<div class="col-sm border border-success text-center align-items-center">
						<h2>${pet.petName }</h2>
					</div>


					<div class="col-sm border border-success text-center">
						<img class="img-fluid" src="${pet.imageLink }">
					</div>



					<div class="col-sm border border-success text-center align-items-center">
						<div class="userpagebutton">
							<form action="showPetPage.do" method="GET">
								<input type="hidden" name="id" value=${pet.id } /> <input
									type="submit" class="button" value="Show Me" />
							</form>

						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>
</body>
</html>