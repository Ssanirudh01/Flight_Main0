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

<jsp:include page="header.jsp"></jsp:include>
<div class="page-wrap">	
	</div>
  
		<div class="page-wrap">

			
			<!-- Main -->
				<section id="main">

					<!-- Banner -->
						<section id="banner">
							<div class="inner" align="bottom"> 
								<ul>
								<div class="col-xs-12">
								<div id="1" class="tab1 active" >
									<form action="flightResult">
									
									
										<button type="submit" value="submit">FLIGHT SEARCH</button>	
								
									
									</form> 

								</div>
								</div>
								
								</ul>
							</div>
						</section>
					</section>
		</div>
					
<jsp:include page="footer.jsp"></jsp:include>
						
	</body>
</html>