<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title>Join a Potluck</title>
	
	<link 	type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/style.css">
			
	<link	type="text/css"
			rel="stylesheet"
			href="${pageContext.request.contextPath}/resources/css/add-customer-style.css">


</head>

<body>
	<div id="wrapper">
		<div id="header">
			<h2>Join a potluck!</h2>
		</div>
	</div>
	
	<div id="container"></div>
		<h3>Join a Potluck</h3>
		<form:form action="joinPotluck" modelAttribute="potluck" method="POST">
			<!--  need to associate data with a customer id -->
			<form:hidden path="id"/> 
		
			<table>
				<tbody>
					<tr>
						<td><label>Invite Code:</label></td>
						<td><form:input path="inviteCode"/></td>
					</tr>
					
					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save"/></td>
					</tr>
	
				</tbody>
			</table>			
		</form:form>
		
		<div style="clear; both;"></div>
		
		<p>
			<a href=${pageContext.request.contextPath}/myjoinedpotlucks>Back to List</a>
		</p>
	</div>
	
	
</body>


</html>