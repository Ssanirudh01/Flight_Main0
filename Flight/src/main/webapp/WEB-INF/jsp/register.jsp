<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="assets/css/Footer-with-button-logo.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>  
  <script src="//ajax.googleapis.com/ajax/libs/angularjs/1.4.0/angular-messages.js"></script>
   <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
			  <script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
					
		<!-- Scripts -->
		
			
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/submitbutton.css"/>
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/main.css" />
			<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/Footer-with-button-logo.css"/>
 </head>
<body ng-app="">  
<jsp:include page="header.jsp"></jsp:include>

   <!--div class="container"-->

    <form class="well form-horizontal" action="registrationDetails" method="post"  id="contact_form" style='margin:10%'>


<!-- Form Name -->
<legend><center><h2><b>Registration Form</b></h2></center></legend><br>

${message}

<!-- Text input-->
 <div class="form-group"> 
  <label class="col-md-4 control-label">Title</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="title" class="form-control selectpicker">
      <option value="Mr">Mr.</option>
      <option value="Mrs">Mrs.</option>
      <option value="Ms">Ms.</option>
    </select>
  </div>
</div>
</div>
  
  
<div class="form-group">
  <label class="col-md-4 control-label">First Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="firstName" placeholder="First Name" class="form-control" minlength="3" type="text" required>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">Middle Name</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="middleName" placeholder="Middle Name" class="form-control"  type="text">
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Last Name</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="lastName" placeholder="Last Name" class="form-control" minlength="3" type="text" required>
    </div>
  </div>
</div>
  
  <div class="form-group"> 
  <label class="col-md-4 control-label">Gender</label>
    <div class="col-md-4 selectContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-list"></i></span>
    <select name="gender" class="form-control selectpicker">
      <option value="M">Male</option>
      <option value="F">Female</option>
    </select>
  </div>
</div>
</div>
  
<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label">E-Mail</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="emailAddress" placeholder="E-Mail Address" class="form-control" patttern="[a-z][0-9]{12}" minlength="6" type="text" required>
    </div>
  </div>
</div>

<!-- Text input-->
<div class="form-group">
  <label class="col-md-4 control-label" >Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input type="password" placeholder="Password" required="required" class="form-control"  id="password" name="password" >
  
    </div>
  </div>
</div>

<!-- Text input-->

<div class="form-group">
  <label class="col-md-4 control-label" >Confirm Password</label> 
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input name="password_confirm" required="required" id="password" placeholder="Confirm Password" class="form-control"  type="password" oninput="check(this)">
    </div>
  </div>
</div>
<script language='javascript' type='text/javascript'>
    function check(input) {
        if (input.value != document.getElementById('password').value) {
            input.setCustomValidity('Password Must be Matching.');
        } else {
            // input is valid -- reset the error message
            input.setCustomValidity('');
        }
    }
</script>




<!-- Text input-->
       
<div class="form-group">
  <label class="col-md-4 control-label">Contact No.</label>  
    <div class="col-md-4 inputGroupContainer">
    <div class="input-group">
        <span class="input-group-addon"><i class="glyphicon glyphicon-earphone"></i></span>
  <input name="mobileNumber" placeholder="(639)" class="form-control" type="text" pattern="(7|8|9)\d{9}$" required>
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">DateOfBirth</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
  <input type="date" name="dateOfBirth" placeholder="Username" class="form-control" required >
    </div>
  </div>
</div>

<div class="form-group">
  <label class="col-md-4 control-label">PassportNumber</label>  
  <div class="col-md-4 inputGroupContainer">
  <div class="input-group">
  <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
  <input  name="passportNumber" placeholder="Passport Number" pattern ="[A-Z]{4}[0-9 ]{4}"class="form-control"  type="text" required>
    </div>
  </div>
</div>

<!-- Select Basic -->
<!-- Button -->
<div class="form-group">
  <label class="col-md-4 control-label"></label>
  <div class="col-md-4"><br>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button type="submit" class="btn btn-warning" >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspSUBMIT <span class="glyphicon glyphicon-send"></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>
  </div>
</div>


</form>
    </div><!-- /.container -->
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