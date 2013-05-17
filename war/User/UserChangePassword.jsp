<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%
DataAccessLayer da=new DataAccessLayer();

String StudentId = (String)session.getAttribute("StudentId");
String FirstName=da.getStudentNameById(StudentId);



%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns1.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
	<script type="text/javascript">
	function Go()
	{
		var pwd=document.add.txtoldpwd.value;		
		var newpwd=document.add.txtnewpwd.value;
		var confirm=document.add.txtconfirmpwd.value;
		
		
		if(pwd=="" && newpwd=="" && confirm=="")
			{
			alert("Enter Old Password And New Password");
			return false;
			}
		
		if(pwd=="")
			{
			alert("Enter Old Password");
			return false;
			}
		
		if(newpwd=="")
		{
		alert("Enter New Password");
		return false;
		}
		
		if(confirm=="")
		{
		alert("Enter Confirm Password");
		return false;
		}
		
		if(newpwd!=confirm)
		{
		alert("Password Do Not Match.");
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
			<li class=""></a><a href="UserHome.jsp">Home</a></li>
			<li><a href="UserUseLab.jsp">Use Lab</a></li>
			<li><a href="UserChangePassword.jsp">Change Password</a></li>			
			<li><a href="UserLogout.jsp">Logout</a></li>
			
		</ul>

		<div class="line"></div>
		<!--header line-->
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome <%=FirstName %></a></h2>
		
		<div align="center">
<div class="login-block">
    <h3>Change Password</h3>
          
    <form action="/virtuallab" method="post" name="add" onsubmit="return Go()">
        <p><label for="ftp-user-name">Old Password</label></p>        
        <p><input type="password" name="txtoldpwd"/></p>        
        <p><label for="ftp-user-name">New Password</label></p>               
        <p><input type="password" name="txtnewpwd"/> </p>
        <p><label for="ftp-user-name">Confirm New Password</label></p>
        <p><input type="password" name="txtconfirmpwd"/></p>
        <p class="submit-wrap"><input type="submit" id="register" class="button" value="Change Password" name="register"/></p>
    </form>
</div>
</div>
		</div></div></div></div>
		
		
		</div>	
	</div>
</body>
</html>