<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%
DataAccessLayer dal=new DataAccessLayer();
ResultSet rs=dal.GetProfessorDetails();

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/scrensadmin.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
</head>


<body>
	<div id="content">
		<p id="top"></p>
		
		<div id="logo">
			<h1><a href="AdminHome.jsp">Virtual lab</a></h1>
		</div>
		
		<ul id="menu">
			<li class=""><a href="AdminHome.jsp">Home</a></li>
			<li class=""><a href="RegisterProfessor.jsp">Add Professor</a></li>
			<li class=""><a href="ProfessorDetails.jsp">Professor Details</a></li>
			<li class=""><a href="AdminMonitorSystems.jsp">Monitor Systems</a></li>
			<li class=""><a href="AdminResourceMonitor.jsp">Monitor Resources</a></li>
			<li><a href="../Login.jsp">Logout</a></li>
			
		</ul>
		
		<div class="line"></div>
		
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome Admin</a></h2>
				
				<div style="clear: both;">&nbsp;</div>
				<div class="entry">
				
				
				
				
				
				
				
				
				<table id="rounded-corner" summary="System Details">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">First Name</th>
            <th scope="col" class="rounded-q1">Last Name</th>
            <th scope="col" class="rounded-q1">User Name</th>
            <th scope="col" class="rounded-q2">Date Of Birth</th>
            <th scope="col" class="rounded-q3">Gender</th>
            <th scope="col" class="rounded-q3">Department</th>
            <th scope="col" class="rounded-q3">E-Mail</th>
            <th scope="col" class="rounded-q3">Address</th>
            <th scope="col" class="rounded-q4">Phone Number</th>
        </tr>
    </thead>
        <tfoot>
    	<tr>
        	
        </tr>
    </tfoot>
    <tbody>
			<% 
					while(rs.next())
					{
						String FirstName=rs.getString(2);
						String LastName=rs.getString(3);
						String UserName=rs.getString(4);
						String DateOfBirth=rs.getString(6);
						String Gender=rs.getString(7);
						String Dept=rs.getString(8);
						String EMail=rs.getString(9);
						String Add=rs.getString(10);
						String Phno=rs.getString(11);
						
						%> <tr>						
						<td><%=FirstName %></td>
						<td><%=LastName %></td>
						<td><%=UserName %></td>
						<td><%=DateOfBirth %></td>
						<td><%=Gender %></td>
						<td><%=Dept %></td>
						<td><%=EMail %></td>
						<td><%=Add %></td>
						<td><%=Phno %></td>
						</tr>
						<%
					}
					%>					
	</tbody>
</table>
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