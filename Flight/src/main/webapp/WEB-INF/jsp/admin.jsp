<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	 
<style>
body {font-family: "Lato", sans-serif;}

/* Style the tab */
div.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
div.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
div.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
div.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include><br>
<p>Click on the buttons inside the tabbed menu:</p>
<div class="container">
<div class="tab">
  <button class="tablinks" onclick="Master(event, 'FleetMaster')">FleetMaster</button>
  <button class="tablinks" onclick="Master(event, 'FareMaster')">FareMaster</button>
  <button class="tablinks" onclick="Master(event, 'LocationMaster')">LocationMaster</button>
   <button class="tablinks" onclick="Master(event, 'FlightMaster')">FlightMaster</button>
  
</div>
<div id="FleetMaster" class="tabcontent">
<br><hr><br>
<form action="modifyFleet" method="post">
  <p><b>ModifyFleet</b></p>
  <br><br>
Fleet Id:
<input type="text" name="fleetMasterId">

Flight Code:
<input type="text" name="code">

Flight Model:
<input type="text" name="model">

Total Economic Seats:
<input type="text" name="totalEconomySeats">

Total Premium Seats:
<input type="text" name="totalPremiumSeats">
<br><br>
Total Business Seats:
<input type="text" name="totalBusinessSeats">
<br><br>
<input type="submit" value="Submit">
</form>
<br><hr><br>

<form action="addFleet" method="post">
<p><b>AddFleet</b></p>
Fleet Id:
<input type="text" name="fleetMasterId">

Flight Code:
<input type="text" name="code">

Flight Model:
<input type="text" name="model">

Total Economic Seats:
<input type="text" name="totalEconomySeats">

Total Premium Seats:
<input type="text" name="totalPremiumSeats">
<br><br>
Total Business Seats:
<input type="text" name="totalBusinessSeats">
<br><br>
<input type="submit" value="Submit">
</form>

<br><hr><br>

<form action="deleteFleet">
<p><b>DeleteFleet</b></p>
 Fleet Id:
<input type="text" name="fleetId">
<br><br>
<input type="submit" value="Delete">
</form>

<br><hr><br>
<form action="displayFleet" >
    <h3>Display Fleet</h3><br><br>
<input type="submit" value="Display Fleet Details">

</form> 
</div>
<!-- ========================================================================= -->


<div id="FareMaster" class="tabcontent">
<br><hr><br>
  <form  action="modifyFare" method="post">
  <p><b>ModifyFare</b></p>
 
  Fare_Master_Id:<input type="text" name="fareMasterId">
  Economy_class:<input type="text" name="economyClass">
  Premium_class:<input type="text" name="premiumClass">
  Business_class:<input type="text" name="businessClass"><br><br>
  <input type="submit" value="submit">
  </form>
  
  <form  action="addFare" method="post">
<br><hr><br>
  <p><b>AddFare</b></p>
    Fare_Master_Id:<input type="text" name="fareMasterId">
  Economy_class:<input type="text" name="economyClass">
  Premium_class:<input type="text" name="premiumClass">
  Business_class:<input type="text" name="businessClass"><br><br>
  <input type="submit" value="submit">
  </form>
  
  <form  action="deleteFare" >
<br><hr><br>
  <p><b>DeleteFare</b></p>
   Fare_Master_Id:<input type="text" name="fareMasterId">
<input type="submit" value="Delete">
</form>

<br><hr><br>
<form action="displayFare">
<h3>DisplayFare</h3><br><br>
<input type="submit" value="Display Fare Details">
</form>
  
</div>


<!-- ========================================================================== -->


<div id="LocationMaster" class="tabcontent">
<br><hr><br>
 <form  action="modifyLocation" method="post">
  <p><b>ModifyLocation</b></p>
Location_Master_Id:<input type="text" name="locationMasterId">
Name:<input type="text" name="name">
Code:<input type="text" name="code">
Airport_name:<input type="text" name="airportName">
Country:<input type="text" name="country"><br><br>
<input type="submit" value="submit">
</form>

<br><hr><br>
<form action="modifyLocation" method="post">
<p><b>AddLocation</b></p>
Location_Master_Id:<input type="text" name="locationMasterId">
Name:<input type="text" name="name">
Code:<input type="text" name="code">
Airport_name:<input type="text" name="airportName">
Country:<input type="text" name="country"><br><br>
<input type="submit" value="submit">
</form>

<br><hr><br>
<form  action="deleteLocation">
<p><b>DeleteLocation</b></p>
   Location_Master_Id:<input type="text" name="locationMasterId">
<input type="submit" value="Delete">

</form>
<br><hr><br>
<form action="displayLocation">
<h3>DisplayLocation</h3><br><br>
<input type="submit" value="Display Location Details">
</form>
</div>

<!-- ====================================================================== -->


<div id="FlightMaster" class="tabcontent">  
<br><hr><br>
<form action="addFlight" method="post" >
<p><b>AddFlight</b></p>
<label>Flight_id:</Label>
<input type="text" name="flightId">
 <label>Departure_loc:</Label>
<input type="text" name="departureLoc">
<label>Arrival_loc:</Label>
<input type="text" name="arrivalLoc">
<label>Fleet:</label>
<input type="text" name="fleet">
<label>Fare:</label>
<input type="text" name="fare">
<label>Departure_Time:</label>
<input type="text" name="departureTime"><br>
<br>
<label>Arrival_Time:</label>
<input type="text" name="arrivalTime">
<label>Flight_travel_date:</label>
<input type="text" name="flightTravelDate">
<label>Remaining_economy_seats:</label>
<input type="text" name="remainingEconomySeats"><br><br>
<label>Remaining_premium_seats:</label>
<input type="text" name="remainingPremiumSeats">
<label>Remaining_business_seats:</label>
<input type="text" name="remainingBusinessSeats"><br><br>
<input type="submit" name="submit">
</form>


<br><hr><br>
<form action="deleteFlight" method="post">
<p><b>DeleteFlight</b></p>
Enter primary key:<br>
<input type="text" name="flightId">
<input type="submit" name="submit">
<br><br>
</form>
<br><hr><br>
<form action="displayFlight">
<p><b>Display Flight Details</b></p>
<input type="submit" value="Display Flight Details">
</form>
</div>
</div>
<!-- <footer id="myFooter" style=" padding-top: 10px;
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
								</footer>  -->
<script>
function Master(evt, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    evt.currentTarget.className += " active";
}
</script>
    
</body>
</html> 
