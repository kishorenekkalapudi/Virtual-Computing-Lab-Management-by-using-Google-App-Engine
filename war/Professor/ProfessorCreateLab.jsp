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
	function Validate()
	{
		var name=document.add.txtlabname.value;
		var nm=document.add.txtnoofmechines.value;
		
		if(name==""&&nm=="")
			{
			alert("Enter Lab Name And No Of Systems");
			return false;
			}
		if(name=="")
			{
			alert("Enter Lab Name");
			return false;
			}
		if(nm=="")
			{
			alert("EnterNo Of Systems");
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
		

		<div align="center">
<div class="login-block">
    <h3> Creating Lab</h3>
    
    
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
        <p><label for="ftp-user-name">Lab Name</label><input type="text" name="txtlabname" id="ftp-user-name"/></p>        
        <p><label for="ftp-user-name">Number of Machines</label><input type="text" name="txtnoofmechines" id="ftp-user-name" onblur="NoValidate()"/></p>        
        <p class="submit-wrap"><input type="submit" id="register" class="button" value="Create" name="register"/></p>
    </form>
</div>
</div>
		</div></div></div></div></div>
	</div>
</body>
</html>