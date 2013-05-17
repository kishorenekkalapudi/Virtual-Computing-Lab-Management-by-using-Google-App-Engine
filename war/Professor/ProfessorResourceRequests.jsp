<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%
DataAccessLayer dal=new DataAccessLayer();
String pid = (String)session.getAttribute("ProfId");

String FirstName=dal.getProfessorNameById(pid);


//Get the Names of Students Who Requested Resources
ResultSet rs=dal.StudentsWhoRequestedResources(pid);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns1.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
	
	<script type="text/javascript">
	function GoNext()
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
				
						<div align="center">
<div class="login-block">
    <h3>View Students Requests</h3>
    
    
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
        <p><label for="ftp-user-name">Select a Student</label>               
        &nbsp;&nbsp;&nbsp;
        <select name="dropstudents" onchange="GoNext()" id="dropstudents">
        <option value="0">Select</option>
        <%
        while(rs.next())
        {
        	String StudentId=rs.getString(1);
        	String StudentName=rs.getString(2);
        	%>
        	<option value=<%=StudentId %> ><%=StudentName%></option>
        	<%
        }
        
        %>
        </select></p>                
    </form>
</div>
</div>
				
			</div>
			
		<div style="clear: both;">&nbsp;</div>
		</div>
		
			
	</div>
	</div>
	</div>
	</div>
</body>
</html>