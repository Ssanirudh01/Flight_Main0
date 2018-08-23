<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
var i=0;
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ticket Form</title>

			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
					
		<!-- Scripts -->
		
			
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

<br><br><br>
<p><a href="flightResult" style="margin-left: 10px;font-size: 22px;float: left">Change the Search Flight</a></p>
<h2 style="margin-left: 50px;">Fill Passenger Detail</h2>
<div class="container">          
  <table class="table table-striped">
    <thead >
      <tr>
        <th>Source</b></th>
        <th> Destination</size></th>
        <th>Class</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${flight.locationMaster1.code}</td>
        <td>${flight.locationMaster2.code}</td>
        <td>ECO</td>
      </tr>
       </tbody>
       <thead>
      <tr>
        <th>Departure Time</th>
        <th>Arrival Time</th>
        <th>Date</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>${flight.departureTime}</td>
        <td>${flight.arrivalTime}</td>
        <td>${flight.flightTravelDate }</td>
      </tr>
       </tbody>
  </table>
</div>
	<div class="container">
	<button onclick="add()" id="old_button1">Add</button> 
	<form action="bookTicket" method="post">
	<input type="number" id="seat" name="seat" value="1" readonly="readonly" style="margin-top: 10px;margin-bottom: 10px;width: 50px"><br>
	<input type="hidden" name="flightId" value="${flight.flightId }">
	<input type="hidden" name="classType" value="economy" >
	<div class="col-sm-2">
	First Name:<input type="text" name="username0"  pattern="[A-Za-z]{1,45}" required title="Enter only Characters" placeholder="First Name" minlength="3" maxlength="45">
	</div>
	<div class="col-sm-2">
	Middle Name:<input type="text" name="middlename0" placeholder="Middle Name" >
	</div>
	<div class="col-sm-2">
	Last Name:<input type="text" name="lastname0" placeholder="Last Name" pattern="[A-Za-z]{1,45}" required title="Enter only Characters" placeholder="Last Name" minlength="3" maxlength="45">
	</div>
	<div class="col-sm-1">
	Age:<input type="number" name="age0" min="1" max="120" maxlength="3" class="form-control" placeholder="Age" required>
	</div>
	<div class="col-sm-2">
	Passport:<input type="text" name="passport0" pattern="[A-Z]{4}[0-9]{4}" required title="Please enter 4 characters and 4 numbers" placeholder="Enter passport" required>
	</div>
	<div class="col-sm-1">
	Gender:<select name="gender0" required>
		<option value="M">Male</option>
		<option value="F">Female</option>
	</select>
	</div>
	<div class="col-sm-1" required>
	P Type:<select name="passengerType0">
		<option value="adult">Adult</option>
		<option value="child">Child</option>
	</select>
	</div>
	<div class="col-sm-1">
	Meal:<select name="meal0" required>
		<option value="veg">VEG</option>
		<option value="nvg">NON-VEG</option>
	</select>
	</div>
	<br>
	
	<div id="formMore">		
	</div>
	<script type="text/javascript">
		function add()
			{
				var d=document.getElementById('seat').value;
				document.getElementById('seat').value=parseInt(d)+1;
				i=i+1;
				document.getElementById('formMore').style.visibility='visible';
				document.getElementById('formMore').innerHTML+='<div class="col-sm-2">First Name:<input type="text" name="username0" pattern="[A-Za-z]{1,45}" required title="Enter only Characters" placeholder="First Name" minlength="3" maxlength="45"></div><div class="col-sm-2">Middle Name:<input type="text" name="middlename0" placeholder="Middle Name"></div><div class="col-sm-2">Last Name:<input type="text" name="lastname0" pattern="[A-Za-z]{1,45}" required title="Enter only Characters" placeholder="First Name" minlength="3" maxlength="45"></div><div class="col-sm-1">Age:<input type="number" class="form-control" name="age0" min="1" max="120" maxlength="3" class="form-control" placeholder="Age" required></div><div class="col-sm-2">Passport:<input type="text" name="passport0" pattern="[A-Z]{4}[0-9]{4}" required title="Please enter 4 characters and 4 numbers" placeholder="Enter passport" required></div><div class="col-sm-1">Gender:<select name="gender0" required><option value="M">Male</option><option value="F">Female</option></select></div><div class="col-sm-1">P Type:<select name="passengerType0" required><option value="adult">Adult</option><option value="child">Child</option></select></div><div class="col-sm-1">Meal:<select name="meal0" required><option value="veg">VEG</option><option value="nvg">NON-VEG</option></select></div>';
	}
	</script>
	<input type="submit" value="submit" name="submit" style="margin-top: 20px"/>

	</form>
	</div>


<footer id="myFooter" style=" padding-top: 10px;
    padding-bottom: 0px;
    position:relative;
    bottom:0px;
    width:100%;">
								<div class="container">
									<div class="row">
										<div class="col-sm-3">
											<h2 class="logo"><a href="#"> kingflyer </a></h2>
										</div>
										<div class="col-sm-4">
											<h5>Get started</h5>
											<ul>
												<li><a href="homepage">Home</a></li>
												<li><a href="register">Register </a></li>
												
											</ul>
										</div>
										<div class="col-sm-4">
											<h5>About us</h5>
											<ul>
												<li><a href="about">About us </a></li>
												<li><a href="contact">Contact us</a></li>
												
											</ul>
										</div>
										
										
									</div>
								</div>
								<div class="footer-copyright">
									<p>© 2017 Copyright Kingflyer flight booking website </p>
								</div>
								</footer> 

</body>
</html>