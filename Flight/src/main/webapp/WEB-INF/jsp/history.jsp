<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booking History</title>
</head>
<body>

<table border="1px">
	<tr>
		<td>Booking Id</td>
		<td>Booking Number</td>
		<td>Booking Date</td>
		<td>Travel Date</td>
		<td>Seats Booked</td>
		<td>Seat Class</td>
		<td>Total Cost</td>
	</tr>
    <c:forEach var="booking" items="${history}" >
        <tr>
            <td><c:out value="${booking.bookingId}"/></td>
            <td><c:out value="${booking.bookingNumber}" /></td>
            <td><c:out value="${booking.bookingDate}" /></td>
            <td><c:out value="${booking.travelDate}" /></td>
            <td><c:out value="${booking.seatsBooked}" /></td>
            <td><c:out value="${booking.seatClass}" /></td>
            <td><c:out value="${booking.totalCost}" /></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>