<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%

String LabName=(String)session.getAttribute("LabName");
String SystemId=(String)session.getAttribute("SystemId");


DataAccessLayer dal=new DataAccessLayer();
String StudentId = (String)session.getAttribute("StudentId");

String FirstName=dal.getStudentNameById(StudentId);

//Get LabId By Name
String LabId=dal.getLabIdByLabName(LabName);

//Change Availability
int Status=dal.ChangeAvailabilityToZeroInSystemDetails(LabId,SystemId);

//Monitor Student
String ToDayDate=dal.GetDate();
String StartTime=dal.GetPresentTime();

int Status1=dal.MonitorStudent(StudentId,LabId,SystemId,ToDayDate,StartTime);


//Getting System Details That User Using
ResultSet system=dal.getSystemConfiguration(SystemId);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="../css/style.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
</head>


<body>
	<div id="content">
		<p id="top"></p>
		
		<div id="logo">
			<h1><a href="UserHome.jsp">Virtual lab</a></h1>
		</div>
		
		<ul id="menu">
			<li class=""><a href="UserHome.jsp">Home</a></li>
			<li><a href="UserUseLab.jsp">Use Lab</a></li>
			<li><a href="UserRequestResources.jsp">Request Resources</a></li>
			<li><a href="UserChangePassword.jsp">Change Password</a></li>			
			<li><a href="UserLogout.jsp">Logout</a></li>
			
		</ul>
		
		<div class="line"></div>
		
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome <%=FirstName %></a></h2>
				
				<div style="clear: both;">&nbsp;</div>
				<div class="entry">
					<p></p>
						
						<p>System Started Successfully. You are Currently Using <%=SystemId %> System In <%=LabName %> </p>
						
						<p>System Configuration That you are Currently Using</p>
						
						
	<table id="rounded-corner" summary="System Details">
    <thead>
    	<tr>
        	<th scope="col" class="rounded-company">Lab Name</th>
            <th scope="col" class="rounded-q1">System Number</th>
            <th scope="col" class="rounded-q2">RAM In (MB)</th>
            <th scope="col" class="rounded-q3">Hard Disk In (GB)</th>
            <th scope="col" class="rounded-q4">Processor In (CPU)</th>            
        </tr>
    </thead>
        <tfoot>
    	<tr>
        	
        </tr>
    </tfoot>
    <tbody>
			<%
			
						String Ln=system.getString(1);
						String Sn=system.getString(2);
						String ram=system.getString(3);
						String hdd=system.getString(4);
						String cpu=system.getString(5);
						
						%>
						<tr>
						<td>
						<%=Ln %>
						</td>
						
						<td>
						<%=Sn %>
						</td>
						
						<td>
						<%=ram %>
						</td>
						
						<td>
						<%=hdd %>
						</td>
						
						<td>
						<%=cpu %>
						</td>
						</tr>					
	</tbody>
</table>
					<br/>
												
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