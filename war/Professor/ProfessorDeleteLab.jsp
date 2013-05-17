<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%
DataAccessLayer dal=new DataAccessLayer();
String ProfId = (String)session.getAttribute("ProfId");

String FirstName=dal.getProfessorNameById(ProfId);

ResultSet rs=dal.GetLabs();

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
		var name=document.add.droplab.value;
				
		if(name=="0")
			{
			alert("Select a Lab To Delete");
			return false;
			}
	}
	
	function NoValidate()
	{
	        var x = document.add.txtnoofmechines.value;
	        if(isNaN(x)|| x.indexOf(" ")!=-1){
	              alert("Enter numeric value");
	              document.forms.x.select.focus()
	              return false; }
	        
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
    <h3> Delete Lab</h3>
    
    
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
    <table>
    <tr>
    <td>
        <p><label for="ftp-user-name">Lab Name</label></td>
        <td>
        <select name="droplab">
        <option value="0">Select</option>
        <%
        while(rs.next())
        {
        	String labName=rs.getString(2);
        	String LabId=rs.getString(1);
        	%>
        	<option value=<%=LabId %>> <%=labName %></option>
        	<%
        }
        %>        
        </select>        
        </p>
        </td>
        </tr>
        <tr>
        <td></td>
        <td>
        <p class="submit-wrap"><input type="submit" id="register" class="button" value="Delete Lab" name="register"/></p>
        </td>
        </tr>
        </table>
    </form>
</div>
</div>
		</div></div></div></div></div>
	</div>
</body>
</html>