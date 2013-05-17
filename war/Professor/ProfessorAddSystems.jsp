<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%
DataAccessLayer da=new DataAccessLayer();
ResultSet rs=da.GetLabs();

String ProfId = (String)session.getAttribute("ProfId");
String FN=da.getProfessorNameById(ProfId);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns1.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
	<script type="text/javascript">
	function Validate()
	{
		
		var drop=document.add.droplabs.value;
		var ram=document.add.txtram.value;
		var hdd=document.add.txthdd.value;
		var cpu=document.add.txtprocessor.value;
		
		if(ram=="")
			{
			alert("Enter RAM Capacity in (MB)");
			return false;
			}
		if(hdd=="")
			{
			alert("Enter Hard Disk Capacity in ( GB )");
			return false;
			}
		if(cpu=="")
		{
		alert("Enter CPU Capacity in ( MHZ )");
		return false;
		}
		
		if(drop=="0" )
			{
			alert("Select Lab");
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
				<h2 class="title"><a href="#">Welcome <%=FN %></a></h2>
		
		
		<div align="center">
<div class="login-block">
    <h3> Creating Lab</h3>
    
    
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
        <p><label for="ftp-user-name">Lab Name</label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="droplabs" id="droplabs">
        <option value="0">Select</option>
        <%
        while(rs.next())
        {
        	String LabId=rs.getString(1);
        	String LN=rs.getString(2);
        	String NoOfSystems=rs.getString(3);
        	%>
        	<option value=<%=LabId %> ><%=LN%> </option>
        	
        	<%
        }
        %>
        </select>
        </p>        
        <p><label for="ftp-user-name">RAM In (MB)</label><input type="text" name="txtram" id="ftp-user-name"/></p>
        <p><label for="ftp-user-name">Hard Disk In (GB)</label><input type="text" name="txthdd" id="ftp-user-name"/></p>
        <p><label for="ftp-user-name">Processor in (MHZ)</label><input type="text" name="txtprocessor" id="ftp-user-name"/></p>
        <p class="submit-wrap"><input type="submit" id="register" class="button" value="Add Systems" name="register"/></p>
    </form>
</div>
</div>
			</div></div></div></div></div>
	</div>
</body>
</html>