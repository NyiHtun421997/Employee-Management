<%@taglib prefix="form" uri = "http://www.springframework.org/tags/form"%>
<html>
	<head>
	<title>Yahoo!!</title>
	<style>
		.error {
			color: #ff0000;
		}
	</style>
	</head>
	<body>
    	<form:form method="POST" action="/in28Minutes-first-webapp/spring-mvc/login" modelAttribute="user">   	
    		<table>
    			<tr>
    				<td><form:label path="name">Name</form:label></td>
    				<td><form:input path="name" /></td>
    				<td><form:errors path="name" cssClass="error" /></td>
    			</tr>  			
    			<tr>
    				<td><form:label path="kanaName">Furigana</form:label></td>
    				<td><form:input path="kanaName" /></td>
    				<td><form:errors path="kanaName" cssClass="error" /></td>
    			</tr>			  						
    			<tr>
    				<td><form:label path="age">Age</form:label></td>
    				<td><form:input path="age" type="number" /></td>
    				<td><form:errors path="age" cssClass="error" /></td>
    			</tr>
    			<tr>
    				<td><form:label path="password">Password</form:label></td>
    				<td><form:input path="password" type="password" /></td>
    				<td><form:errors path="password" cssClass="error" /></td>
    			</tr>
    			<tr>
    				<td><form:label path="email">Email</form:label></td>
    				<td><form:input path="email" /></td>
    				<td><form:errors path="email" cssClass="error" /></td>
    			</tr> 
    			<tr>
    				<td><form:label path="phone">Phone Number</form:label></td>
    				<td><form:input path="phone" type="tel" /></td>
    				<td><form:errors path="phone" cssClass="error" /></td>
    			</tr>  
    			<tr>
    				<td><input type="submit" value="Submit" /></td>
    			</tr>
    		</table>
    	</form:form>
	</body>
</html>