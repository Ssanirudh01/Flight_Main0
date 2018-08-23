<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
					
		<!-- Scripts -->
		
			
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css">
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css">

<title>Insert title here</title>
</head>
<body>
<!-- if no search results --><br><br><br><br><br><br><br><br><br><br>
<jsp:include page="header.jsp"></jsp:include>
	<h2>No result found for searched flight</h2>
	
	<a href="flightResult" style="font-size:24px;">Search for another flight</a><br><br><br><br><br><br><br><br>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>