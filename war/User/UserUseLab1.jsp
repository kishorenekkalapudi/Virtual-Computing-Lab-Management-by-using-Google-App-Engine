<%@page import="com.google.appengine.api.conversion.Document"%>
<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%

//Get LabNameById
DataAccessLayer dal=new DataAccessLayer();
String LabId=request.getParameter("LabId");
String LabName=dal.getLabNameByLabId(LabId);

//Get Systems In Lab
ResultSet rs=dal.getSystemsByLabId(LabId);


String StudentId = (String)session.getAttribute("StudentId");

String FirstName=dal.getStudentNameById(StudentId);



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
		var sys=document.add.userSystem.value;
		if(sys=="0")
			{
			alert("Please Select a System");
			return false;
			}
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
			<li class=""><a href="UserHome.jsp">Home</a></li>
			<li><a href="UserUseLab.jsp">Use Lab</a></li>
			<li><a href="UserChangePassword.jsp">Change Password</a></li>			
			<li><a href="UserLogout.jsp">Logout</a></li>			
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
    <h3>Select System</h3>       
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Go()">
        <p><label for="ftp-user-name">Select System In <%=LabName%></label>               
        &nbsp;&nbsp;&nbsp;
        <select name="userSystem">
        <option value="0">Select</option>
        <%
        while(rs.next())
        {
        	String SystemId=rs.getString(1);        	
        	%>
        	<option value=<%=SystemId %> ><%=SystemId%></option>
        	<%
        }
        
        %>
        </select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <input type="submit" id="register" class="button" value="Use System" name="register"/></p>
       <p><input type="hidden" id="hiddenlabname" name="hiddenlabname" value=<%=LabName%> /></p>
    </form>
    </div>
</div>
</div>
</div></div></div>
</div>
</div>
</body>
</html>