<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>My Potlucks</title>
	
	<!-- Reference our style sheet -->
	<link 	type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css"/>
	
</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>My Potlucks</h2>
		</div>
	</div>
	
	<div id="container">
		<div id="content">
			<!-- put new button: Add Customer -->
			<input 	type="button" value="Create a New Potluck"
					onclick="window.location.href='newPotluck'; return false;"
					class="add-button"
					/>
		
		
			<!-- add out html table here -->
			<table>
				<tr>
					<th>Owner</th>
					<th>Name</th>
					<th>Invite Code</th>
					<th>Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempPotluck" items="${potlucks}">
					
					<!-- construct update link with customer id -->
					<c:url var="updateLink" value="/showFormForUpdate">
						<c:param name="potluckId" value="${tempPotluck.id}"/>
					</c:url>
					<!-- construct delete link with customer id -->
					<c:url var="deleteLink" value="/deletePotluck">
						<c:param name="potluckId" value="${tempPotluck.id}"/>
					</c:url>
					
					<!-- construct detail link with customer id -->
					<c:url var="detailLink" value="/showPotluckDetails">
						<c:param name="potluckId" value="${tempPotluck.id}"/>
					</c:url>
					
					<tr>
						<td><security:authentication property="principal.username"/></td>
						<td>${tempPotluck.name}</td>
						<td>${tempPotluck.inviteCode}</td>
						<td>
							<a href="${detailLink}">View Details</a>
							|
							<a href="${updateLink}">Update</a>
							|
							<a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete ${tempPotluck.name}?'))) return false">Delete</a>
							
						</td>
					</tr>
				</c:forEach>			
			</table>
		
		</div>
		
		<p>
			<a href=${pageContext.request.contextPath}>Back to List</a>
		</p>
	
	</div>
	
	
		


</body>

</html>