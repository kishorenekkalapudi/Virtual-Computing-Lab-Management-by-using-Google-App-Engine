<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%
DataAccessLayer dal=new DataAccessLayer();
String ProfId = (String)session.getAttribute("ProfId");

String FirstName=dal.getProfessorNameById(ProfId);


%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en"
      xmlns:c="http://java.sun.com/jsp/jstl/core" 
>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
</head>
<body>
	<div id="content">
		<p id="top"></p>

		<div id="logo">
			<h1><a href="index.html">Virtual lab</a></h1>
		</div>
		<ul id="menu">
		<li class=""><a href="ProfessorHome.jsp">Home</a></li>
			<li><a href="ProfessorCreateLab.jsp">Create Lab</a></li>
			<li><a href="ProfessorAddSystems.jsp">Add Systems</a></li>	
			<li><a href="ProfessorChangeStudentStatus.jsp">Student Status</a></li>
			<li><a href="ProfessorResourceRequests.jsp"> Pending Requests</a></li>		
			<li><a href="../Login.jsp"> Logout</a></li>
			
		</ul>

		<div class="line"></div>
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome <%=FirstName%></a></h2>
		
				
				<div style="clear: both;">&nbsp;</div>

				<div class="entry">
					<p>Selected Student Status Has Successfully Changed. Now He Can Login To His Account with out any restrictions. You Will Be Redirected in 5 Seconds</p>
			    					
				</div>
			</div>
			<div class="post">
			</div>
			<div class="post">
			</div>

		<div style="clear: both;">&nbsp;</div>
		</div>
			
	</div>
	</div></div></div></div></div></div></div>
	</div>
</body>
</html>
<%
response.setHeader("Refresh","5; url=../Professor/ProfessorChangeStudentStatus.jsp");
%>
