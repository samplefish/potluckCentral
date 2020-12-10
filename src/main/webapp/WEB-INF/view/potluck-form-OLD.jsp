<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title>Create New Potluck</title>
	
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
			<h2>Potluck!</h2>
		</div>
	</div>
	
	<div id="container"></div>
		<h3>Create New Potluck</h3>
		<form:form action="savePotluck" modelAttribute="potluck" method="POST">
			<!--  need to associate data with a customer id -->
			<form:hidden path="id"/> 
		
			<table>
				<tbody>
					<tr>
						<td><label>Potluck Name:</label></td>
						<td><form:input path="name"/></td>
					</tr>
					
					<tr>
						<td><label>Date: </label></td>
						<td><form:input path="date"/></td>
					</tr>
					
					<tr>
						<td><label>Time:</label></td>
						<td><form:input path="time"/></td>
					</tr>
					
					<tr>
						<td><label>Location:</label></td>
						<td><form:input path="location"/></td>
					</tr>
					
					<tr>
						<td><label>Description:</label></td>
						<td><form:input path="description"/></td>
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
			<a href=${pageContext.request.contextPath}/mypotlucks>Back to List</a>
		</p>
	</div>
	
	
</body>


</html>