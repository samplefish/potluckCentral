<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title>Update an Item</title>
	
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
		<h3>Update an Item</h3>
		<form:form action="updateItemRequest" modelAttribute="item" method="POST">
			<!--  need to associate data with a customer id -->
			<form:hidden path="id"/>
			<input type="hidden" name="itemId" value="${param.itemId}" />
			<table>
				<tbody>
					<tr>
						<td><label>Item Name: </label></td>
						<td><form:input path="name"/></td>
					</tr>
					
					<tr>
						<td><label>Quantity: </label></td>
						<td><form:input path="quantity"/></td>
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
			<a href=${pageContext.request.contextPath}/>Back to List</a>
		</p>
	</div>
	
	
</body>


</html>