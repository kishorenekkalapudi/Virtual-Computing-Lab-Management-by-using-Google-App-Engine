<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>

<%
DataAccessLayer dal=new DataAccessLayer();
String ProfId = (String)session.getAttribute("ProfId");

String FirstName=dal.getProfessorNameById(ProfId);


//Get the Names of Students Who Requested Resources
String StudentId=request.getParameter("dropStudentId");
ResultSet rs=dal.getRequestedResources(StudentId);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns2.css" media="screen" />
	
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
			<h1><a href="ProfessorHome.jsp">Virtual lab</a></h1>
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
    <h3>Students Requests</h3>
    
    
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
        <p><label for="ftp-user-name">Details Of Request</label></p>		
        <%        
        	String StudId=rs.getString(1);
        	String StudentName=rs.getString(2);
        	String RequestId=rs.getString(3);
        	String LabName=rs.getString(4);
        	String SystemId=rs.getString(5);
        	String DateOfRequest=rs.getString(6);
        	String Ram=rs.getString(7);
        	String HardDisk=rs.getString(8);
        	String cpu=rs.getString(9);
        	%>
        	<table>
        	
        	<tr>
        	<td>Student Id</td>
        	<td><input type="text" name="txtstudentid" value=<%=StudId %> readonly="readonly" size="9"/> </td>
        	</tr>
        	
        	<tr>
        	<td>Student Name</td>
        	<td><input type="text" name="txtstudentname" value=<%=StudentName %> readonly="readonly" size="9"/> </td>
        	<td><input type="hidden" name="txtrequestid" value=<%=RequestId %> /> </td>        	
        	</tr>
        	
        	<tr>
        	<td>Lab Name</td>
        	<td><input type="text" name="txtlab" value=<%=LabName %> readonly="readonly" size="9"/> </td>
        	</tr>
        	
        	<tr>
        	<td>System Number</td>
        	<td><input type="text" name="txtsystemnumber" value=<%=SystemId %> readonly="readonly" size="9"/> </td>
        	</tr>
        	
        	<tr>
        	<td>Date Of Request</td>
        	<td><input type="text" name="txtdateofrequest" value=<%=DateOfRequest %> readonly="readonly" size="9"/> </td>
        	</tr>
        	
        	<tr>
        	<td>RAM (In MB)</td>
        	<td><input type="text" name="txtram" value=<%=Ram %> readonly="readonly" size="9"/> </td>
        	</tr>
        	
        	<tr>
        	<td>Hard Disk (In GB)</td>
        	<td><input type="text" name="txtharddisk" value=<%=HardDisk %> readonly="readonly" size="9"/> </td>
        	</tr>
        	
        	<tr>
        	<td>CPU (In MHZ)</td>
        	<td><input type="text" name="txtcpu" value=<%=cpu %> readonly="readonly" size="9"/> </td>
        	</tr>
        	
        	<tr>
        	<td><input type="submit" name="register" value="Grant"/> </td>
        	<td><input type="submit" name="register" value="Deny"/> </td>
        	</tr>
        	
        	</table>
        
                        
    </form>
</div>
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