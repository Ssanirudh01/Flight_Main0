<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Location Details</title>
</head>
<body>

<table border="1px">
	<tr>
		<td>Location Master Id</td>
		<td>Name</td>
		<td>Code</td>
		<td>Airport Name</td>
		<td>Country</td>
	</tr>
    <c:forEach var="location" items="${list}" >
        <tr>
            <td><c:out value="${location.locationMasterId}"/></td>
            <td><c:out value="${location.name}" /></td>
            <td><c:out value="${location.code}" /></td>
            <td><c:out value="${location.airportName}" /></td>
            <td><c:out value="${location.country}" /></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>