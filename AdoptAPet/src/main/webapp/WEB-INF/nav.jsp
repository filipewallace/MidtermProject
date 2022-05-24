<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="buttons">

	<div class="action_btn">

		<nav>
			<form action="home.do">
				<input type="submit" value="Home">
			</form>
			<form action="showAllPets.do" method="GET">
				<input type="submit" value="Pet List" />
			</form>

			<c:if test="${empty user }">
				<form action="loginPage.do" method="GET">
					<input type="submit" value="Login" />
				</form>
			</c:if>
			<c:if test="${empty user }">
				<form action="createAccount.do" method="GET">
					<input type="submit" value="Create Account" />
				</form>
			</c:if>

			<c:if test="${not empty user }">
				<form action="userPage.do" method="GET">
					<input type="submit" value="My Profile" /> <input type="text"
						name="id" value="${user.id}" hidden />
				</form>
			</c:if>
			<c:if test="${not empty user }">
				<form action="logout.do" method="GET">
					<input type="submit" value="Log Out" />
				</form>
			</c:if>
			<c:if test="${not empty user }">
				<form action="updateUserInformation.do" method="GET">
					<input type="submit" value="Update Information"> <input
						name="id" value="${user.account.id }" hidden />
				</form>
			</c:if>

		</nav>
	</div>

</div>


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