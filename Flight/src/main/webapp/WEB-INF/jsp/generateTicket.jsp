<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
			  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
					
			  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css">
			  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
			  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/navbar.css" />
			  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">
function printTicket()
{
window.print();
}
</script>
</head>
<body>
 <jsp:include page="header.jsp"></jsp:include>
<br><br><br><br><br>
<button onclick="printTicket()">Print</button>

<div style="border: 1">
<!-- for the header of the Ticket  -->
<table border="1">
	<tr>
	<td>Booking Id: ${booking.bookingId } </td>
	<td>Booking Number: ${booking.bookingNumber }</td>
	</tr>
	<tr>
	<td>Source: ${booking.flightMaster.locationMaster1.code } ${booking.flightMaster.locationMaster1.airportName }</td>
	<td>Destination: ${booking.flightMaster.locationMaster2.code } ${booking.flightMaster.locationMaster2.airportName } </td>
	</tr>
	<tr>
	<td>Travel Date: ${booking.travelDate } </td>
	<td>Departure Time: ${booking.flightMaster.departureTime }</td>
	<td>Arrival Time: ${booking.flightMaster.arrivalTime } </td>
	</tr>
	<tr>
	<td>Total Cost: ${booking.totalCost } </td>
	<td>Total Seat: ${booking.seatsBooked} </td>
	<td>Class Type: ${booking.seatClass } </td>
	</tr>
</table>
<!-- Ticket header end -->
<table border="1">
	<tr>
	<th>Passenger Name</th>
	<th>Gender</th>
	<th>Age</th>
	<th>Passport Number</th>
	<th>Passenger Type</th>
	</tr>
<c:forEach var="line" items="${total}">
	<tr>
	<td>${line.firstName } ${line.middleName } ${line.lastName } </td>
	<td>${line.gender } </td>
	<td>${line.age } </td>
	<td>${line.passportNumber } </td>
	<td>${line.passengerType } </td>
	</tr>
</c:forEach>
</table>
</div>
 <jsp:include page="footer.jsp"></jsp:include>      
</body>
</html>