<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link rel="stylesheet" type="text/css" href="../css/screns2.css" media="screen" />
	
	<title>San Jose State Virtual Lab By Group 2</title>
	
	
	<script type="text/javascript" language="javascript" >

function Validate()
{
	var name12 = document.Registration.txtfn.value;
	var name1 = document.Registration.txtln.value;
	var name2 = document.Registration.txtun.value;
	var name3 = document.Registration.txtpw.value;
	var name4 = document.Registration.txtcpw.value;
	var name5 = document.Registration.txtdob.value;
	var name6 = document.Registration.gender.value;
	var name7 = document.Registration.txtmail.value;
	var name8 = document.Registration.txtadd.value;
	var name9 = document.Registration.txtphno.value;
	var name10 = document.Registration.txtsq.value;
	var name11 = document.Registration.txtsa.value;
	var name13 = document.Registration.department.value;
	
	if(name12 == "")
	{		
		if(name1 == "")
		{
			if(name2 == "")
			{
				if(name3 == "")
				{
					if(name4 == "")
					{
						if(name5 == "")
						{
							if(name6 == "")
							{								
								if(name7 == "")
								{									
									if(name8 == "")
									{										
										if(name9 == "")
										{											
											if(name10 == "")
											{												
												if(name11 == "")
												{													
													alert("Enter All Fields");
													return false;
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
		}	
	}
	
	
	if(name12 == "")
	{
		alert("fistName should be Mandatory.");
		return false;
	}
	
	
	if(name1 == "")
	{
		alert("lastName should be Mandatory.");
		return false;
	}
	if(name2 == "")
	{
		alert("UserName should be Mandatory.");
		return false;
	}if(name3 == "")
	{
		alert("Password missing.");
		return false;
	}if(name4 != name3)
	{
		alert("password not matching.");
		return false;
	}if(name5 == "")
	{
		alert("date of brith should be Mandatory.");
		return false;
	}
	if(name7 == "")
	{
		alert("Email should be Mandatory.");
		return false;
	}
	if(name8 == "")
	{
		alert("address should be Mandatory.");
		return false;
	}
	if(name9 == "")
	{
		alert("phone number should be Mandatory.");
		return false;
	}
	if(name10 == "")
	{
		alert("security question should be Mandatory.");
		return false;
	}
	if(name11 == "")
	{
		alert("security answer should be Mandatory.");
		return false;
	}
	if(name13 == "select")
	{
		alert("Select Department");
		return false;
	}
	}

	
	function setReset(Registration)
	{
		document.Registration.reset();
		return false;
	}
	
	function EmailValidation()
	{
	var x=document.Registration.txtmail.value;
	var atpos=x.indexOf("@");
	var dotpos=x.lastIndexOf(".");
	if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
	  {
	  alert("Not a valid e-mail address");
	  return false;
	  }
	}
	
	function DOBValidation(){
		var DOB = new Date(document.Registration.txtdob.value)
		
		if (DOB == "Invalid Date") {
		    alert("DOB required in the format YYYY/MM/DD")
		    document.forms.DOB.select.focus()
		    return false
		}
		}
	
	function PhoneValidate()
	{
	        var x = document.Registration.txtphno.value;
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
								<div align="center">
			<div  class="login-block">
    <h3> Professor Registration</h3>
			
			<form name="Registration" id="Registration" action="/virtuallab" method="post" onsubmit="return Validate()">
				<table cellpadding="4" cellspacing="14">			
					<tr>
						<td>FirstName :</td>
						<td><input type="text" name="txtfn" size="20"/>
						</td>
					</tr>

					<tr>
						<td>LastName :</td>
						<td><input type="text" name="txtln" size="20"/>
						</td>
					</tr>

					<tr>
						<td>UserName :</td>
						<td><input type="text" name="txtun" size="20"/>
						</td>
					</tr>

					<tr>
						<td>Password :</td>
						<td><input type="password" name="txtpw" size="20"/>
						</td>
					</tr>
					<tr>
						<td>Confirm :</td>
						<td><input type="password" name="txtcpw" size="20"/>
						</td>

					</tr>


					<tr>
						<td>DateofBirth(Y-M-D) :</td>
						<td><input type="text" name="txtdob" size="20" onblur="DOBValidation()"/>
						</td>
					</tr>
					
					<tr>
					<td>Gender :</td>
					<td><input type="radio" name="gender" value="Male" checked="checked"/>Male &nbsp;&nbsp;&nbsp;    
						 <input type="radio" name="gender" value="Female"/>Fe Male </td>					 
					</tr>
					
					<tr>					
					<td>Department :</td>
					<td>
					<select name="department">
					<option value="select">Select</option>
					<option value="ComputerScience">Computer Science</option>
					<option value="Electronics">Electronics</option>
					<option value="Mechanical">Mechanical</option>
					<option value="Civi">Civil</option>
					</select>
					
					</td>
					</tr>
										
					<tr>
						<td>E-Mail :</td>
						<td><input type="text" name="txtmail" size="20" onblur="EmailValidation()"/>
						</td>
					</tr>
					

					<tr>
						<td>Address :</td>
							<td><textarea rows="5" cols="17" name="txtadd"></textarea>
						</td>
					</tr>
									
					<tr>
						<td>Phone Number :</td>
						<td><input type="text" name="txtphno" size="20" onblur="PhoneValidate()"/>
						</td>
					</tr>
					
					<tr>
						<td>Security Question :</td>
						<td><input type="text" name="txtsq" size="20"/>
						</td>
					</tr>
					
					<tr>
						<td>Security Answer :</td>
						<td><input type="text" name="txtsa" size="20"/>
						</td>
					</tr>																		

					<tr>
						<td align="center"><input type="submit" name="register" value="Add Professor" id="register"/>
						</td>

						<td align="center"><input type="button" value="Reset" name="register1" onclick="return setReset(this);"/>
						</td>
					</tr>
			
				</table>
				</form>
					
						
					
				</div>
			</div>
			
			</div></div>
		<div style="clear: both;">&nbsp;</div>
		</div>
					
	</div>
	</div>
	</div>
	</div>
</body>
</html>