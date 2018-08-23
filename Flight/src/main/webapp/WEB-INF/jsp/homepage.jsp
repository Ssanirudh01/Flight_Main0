<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML>

<html>
	<head>
		<title>KINGFLYER</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		
			  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
					
		<!-- Scripts -->
		
			
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css">

		
		<!-- <script>
		p.italic {
    font-style: italic;
}
</script> -->
<style>
body {margin:0;}

.topnav {
  overflow: hidden;
  background-color: #333;
  }

.topnav a {
  float: left;
  display: block;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
  
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
    background-color: #4CAF50;
    color: white;
}
</style>

	</head>
	<body>

<!-- <div class="topnav">
  <a class="active" href="#home">Home</a>

  <a href="#contact">Contact</a>
  <a href="#about">About</a>
  <div style="float:right">
  <a href="#login">Login</a>
  <a href="#Register">Register</a>
  </div>
</div> -->
<jsp:include page="/WEB-INF/jsp/header.jsp"></jsp:include>
\<div class="page-wrap">	
	</div>


  
		<div class="page-wrap">

			
			<!-- Main -->
				<section id="main">

					<!-- Banner -->
						<section id="banner">
							<div class="inner" align="bottom"> 
								<ul>
								<div class="col-xs-12">
									<form action="flightResult">
									
									
										<button type="submit" value="submit">FLIGHT SEARCH</button>	
								
									
									</form> 

							
								</div>
								
								</ul>
							</div>
						</section>
					</section>
		</div>						

<br><br><br><br>
<%-- <jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include> --%>
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