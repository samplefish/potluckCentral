<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>

<head>
	<title>${potluck.name}</title>
	
	<!-- Reference our style sheet -->
	<link 	type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css"/>
	
</head>

<body>
	<p>
		<a href=${pageContext.request.contextPath}>Home</a>
		|
		<a href=${pageContext.request.contextPath}/mypotlucks>My Potlucks</a>
		|
		
		<a href=${pageContext.request.contextPath}/myjoinedpotlucks>My Joined Potlucks</a>
		
	</p>

	<div id="wrapper">
		<div id="header">
		
			<h2>${potluck.name}</h2> 
			<h3>Host: ${potluck.owner.userName}</h3>

		</div>
		
		<p>
			Date: ${potluck.date}
			<br>
			Time: ${potluck.time}
			<br>
			Location: ${potluck.location}
			<br>
			Description: ${potluck.description}
		
		</p>
		
	</div>
	
	<div id="container">
		<div id="content">
			<h3>Item List:</h3>
			<!-- put new button: Add Customer -->
			<c:url var="newLink" value="/newItem">
						<c:param name="potluckId" value="${potluck.id}"/>
					</c:url>
			<a href="${newLink}">New Item</a>
				
		
			<!-- add out html table here -->
			<table>
				<tr>
					<th>User</th>
					<th>Item</th>
					<th>Quantity</th>
					<th>Action</th>
				</tr>
				
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
					<tr>
						<td>${tempItem.user.userName}</td>
						<td>${tempItem.name}</td>
						<td>${tempItem.quantity}</td>
						<td>
							<a href="${updateLink}">Update Item</a>
							|
							<a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to delete ${tempPotluck.name}?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>			
			</table>
			
			<h3>Participant List:</h3>
			<table>
				<tr>
					<th>User</th>
					<th>Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempUser" items="${participants}">
					
					<!-- construct delete link with customer id -->
					<c:url var="deleteLink" value="/removeParticipant">
						<c:param name="userId" value="${tempUser.id}"/>
						<c:param name="potluckId" value="${potluck.id}"/>
					</c:url>
					<tr>
						<td>${tempUser.userName}</td>
						<td>
							<a href="${deleteLink}"
								onclick="if (!(confirm('Are you sure you want to remove ${tempUser.userName}?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>			
			</table>
		
		</div>
		
		
	
	</div>
	
	
		


</body>

</html>