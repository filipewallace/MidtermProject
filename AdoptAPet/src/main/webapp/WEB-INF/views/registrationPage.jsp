<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Page</title>
<jsp:include page="../bootstrapAndCSSHeader.jsp" />


</head>
<body>
	<div class="container">
		<%@ include file="../nav.jsp"%><br><br><br><br>
		<!-- 
	<form action="createAccountRedirect.do" method="POST">
		<h1>Please enter username:</h1>
		<input type="text" name="username" required />
		<h1>Please enter password:</h1>
		<input type="password" name="password" required />
		<h1>First Name:</h1>
		<input type="text" name="firstName" required />
		<h1>Last Name:</h1>
		<input type="text" name="lastName" required />
		<h1>Email:</h1>
		<input type="text" name="email" required /> <input type="submit"
			value="Submit" /> -->
		<div class="container">
			<div class="row align-items-start">
				<div class="col"></div>
				<div class="col">
				<div class="form-login">
					<form action="createAccountRedirect.do" method="POST">
						<h4>Username</h4>
						<input type="text" name="username"
							class="form-control input-sm chat-input" placeholder="Username"
							required /><br>
						<h4>Password</h4>
						<input type="password" name="password"
							class="form-control input-sm chat-input" placeholder="Password"
							required /> <br>
						<h4>First Name</h4>
						<input type="text" name="firstName"
							class="form-control input-sm chat-input" placeholder="First Name"
							required /> <br>
						<h4>Last Name</h4>
						<input type="text" name="lastName"
							class="form-control input-sm chat-input" placeholder="Last Name"
							required /> <br>
						<h4>Email</h4>
						<input type="text" name="email"
							class="form-control input-sm chat-input" placeholder="Email"
							required /> <br>
						<div class="wrapper">
							<span class="group-btn"> <a> <input type="submit"
									value="Submit" class="btn btn-primary btn-md"
									class="fa fa-sign-in" />
							</a>
							</span>
						</div>

					</form>
				</div>
				</div>
				<div class="col"></div>


			</div>
			
		</div>

	</div>
</body>
</html>