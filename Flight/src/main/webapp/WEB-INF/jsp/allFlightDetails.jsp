<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Flight Details</title>
</head>
<body>

<table border="1px">
	<tr>
		<td>Flight Master Id</td>
		<td>Departure Location</td>
		<td>Arrival Location</td>
		<td>Fleet Id</td>
		<td>Fare Id</td>
		<td>Departure Time</td>
		<td>Arrival Time</td>
		<td>Flight Travel Date</td>
		<td>Remaining Economy Seats</td>
		<td>Remaining Premium Seats</td>
		<td>Remaining Business Seats</td>
	</tr>
    <c:forEach var="flight" items="${list}" >
        <tr>
            <td><c:out value="${flight.flightId}"/></td>
            <td><c:out value="${flight.locationMaster1.getLocationMasterId()}"/></td>
            <td><c:out value="${flight.locationMaster2.getLocationMasterId()}"/></td>
            <td><c:out value="${flight.fleetMaster.getFleetMasterId()}"/></td>
            <td><c:out value="${flight.fareMaster.getFareMasterId()}"/></td>
            <td><c:out value="${flight.departureTime}" /></td>
            <td><c:out value="${flight.arrivalTime}" /></td>
            <td><c:out value="${flight.flightTravelDate}" /></td>
            <td><c:out value="${flight.remainingEconomySeats}" /></td>
            <td><c:out value="${flight.remainingPremiumSeats}" /></td>
            <td><c:out value="${flight.remainingBusinessSeats}" /></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>