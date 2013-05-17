<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%@page import="com.google.cloud.sql.jdbc.ResultSet"%>
<%
DataAccessLayer da=new DataAccessLayer();
ResultSet rs=da.GetProfessorDetails();



String StudentId = (String)session.getAttribute("StudentId");

String FirstName=da.getStudentNameById(StudentId);

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
		var drop=document.add.dropprofessor.value;
		var ram=document.add.txtram.value;
		var hdd=document.add.txthdd.value;
		var cpu=document.add.txtprocessor.value;
		
		if(ram==""&&hdd==""&&cpu=="")
			{
			alert("Enter Atleast one Resource to Send Request");
			return false;
			}
		
		if(drop=="0")
			{
			alert("Select Professor");
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
			<li class=""></a><a href="UserHome.jsp">Home</a></li>
			<li><a href="UserUseLab.jsp">Use Lab</a></li>
			<li><a href="UserChangePassword.jsp">Change Password</a></li>			
			<li><a href="UserLogout.jsp">Logout</a></li>
			
		</ul>

		<div class="line"></div>
		<!--header line-->
		<div id="page">
	<div id="page-bgtop">
	<div id="page-bgbtm">
		<div id="content">
			<div class="post">
				<h2 class="title"><a href="#">Welcome <%=FirstName %></a></h2>
		
		<div align="center">
<div class="login-block">
    <h3>Enter Total Amount Of Resources that you require</h3>
          
    <form action="/virtuallab" method="post" name="add" onsubmit="return Validate()">
        <p><label for="ftp-user-name">Select Professor</label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select name="dropprofessor" id="dropprofessor">
        <option value="0">Select</option>
        <%
        while(rs.next())
        {
        	String ProfessorId=rs.getString(1);
        	String ProfessorName=rs.getString(2);
        	
        	%>
        	<option value=<%=ProfessorId %> ><%=ProfessorName %> </option>
        	
        	<%
        }
        %>
        </select>
        </p>        
        <p><label for="ftp-user-name">RAM In (MB)</label><input type="text" name="txtram" id="txtram"/></p>
        <p><label for="ftp-user-name">Hard Disk In (GB)</label><input type="text" name="txthdd" id="txthdd"/></p>
        <p><label for="ftp-user-name">Processor in (MHZ)</label><input type="text" name="txtprocessor" id="txtprocessor"/></p>
        <p class="submit-wrap"><input type="submit" id="register" class="button" value="Request" name="register"/></p>
    </form>
</div>
</div>
		</div></div></div></div>
		
		
		</div>	
	</div>
</body>
</html>