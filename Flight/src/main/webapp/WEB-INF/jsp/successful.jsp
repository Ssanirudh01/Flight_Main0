<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
<br><br><br><br><br><br>
<div style="margin-left: 50px">
<h3>successful!!!</h3>
${msg }
<a href="generateTicket">Print Ticket</a>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>