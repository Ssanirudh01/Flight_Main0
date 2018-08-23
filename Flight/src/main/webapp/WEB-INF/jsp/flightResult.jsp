<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search flights | KingFly</title>
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
<br>
<div style="margin-top: 50px;margin-left: 300px;font-size: 24px;width: 60%">
<h2>Search Flight Here</h2>
<form method="get" action="flightList">
Source:
<select name="source" style="">
    <c:forEach var="line" items="${total}">
        <option value="${line.locationMasterId}" ><c:out value="${line.name}"/>( ${line.code} )</option>
    </c:forEach>
</select>
Destination:
<select name="destination">
    <c:forEach var="line" items="${total}">
        <option value="${line.locationMasterId}"><c:out value="${line.name}"/>( ${line.code} )</option>
    </c:forEach>
</select>
Class Type:
<select name="classType">
	<option value="E">Economy</option>
	<option value="B">Business</option>
	<option value="P">Premium</option>
</select>

Date:
<input type="date" name="dateOfJourney" style="width: 250px;height:40px;margin-top: 10px" required/> 

<input type="submit" value="submit" name="submit">
</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>