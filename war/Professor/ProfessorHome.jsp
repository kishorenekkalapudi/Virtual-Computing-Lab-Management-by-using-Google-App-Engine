<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%
DataAccessLayer dal=new DataAccessLayer();
String ProfId = (String)session.getAttribute("ProfId");

String FirstName=dal.getProfessorNameById(ProfId);


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
		var libid=document.getElementById("dropstudents").value;
		window.location.href="ProfessorResourceRequests1.jsp?dropStudentId="+libid;		
	}
	</script>
	
	
	
</head>


<body>
	<div id="content">
		<p id="top"></p>
		
		<div id="logo">
			<h1><a href="UserHome.jsp">Virtual lab</a></h1>
		</div>
		
		<ul id="menu">
			<li class=""><a href="ProfessorHome.jsp">Home</a></li>
			<li><a href="ProfessorCreateLab.jsp">Create Lab</a></li>
			<li><a href="ProfessorDeleteLab.jsp">Delete Lab</a></li>
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
				<h2 class="title"><a href="#">Welcome <%=FirstName%></a></h2>
				<br></br>
					<div class="entry">
					<p>Virtual Lab is a Project to share the computing resources and increase their usage by effectively
						using cloud-based technology and environment.</p>
						
						
				</div>
				
						<div align="center">
				
				
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