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

	<!-- 			 	<h1>Please enter username:</h1>
			<input type="text" name="username" />
			<h1>Please enter password:</h1>
			<input type="text" name="password" /> 
 -->
	<div class="container">
		<div class="login-box">
			<div class="row.row-4">
				
					<div class="col.col-4 ">
						<div class="form-login">
							<h4>Welcome back.</h4>
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
			</div>
		</div>

	</div>

</body>