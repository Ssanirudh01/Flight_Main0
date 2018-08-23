<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
	<title>Search Flights</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css">
		<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
			<!-- <!-- <script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script src="assets/angular/angular.min.js"></script>
			<script src="assets/js/calendar.js"></script>
			 --> -->
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/navbar.css" />
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css">
			
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br>
<a href="flightResult" style="margin-left: 10px;font-size: 22px">Change the Search Flight</a>
<br><br>
<h1 style="margin-left: 10px">Searched Flights</h1>
<table style="margin-left: 10px;margin-right: 10px">
<!-- this shows search results -->
	<tr style="background-color: grey;color: white;font-style: oblique;">
		<td>Source</td>
		<td>Destination</td>
		<td>Departure</td>
		<td>Arrival</td>
		<td>Cost</td>
		<td></td>
	</tr>
	 <c:forEach var="flight" items="${lists}">
		<tr>
		<td>${flight.locationMaster1.code }</td>
        <td>${flight.locationMaster2.code }</td>
        <td>${flight.departureTime }</td>
        <td>${flight.arrivalTime }</td>
        <td>${flight.fareMaster.economyClass }</td>
        <td><a href="bookflight?flightId=${flight.flightId }">Book Now</a></td>
        </tr>
    </c:forEach>
</table>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>