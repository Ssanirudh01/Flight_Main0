<html>
<head>
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

<div class="topnav navbar-fixed-top">
  <a class="active" href="homepage">Home</a>

  <a href="contact">Contact</a>
  <a href="about">About</a>
  <div style="float:right">
 <%

String logged="";
if(session.getAttribute("logged")!=null)
{
logged=(String) session.getAttribute("logged");
String name=(String) session.getAttribute("name");
}

%>

<% if (logged.equals("true")) { %>
<a href="editUser">User Profile</a>
<a href="logout">Logout</a>
<% } else { %>
  <a href="login">Login</a>
  <a href="register">Register</a>

<% } %>
  </div>
</div>

</body>
</html>