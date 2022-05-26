<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="bootstrapAndCSSHeader.jsp"%>

<nav class="navbar navbar-light" style="background-color: #6dfc87;"> 

<!-- <nav class="navbar navbar-dark bg-primary"> -->
	<!-- Navbar content -->

	<!-- <div class="buttons"> -->

		<div class="action_btn">


			<div class="container">
			<div class="userpagebutton">
				<nav>
					<div class="row">
					
						<div class="col">
							<form action="home.do">
								<input type="submit" class="button" value="Home">
							</form>
						</div>
						<div class="col">
							<form action="showAllPets.do" method="GET">
								<input type="submit" class="button"value="Pet List" />
							</form>
						</div>

						<c:if test="${empty user }">
							<div class="col">
								<form action="loginPage.do" method="GET">
									<input type="submit" class="button"value="Login" />
								</form>
							</div>
						</c:if>

						<c:if test="${empty user }">
							<div class="col">
								<form action="createAccount.do" method="GET">
									<input type="submit"class="button" value="Create Account" />
								</form>
							</div>
						</c:if>

						<c:if test="${not empty user }">
							<div class="col">
								<form action="userPage.do" method="GET">
									<input type="submit"class="button" value="My Profile" /> <input type="text"
										name="id" value="${user.id}" hidden />
								</form>
							</div>
						</c:if>


						<c:if test="${not empty user }">
							<div class="col">
								<form action="logout.do" method="GET">
									<input type="submit"class="button" value="Log Out" />
								</form>
							</div>
						</c:if>

						<c:if test="${not empty user }">
							<div class="col">
								<form action="updateUserInformation.do" method="GET">
									<input type="submit" class="button" value="Update Information"> <input
										name="id" value="${user.account.id }" hidden />
								</form>
							</div>
						</c:if>
						<c:if test="${not empty user.account.phoneNumber }">
							<div class="col">
								<form action="createPet.do" method="GET">
									<input type="submit"class="button" value="Create Pet Listing"><input
										name="id" value="${user.account.id }" hidden />
								</form>
							</div>
						</c:if>

					</div>
				</nav>
			</div>
		</div>
</div>
</nav>
<%-- <nav>
	<a href="index.do">Home</a>
	<c:choose>
	  <c:when test="${not empty sessionScope.loggedInUser }">
	    <a href="account.do" class="btn btn-success">Account</a>
	    <a href="logout.do" class="btn btn-primary">Log Out</a>
	  </c:when>
	  <c:otherwise>
	    <a href="login.do" class="btn btn-primary">Log In</a>
	  </c:otherwise>
	</c:choose>
</nav> --%>