<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/screns1.css" media="screen" />
	<title>San Jose State Virtual Lab By Group 2</title>
	
	<script type="text/javascript">

	
	function Validate()
	{
		var un=document.Login.txtemail.value;
		
		var role=document.Login.role.value;
		if(un=="")
			{
			alert("Enter E-Mail Address");
			return false;
			}
		
		
		
		if(role=="select")
		{
		alert("Select Role ");
		return false;
		}
	}	
	
	</script>
	
</head>

<body>

	<div id="content">
		<p id="top"></p>
		<div id="logo">
			<h1><a href="index.html">Virtual lab</a></h1>
		</div>
		<ul id="menu">
			<li class=""><a href="index.html">Home</a></li>
			<li><a href="Login.jsp">Login</a></li>
			<li><a href="RegisterUser.jsp">Register</a></li>
		</ul>
		<div class="line"></div>
		
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome to Virtual Lab</a></h2>
		
<div align="center">
<div  class="login-block">
    <h3> Login</h3>
    
    <form action="/virtuallab" method="post" name="Login" onsubmit="return Validate()">
        <p>E-Mail Address<input type="text" name="txtemail"/></p>        
        <p>Role &nbsp;&nbsp;&nbsp; <select name="role" id="role">
        <option value="select">Select</option>
        <option value="student">Student</option>
        <option value="professor">Professor</option>
        
        </select>  
        <input type="submit" name="register" value="Recover"></p>
    </form>
    
</div></div></div></div></div></div>
</div>
</div>			
</body>
</html>