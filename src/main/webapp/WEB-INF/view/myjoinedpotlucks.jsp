<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>Joined Potlucks</title>
	
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
			
					
			<!-- put new button: Join Potluck -->
			<input 	type="button" value="Join a Potluck"
					onclick="window.location.href='joinPotluckForm'; return false;"
					class="add-button"
					/>
		
		
			<!-- add out html table here -->
			<table>
				<tr>
					<th>Owner</th>
					<th>Name</th>
					<th>Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempPotluck" items="${potlucks}">
					
					<!-- construct update link with customer id -->
					<c:url var="detailLink" value="/showPotluckDetails">
						<c:param name="potluckId" value="${tempPotluck.id}"/>
					</c:url>
					<!-- construct delete link with customer id -->
					<c:url var="leaveLink" value="/leavePotluck">
						<c:param name="potluckId" value="${tempPotluck.id}"/>
					</c:url>
					<tr>
						<td>${tempPotluck.owner.userName}</td>
						<td>${tempPotluck.name}</td>
						<td>
							<a href="${detailLink}">View Details</a>
							|
							<a href="${leaveLink}"
								onclick="if (!(confirm('Are you sure you want to leave ${tempPotluck.name}?'))) return false">Leave</a>
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