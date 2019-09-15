<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<html>
<head>

	<title>fish Party Home Page</title>

</head>

<body>
	<h2>fish Party Home Page</h2>
	<hr>
	
	<p>
	Welcome to the party, matey!
	</p>
	
	<hr>
	
	<!-- display username and role -->
	
	<p>
		User: <security:authentication property="principal.username"/>
		<br><br>
		Role(s): <security:authentication property="principal.authorities"/>
	</p>
	
	<hr>
	
	<security:authorize access="hasRole('USER')">
		<p>
			<a href="${pageContext.request.contextPath}/mypotlucks">Manage My Potlucks</a>
		</p>
	</security:authorize>

	<security:authorize access="hasRole('USER')">
		<p>
			<a href="${pageContext.request.contextPath}/myjoinedpotlucks">View My Attending Potlucks</a>
		</p>
	</security:authorize>
	
	<!-- Add a link to point to /leaders ... for leaders -->
	<security:authorize access="hasRole('USER')">
		<p>
			<a href="${pageContext.request.contextPath}/users">User Manual</a>
		</p>
	</security:authorize>
	
	
	
	<!-- Add a link to point to /carries ... for carries -->
	<security:authorize access="hasRole('ADMIN')">
		<p>
			<a href="${pageContext.request.contextPath}/admin">Control Board</a>
			(Only for Carries)
		</p>
	</security:authorize>
		
	<hr>
	
	<!-- Add a logout button -->
	<form:form action="${pageContext.request.contextPath}/logout" method="POST">
		<input type="submit" value="Logout"/>
	</form:form>
</body>

</html>