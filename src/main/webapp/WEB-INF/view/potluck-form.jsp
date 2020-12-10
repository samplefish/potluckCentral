<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">

<head>
	
	<title>Create a Potluck</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- href="${pageContext.request.contextPath}/resources/login/css/style.css" -->
	
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../resources/login/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/login/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/login/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/login/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./resources/login/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/login/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/login/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="./resources/login/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="./resources/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="./resources/login/css/main.css">
<!--===============================================================================================-->

<!--===============================================================================================-->
	<script src="./resources/login/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/login/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/login/vendor/bootstrap/js/popper.js"></script>
	<script src="./resources/login/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/login/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="./resources/login/vendor/daterangepicker/moment.min.js"></script>
	<script src="./resources/login/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="./resources/login/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="./resources/login/js/main.js"></script>

</head>

<body>

	<div>
		
		<div id="loginbox"
			class="container-login100" style="background-image: url('./resources/login/images/bright.jpg'); opacity: .70;">
			
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">

					<!-- Login Form -->
					<form:form action="savePotluck" method="POST" class="login100-form validate-form" modelAttribute="potluck">
						<form:hidden path="id"/> 

						<span class="login100-form-title p-b-49">
						Create a Potluck
						</span>
						
					    <!-- Place for messages: error, alert etc ... -->
					    <div class="form-group">
					        <div class="col-xs-15">
					            <div>
					            	<!-- Check for login error -->
									<c:if test="${param.error != null }">
										<div class="alert alert-danger col-xs-offset-1 col-xs-10">
													Required.
										</div>
									</c:if>
					            </div>
					        </div>
					    </div>
					    <!-- new username -->
					    <div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Potluck Name</span>
							<form:input path="name" class="input100" type="text" placeholder="Name"/>
							<span class="focus-input100" data-symbol="&#xf1b2;"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Date</span>
							<form:input path="date" class="input100" type="text" placeholder="Date"/>
							<span class="focus-input100" data-symbol="&#xf32e;"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Time</span>
							<form:input path="time" class="input100" type="text" placeholder="Time"/>
							<span class="focus-input100" data-symbol="&#xf337;"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Location</span>
							<form:input path="location" class="input100" type="text" placeholder="Location"/>
							<span class="focus-input100" data-symbol="&#xf1ab;"></span>
						</div>
						
						<div class="wrap-input100 validate-input m-b-23">
							<span class="label-input100">Description</span>
							<form:input path="description" class="input100" type="text" placeholder="Description"/>
							<span class="focus-input100" data-symbol="&#xf222;"></span>
						</div>
						
						
						<div class="text-right p-t-8 p-b-31">
							
						</div>
						
						<div class="container-login100-form-btn">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button class="login100-form-btn" type="submit" value="Save">
									Create!
								</button>
							</div>
						</div>
						
						</form:form>
						<div class="flex-col-c p-t-30">

						<a href=${pageContext.request.contextPath}/mypotlucks class="txt2">
							Cancel
						</a>
					</div>
						

						
					

				</div>

			</div>
			
			

		</div>

	

</body>
</html>