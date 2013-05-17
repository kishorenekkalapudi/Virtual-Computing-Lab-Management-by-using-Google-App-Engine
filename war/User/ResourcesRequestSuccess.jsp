<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%
DataAccessLayer dal=new DataAccessLayer();
String StudentId = (String)session.getAttribute("StudentId");

String FirstName=dal.getStudentNameById(StudentId);


// Display Professor Name
String ProfessorId=(String)session.getAttribute("ProfessorId");
String ProessorName=dal.getProfessorNameById(ProfessorId);


%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
</head>


<body>
	<div id="content">
		<p id="top"></p>
		
		<div id="logo">
			<h1><a href="UserHome.jsp">Virtual lab</a></h1>
		</div>
		
		<ul id="menu">
			<li class=""></a><a href="UserHome.jsp">Home</a></li>
			<li><a href="UserUseLab.jsp">Use Lab</a></li>			
			<li><a href="UserChangePassword.jsp">Change Password</a></li>
			<li><a href="UserLogout.jsp">Logout</a></li>
			
		</ul>
		
		<div class="line"></div>
		
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome <%=FirstName%></a></h2>
				
				<div style="clear: both;">&nbsp;</div>
				<div class="entry">
					
					
					<p>Your Request Has Been Successfully Sent to Professor <%=ProessorName %>. Check Request Status for the Current Status of your Request</p>
						
				</div>
			</div>
			
		<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #content -->
			
	</div>
	</div>
	</div>
	</div>
</body>
</html>