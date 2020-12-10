<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
	
	<title>Login Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- href="${pageContext.request.contextPath}/resources/login/css/style.css" -->
	
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../resources/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resources/login/css/main.css">
<!--===============================================================================================-->

<!--===============================================================================================-->
	<script src="../resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="../resources/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="../resources/login/js/main.js"></script>

</head>

<body>

	<div>
		
		<div id="loginbox" style="background-image: url('../resources/login/images/potluck.jpg');" class="container-login100">
			
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">

				<span class="login100-form-title p-b-20">
						Register
						</span>

				<div style="padding-top: 30px" class="panel-body">

					<!-- Registration Form -->
					<form:form action="${pageContext.request.contextPath}/register/processRegistrationForm" 
						  	   modelAttribute="crmUser"
						  	   class="login100-form validate-form">

					    <!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>
								
									<!-- Check for registration error -->
									<c:if test="${registrationError != null}">
								
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
											${registrationError}
										</div>
		
									</c:if>
																			
					            </div>
					        </div>
					    </div>

						<!-- User name -->
						<div class="wrap-input100 validate-input m-b-10">
							<span class="label-input100">Username</span>
							<form:errors path="userName" cssClass="error" />
							<form:input path="userName" placeholder="username (*)" class="input100" />
							<span class="focus-input100" data-symbol="&#xf206;"></span>
						</div>

						<!-- Password -->
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Password</span>
							<form:errors path="password" cssClass="error" />
							<form:password path="password" placeholder="password (*)" class="input100" />
							<span class="focus-input100" data-symbol="&#xf190;"></span>
						</div>
						
						<!-- Confirm Password -->
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Confirm Password</span>
							<form:errors path="matchingPassword" cssClass="error" />
							<form:password path="matchingPassword" placeholder="confirm password (*)" class="input100" />
							<span class="focus-input100" data-symbol="&#xf190;"></span>
						</div>
					
						
						<!-- First name -->
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">First Name</span>
							<form:errors path="firstName" cssClass="error" />
							<form:input path="firstName" placeholder="first name (*)" class="input100" />
							<span class="focus-input100" data-symbol="&#xf203;"></span>
						</div>
						
						<!-- Last name -->
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Last Name</span>
							<form:errors path="lastName" cssClass="error" />
							<form:input path="lastName" placeholder="last name (*)" class="input100" />
							<span class="focus-input100" data-symbol="&#xf203;"></span>
						</div>
						
						<!-- Email -->
						<div class="wrap-input100 validate-input m-b-60">
							<span class="label-input100">Email</span>
							<form:errors path="email" cssClass="error" />
							<form:input path="email" placeholder="email (*)" class="input100" />
							<span class="focus-input100" data-symbol="&#xf15a;"></span>
						</div>
						
						

						<!-- Register Button -->
						<div class="container-login100-form-btn">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button class="login100-form-btn" type="submit">
									Register
								</button>
							</div>
						</div>
						
						<div class="flex-col-c p-t-25">
							<a href="${pageContext.request.contextPath}/login" class="txt2">
								Back to Login
							</a>
						</div>
						
					</form:form>

				</div>

			</div>

		</div>

	</div>

</body>
</html>