<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fare Details</title>
</head>
<body>

<table border="1px">
	<tr>
		<td>Fare Master Id</td>
		<td>Economy Class</td>
		<td>Economy Class</td>
		<td>Economy Class</td>
	</tr>
    <c:forEach var="fare" items="${list}" >
        <tr>
            <td><c:out value="${fare.fareMasterId}"/></td>
            <td><c:out value="${fare.economyClass}" /></td>
            <td><c:out value="${fare.premiumClass}" /></td>
            <td><c:out value="${fare.businessClass}" /></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>