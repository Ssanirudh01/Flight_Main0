<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fleet Details</title>
</head>
<body>

<table border="1px">
	<tr>
		<td>Fleet Master Id</td>
		<td>Code</td>
		<td>Model</td>
		<td>Total Economy Seats</td>
		<td>Total Premium Seats</td>
		<td>Total Business Seats</td>
	</tr>
    <c:forEach var="fleet" items="${list}" >
        <tr>
            <td><c:out value="${fleet.fleetMasterId}"/></td>
            <td><c:out value="${fleet.code}" /></td>
            <td><c:out value="${fleet.model}" /></td>
            <td><c:out value="${fleet.totalEconomySeats}" /></td>
             <td><c:out value="${fleet.totalPremiumSeats}" /></td>
              <td><c:out value="${fleet.totalBusinessSeats}" /></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>