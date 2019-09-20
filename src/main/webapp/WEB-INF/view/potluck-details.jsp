<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>${potluck.name}</title>
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
	<link href="resources/home/defaultDetail.css" rel="stylesheet" type="text/css" media="all" />
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
					<li><a href="${pageContext.request.contextPath}/mypotlucks" accesskey="2" title="">Manage my Potlucks</a></li>
					<li><a href="${pageContext.request.contextPath}/myjoinedpotlucks" accesskey="3" title="">View my Joined Potlucks</a></li>
				</ul>
			</div>
		</div>
	
		
		
		<div id="container">
			<div id="content">
				<div class="limiter">
					<div class="container-table100">
						<div class="wrap-table100">
							<span class="best-title p-b-49">${potluck.name}</span>
	
		<div id="wrapper">
			
			
				<h3>Host: ${potluck.owner.userName}</h3>
				<br>
				Date: ${potluck.date}
				<br>
				Time: ${potluck.time}
				<br>
				Location: ${potluck.location}
				<br>
				Description: ${potluck.description}
			
			
			
		</div>
	
	<div id="container">
		<div id="content">
			<h3>Item List:</h3>
			<!-- put new button: Add Customer -->
			<c:url var="newLink" value="/newItem">
				<c:param name="potluckId" value="${potluck.id}"/>
			</c:url>
			<div class="container-login100-form-btn">
				<div class="wrap-login100-form-btn">
					<div class="login100-form-bgbtn"></div>
					<button class="login100-form-btn" onclick="window.location.href='${newLink}'; return false;" type="button">
						Add an Item
					</button>
				</div>
			</div>
			<div class="table100 ver2 m-b-110">
				<table data-vertable="ver2">
					<thead>
						<tr class="row100 head">
							<th style="text-align:center">User</th>
							<th style="text-align:center">Item</th>
							<th style="text-align:center">Quantity</th>
							<th style="text-align:center">Action</th>
						</tr>
					</thead>
				<tbody>
					<!-- loop over and print our customers -->
					<c:forEach var="tempItem" items="${items}">
						
						<!-- construct update link with customer id -->
						<c:url var="updateLink" value="/updateItem">
							<c:param name="itemId" value="${tempItem.id}"/>
						</c:url>
						<!-- construct delete link with customer id -->
						<c:url var="deleteLink" value="/deleteItem">
							<c:param name="itemId" value="${tempItem.id}"/>
						</c:url>
						<tr class="row100">
							<td class="column100 column1" style="text-align:center">${tempItem.user.userName}</td>
							<td class="column100 column2" style="text-align:center">${tempItem.name}</td>
							<td class="column100 column3" style="text-align:center">${tempItem.quantity}</td>
							<td class="column100 column4" style="text-align:center">
								<a href="${updateLink}">Update Item</a>
								|
								<a href="${deleteLink}"
									onclick="if (!(confirm('Are you sure you want to delete ${tempItem.name}?'))) return false">Delete</a>
							</td>
						</tr>
					</c:forEach>			
				</tbody>
				
			</table>
			
			<h3>Participant List:</h3>
			<table data-vertable="ver2">
				<thead>
					<tr class="row100 head">
						<th style="text-align:center">User</th>
						<th style="text-align:center">Action</th>
					</tr>
				</thead>
				<tbody>
				<!-- loop over and print our customers -->
				<c:forEach var="tempUser" items="${participants}">
					
					<!-- construct delete link with customer id -->
					<c:url var="deleteLink" value="/removeParticipant">
						<c:param name="userId" value="${tempUser.id}"/>
						<c:param name="potluckId" value="${potluck.id}"/>
					</c:url>
					<tr class="row100">
						<td class="column100 column1" style="text-align:center">${tempUser.userName}</td>
						<td class="column100 column2" style="text-align:center">
							<a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to remove ${tempUser.userName}?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>			
			</table>
		
		</div>
		
		
	</div>
	</div>
	</div>
	</div>
	</div>	
</div>
</div>
</body>

</html>