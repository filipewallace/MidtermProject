<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<jsp:include page="../bootstrapAndCSSHeader.jsp" />
</head>
<body>
	<div class="container">
		<%@ include file="../nav.jsp"%>
	</div>
	<div class="container">
		<div class="row align-items-start">
			<div class="col"><br><br><br><br><br><br><br><br><br></div>
			<div class="col"></div>
		</div>
		<div class="row align-items-start">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
		</div>
		<div class="row align-items-start">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
		</div>
		<div class="row align-items-start">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
		</div>
		<div class="row align-items-center">
			<div class="col"></div>
			<div class="col">
			<div class="form-login">
				<h4>Welcome back</h4>
				<form action="loginAttempt.do" method="POST">
					<input type="text" name="username"
						class="form-control input-sm chat-input" placeholder="username" />
					<br> <input type="text" name="password"
						class="form-control input-sm chat-input" placeholder="password" />
					<br>
					<div class="wrapper">
						<span class="group-btn"> <a> <input type="submit"
								value="Login" class="btn btn-primary btn-md"
								class="fa fa-sign-in" />
						</a>
						</span>
					</div>
				</form>
			</div>
			</div>
			<div class="col"></div>
		</div>
		<div class="row align-items-end">
			<div class="col"></div>
			<div class="col"></div>
			<div class="col"></div>
		</div>
	</div>

</body>
