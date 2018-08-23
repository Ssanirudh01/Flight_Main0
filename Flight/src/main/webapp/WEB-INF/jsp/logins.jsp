<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
 <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
					
		<!-- Scripts -->
		
			
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css"/>
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css"/>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<br><br><br><br><br><br>
<div style="margin-left:50px">
<h3>Login</h3>
<form action="checkLogins" method="post">  
Email:<input type="text" name="email"/><br/>  
Password:<input type="password" name="password"/><br/>  
<input type="submit" value="login"/>  
</form>
<a href="register">register</a> 
</div>


<!-- <a href="admin_locationMaster">Location Master</a>
<a href="flightResult">FlightResult</a>
<a href="sessionTest">Login</a> -->

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
</body>
</html> --%>

<!DOCTYPE html>
<html lang="en" ng-app="app">
<head>
  
  <title>KingFlyer</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
  <!--Pulling Awesome Font -->
   <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
 <link href="../css/lo.css">
		
			  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
					
		<!-- Scripts -->
		
			
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css"/>
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css"/>
</head>
<body >
<jsp:include page="header.jsp"></jsp:include>

<div class="container"  ng-controller="controllerName" style="width:1600px; margin-top:60px;" >

    <div class="row">
        <div class="col-md-4 col-md-offset-6">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-lock"></span> Login</div>
                <div class="panel-body">
                    <form class="myForm" role="form" name="userform" action="checkLogins" method="post">
                    <fieldset>
                    
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-3 control-label">Email</label>
                        <div class="col-sm-9" >
                           
                            <input type="text" class="form-control"  ng-pattern="re" placeholder="Enter Email ID"
                             name="email" ng-model="mail" required/>
                                   <span ng-show="userform.mail.$touched && userform.mail.$error.required">
                                    <p style="color:red;">*Email Id Required</p>
                                    </span>
                                    <p class="help-block"><span ng-show="userform.mail.$error.pattern">
                                    Please Enter a valid Email-ID as abc@email.com'
                                    </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-3 control-label">
                            Password</label>
                        <div class="col-sm-9">
                            <input type="password" class="form-control" placeholder="Enter Password" name="password" ng-model="password" maxlength="15" required/>
                                <span ng-show="userform.password.$touched &&  userform.password.$error.required">
                                <p style="color:red;">*Password Required</p></span>

                                
                                    
                        </div>
                    </div>
                    <!-- <div class="form-group">
                        <div class="col-sm-offset-3 col-sm-9">
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"/>
                                    Remember me
                                </label>
                            </div>
                        </div>
                    </div> -->
                    <br><br>
                    <div class="form-group last">
                        <div class="col-sm-offset-3 col-sm-9">
                            <button type="submit" class="btn btn-success btn-sm">
                                Sign in</button>
                                 <button type="reset" class="btn btn-default btn-sm">
                                Reset</button>
                          <!--  <a href="" >Forgot password? -->
                        </div>
                    </div>
                    </fieldset>
                    </form>
                </div>
                <div class="panel-footer">
                    Not Registered? <a href="register">Register here</a></div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"></jsp:include>
<script>
	var app=angular.module("app",[]);

	app.controller('controllerName',['$scope',function($scope){
		
		$scope.re=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

	}]);


	</script>

</body>
</html>