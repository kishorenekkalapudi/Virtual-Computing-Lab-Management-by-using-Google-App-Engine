<%
DataAccessLayer dal=new DataAccessLayer();
ResultSet rs=dal.getStudentsWhoseStatusIsZero();

String ProfId = (String)session.getAttribute("ProfId");
String PFn=dal.getProfessorNameById(ProfId);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" type="text/css" href="../css/screns3.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
	<script type="text/javascript">
	function Validate()
	{
		var name=document.add.dropstatus.value;
		if(name=="0")
			{
			alert("Select Student To Enable Status");
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
			<li class=""><a href="ProfessorHome.jsp">Home</a></li>
			<li><a href="ProfessorCreateLab.jsp">Create Lab</a></li>
			<li><a href="ProfessorAddSystems.jsp">Add Systems</a></li>	
			<li><a href="ProfessorChangeStudentStatus.jsp">Student Status</a></li>
			<li><a href="ProfessorResourceRequests.jsp"> Pending Requests</a></li>
			<li><a href="ProfessorDeleteLab.jsp">Delete Lab</a></li>				
			<li><a href="../Login.jsp"> Logout</a></li>
			
		</ul>
	<div class="line"></div>
		
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome <%=PFn %></a></h2>
		
		<div align="center">
<div class="login-block">
    <h3> Creating Lab</h3>
    
    
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
        <p>Newly Registered Students
        <select name="dropstatus">
        <option value="0">Select</option>
        <%
        while(rs.next())
        {
        	String StudentId=rs.getString(1);
        	String FirstName=rs.getString(2);
        	%>
        	<option value=<%=StudentId %> ><%=FirstName%> </option>
        	<%
        }
        
        %>
        </select>
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;      
		<input type="submit" class="button" value="Enable" name="register"/></p>
    </form>
</div>
</div>
		</div></div></div></div></div>
	</div>
</body>
</html>