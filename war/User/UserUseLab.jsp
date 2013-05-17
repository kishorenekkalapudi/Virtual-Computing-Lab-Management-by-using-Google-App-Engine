<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%@page import="javax.mail.Session"%>
<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%
DataAccessLayer dal=new DataAccessLayer();
ResultSet rs=dal.GetLabs();


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
		var libid=document.getElementById("userlab").value;
		if(libid=="0")
			{
			alert("Select Lab")
			}
		else
			{
			window.location.href="UserUseLab1.jsp?LabId="+libid;
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
			<li class=""></a><a href="UserHome.jsp">Home</a></li>
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
    <h3>Select a Lab</h3>
    
    
    
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
        <p><label for="ftp-user-name">Select Lab</label>               
        &nbsp;&nbsp;&nbsp;
        <select name="userlab" onchange="Go()" id="userlab">
        <option value="0">Select</option>
        <%
        while(rs.next())
        {
        	String LabId=rs.getString(1);
        	String LabName=rs.getString(2);
        	%>
        	<option value=<%=LabId %> ><%=LabName%></option>
        	<%
        }
        
        %>
        </select></p>                
    </form>
</div>
</div>
		</div></div></div></div></div>
		
	</div>
</body>
</html>