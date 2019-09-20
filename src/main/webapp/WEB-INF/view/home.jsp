<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>
<head>

	<title>fish Party Home Page</title>
	<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title></title>
		<meta name="keywords" content="" />
		<meta name="description" content="" />
		<link href="http://fonts.googleapis.com/css?family=Didact+Gothic" rel="stylesheet" />
		<link href="resources/home/default.css" rel="stylesheet" type="text/css" media="all" />
		<link href="resources/home/fonts.css" rel="stylesheet" type="text/css" media="all" />
	</head>

<body>
	<div id="header-wrapper">
		<div id="header" class="container">
			<div id="logo">
				<h1><a href=".">Potluck Planner</a></h1>
			</div>
			<div id="menu">
				<ul>
					<li class="active"><a href="." accesskey="1" title="">Home</a></li>
					<li><a href="${pageContext.request.contextPath}/mypotlucks" accesskey="2" title="">Manage my Potlucks</a></li>
					<li><a href="${pageContext.request.contextPath}/myjoinedpotlucks" accesskey="3" title="">View my Joined Potlucks</a></li>
					
				</ul>
			</div>
		</div>
		<div id="banner" class="container">
			<div class="title">
				<h2>Hi, <security:authentication property="principal.username"/>!</h2>
				<span class="byline">Start creating and managing your potlucks!</span>
			</div>
			<ul class="actions">
				<li><a href="${pageContext.request.contextPath}/mypotlucks" class="button">My Potlucks</a></li>
				<form:form action="${pageContext.request.contextPath}/logout" method="POST">
				<li><button class="button" type="submit">
					Logout
				</button></li>
			</form:form>
			</ul>
			
		</div>
		
	</div>
	<div id="wrapper">
	<div id="three-column" class="container">
		<div class="title">
			<h2>Getting together, made simple</h2>
			<span class="byline">Take the hassle out of planning your next potluck. Spend less time worrying, and more time together</span>
		</div>
		<div class="boxA">
			<span class="fa fa-cloud-download"></span>
			<p>Your potlucks are saved to the cloud, meaning your potlucks travel with you wherever you go. Our connectivity keeps you up to date.</p>
			<a href="${pageContext.request.contextPath}/mypotlucks" class="button button-alt">New Potluck</a>
		</div>
		<div class="boxB">
			<span class="fa fa-cogs"></span>
			<p>State of the art security technology keeps your potlucks safe behind the curtains, so you can focus on whats important: your potlucks</p>
			<a href="#" class="button button-alt">More Info</a>
		</div>
		<div class="boxC">
			<span class="fa fa-wrench"></span>
			<p>You have complete control over your potlucks. Update the information, remove a participant, or leave: its all up to you.</p>
			<a href="${pageContext.request.contextPath}/myjoinedpotlucks" class="button button-alt">Join a Potluck</a>
		</div>
	</div>
</div>
	
	<!-- Add a logout button -->
	
	
	
</body>

</html>