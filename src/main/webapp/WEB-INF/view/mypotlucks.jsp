<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>My Potlucks</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	
	<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="resources/table/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/table/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/table/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/table/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/table/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/table/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/table/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/table/css/main.css">
<!--===============================================================================================-->
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
					<li><a href="." accesskey="1" title="">Home</a></li>
					<li class="active"><a href="${pageContext.request.contextPath}/mypotlucks" accesskey="2" title="">Manage my Potlucks</a></li>
					<li><a href="${pageContext.request.contextPath}/myjoinedpotlucks" accesskey="3" title="">View my Joined Potlucks</a></li>
				</ul>
			</div>
		</div>
	<div id="container">
		<div id="content">
			<div class="limiter">
				<div class="container-table100">
					<div class="wrap-table100">
						<span class="best-title p-b-49">My Potlucks</span>
						<div class="container-login100-form-btn">
							<div class="wrap-login100-form-btn">
								<div class="login100-form-bgbtn"></div>
								<button class="login100-form-btn" onclick="window.location.href='newPotluck'; return false;" type="button">
									Create a New Potluck
								</button>
							</div>
						</div>
					<div class="table100 ver2 m-b-110">
						<table data-vertable="ver2">
			
						<thead>
							<tr class="row100 head">
								<th style="text-align:center">Owner</th>
								<th style="text-align:center">Name</th>
								<th style="text-align:center">Invite Code</th>
								<th style="text-align:center">Action</th>
							</tr>
						</thead>
						
						<!-- loop over and print our customers -->
						<tbody>
						<c:forEach var="tempPotluck" items="${potlucks}">
							
							<!-- construct update link with customer id -->
							<c:url var="updateLink" value="/showFormForUpdate">
								<c:param name="potluckId" value="${tempPotluck.id}"/>
							</c:url>
							<c:url var="detailLink" value="/showPotluckDetails">
								<c:param name="potluckId" value="${tempPotluck.id}"/>
							</c:url>
							<!-- construct delete link with customer id -->
							<c:url var="deleteLink" value="/deletePotluck">
								<c:param name="potluckId" value="${tempPotluck.id}"/>
							</c:url>
							<tr class="row100">
								<td class="column100 column1" style="text-align:center">${tempPotluck.owner.userName}</td>
								<td class="column100 column2" style="text-align:center">${tempPotluck.name}</td>
								<td class="column100 column3" style="text-align:center">${tempPotluck.inviteCode}</td>
								<td class="column100 column4" style="text-align:center">
									<a href="${detailLink}">View Details</a>
									|
									<a href="${updateLink}">Update</a>
									|
									<a href="${deleteLink}"
										onclick="if (!(confirm('Are you sure you want to delete ${tempPotluck.name}?'))) return false">Delete</a>
								</td>
							</tr>
						</c:forEach>
						</tbody>			
					</table>
				</div>
			</div>
			<a href="${pageContext.request.contextPath}" class="back-btn">Back to List</a>
		</div>
		</div>
		
		</div>
		
		
	
	</div>
	</div>

	
	
		


</body>

</html>