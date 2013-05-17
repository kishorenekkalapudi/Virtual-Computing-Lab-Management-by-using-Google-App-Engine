package org.sjsu.lab;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.http.*;

import org.google.cloud.sql.DataAccessLayer;
import org.google.cloud.sql.JavaSSLMail;
import com.google.appengine.api.rdbms.*;
import com.google.cloud.sql.jdbc.Connection;
import com.google.cloud.sql.jdbc.PreparedStatement;
import com.google.cloud.sql.jdbc.ResultSet;

@SuppressWarnings("serial")
public class VirtualLabServlet extends HttpServlet {
	Connection c = null;
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	  throws IOException 
	  {	
		DataAccessLayer dal=new DataAccessLayer();
		JavaSSLMail SSL=new JavaSSLMail();
		String btn=req.getParameter("register");
		
		
		
		
		/*
		 * Delete Lab
		 */
		
		
		
		if(btn.equals("Delete Lab"))
		{			
			try
			{
				String LabId=req.getParameter("droplab");
				String Query1="DELETE FROM SystemDetails WHERE LabId='"+LabId+"'";
				String Query2="DELETE FROM LabsDetails WHERE LabId='"+LabId+"'";
				String Query="DELETE FROM MonitorStudent WHERE LabId='"+LabId+"'";
				String Query0="DELETE FROM ResourceRequests WHERE LabId='"+LabId+"'";
				
				
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				
				
				DriverManager.registerDriver(new AppEngineDriver());
				PreparedStatement stmt0=c.prepareStatement(Query0);
    			stmt0.executeUpdate();
				
				
				DriverManager.registerDriver(new AppEngineDriver());
				PreparedStatement stmt5=c.prepareStatement(Query);
    			stmt5.executeUpdate();
				
				DriverManager.registerDriver(new AppEngineDriver());
    			    			
    			PreparedStatement stmt=c.prepareStatement(Query1);
    			int Status=stmt.executeUpdate();
    			
    			DriverManager.registerDriver(new AppEngineDriver());
    			PreparedStatement stmt1=c.prepareStatement(Query2);
    			int Status1=stmt1.executeUpdate();
    			
    			if(Status1==1)
    			{
    				PrintWriter out=resp.getWriter();
    				out.print("<script>");
    				out.print("alert('Lab Deleted Successfully')");
    				out.print("</script>");
    				resp.setHeader("Refresh","0; url=/Professor/ProfessorDeleteLab.jsp");
    		
    			}
    			
    			else
    			{
    				PrintWriter out=resp.getWriter();
    				out.print("<script>");
    				out.print("alert('Problem Occured')");
    				out.print("</script>");
    				resp.setHeader("Refresh","0; url=/Professor/ProfessorDeleteLab.jsp");
    			}   			    			
				
			}
			
			catch(Exception e)
			{
				resp.setHeader("Refresh","0; url=/Professor/ProfessorError.jsp?Problem="+e.getMessage());
			}
		}
		
		
		
		
		
		
		
		/*
		 * User Change Password   
		 */
		
		if(btn.equals("Change Password"))
		{
			
			try
			{
				PrintWriter out=resp.getWriter();
				String oldpwd=req.getParameter("txtoldpwd");
				String newpwd=req.getParameter("txtnewpwd");
				HttpSession session=req.getSession();
				String StudentId=(String)session.getAttribute("StudentId");
					
				
			ResultSet rs=dal.GetStudentDetailsByStudentId(StudentId);
			if(rs.next())
				{
								
					String ActualPassword=rs.getString(5);
					if(oldpwd.equals(ActualPassword))
					{
						DriverManager.registerDriver(new AppEngineDriver());
		    			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
		    			String Query="UPDATE StudentDetails SET Password='"+newpwd+"'WHERE StudentId='"+StudentId+"'";
		    			PreparedStatement stmt=c.prepareStatement(Query);
		    			int Status=stmt.executeUpdate();
		    			if(Status==1)
		    			{
		    				
		    				out.print("<script>");
		    				out.print("alert('Your Password Changed Successfully')");
		    				out.print("</script>");
		    				resp.setHeader("Refresh","0; url=/User/UserHome.jsp");
		    			}
		    			else
		    			{
		    				//PrintWriter out=resp.getWriter();
		    				out.print("<script>");
		    				out.print("alert('You Entered Wrong Password')");
		    				out.print("</script>");
		    				resp.setHeader("Refresh","0; url=/User/UserChangePassword.jsp");
		    			}
					}
				}
			}
			catch(Exception e)
			{
				resp.setHeader("Refresh","0; url=/User/UserProblem.jsp?Problem="+e.getMessage());
			}
		}
		
		
		/*
		 * Recover Password
		 */
		
		if(btn.equals("Recover"))
		{
		String Role=req.getParameter("role");
		String Email=req.getParameter("txtemail");
		
		try
		{
			
		
		DriverManager.registerDriver(new AppEngineDriver());
		c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		if(Role.equals("student"))
		{
			String StudentDetails="SELECT * FROM StudentDetails WHERE EMail='"+Email+"'";
			ps=c.prepareStatement(StudentDetails);
			rs=ps.executeQuery();
			if(rs.next())
			{
				String FirstName=rs.getString(2);
				String LastName=rs.getString(3);
				String UserName=rs.getString(4);
				String Password=rs.getString(5);
				
				String Status=SSL.SendMessage(Email, "Reg: Your Request of Password Recovery", " Hello "+FirstName+", "+LastName+"\n We Have Recovered Your Password Successfully \n Your Login Details Are \n User Name  : "+UserName+"\n Password :"+Password+"\n\n\n Thanks And Regards \n Virtual Lab Team");
				
				if(Status.equals("1"))
				{
					PrintWriter out=resp.getWriter();
					out.print("<script>");
					out.print("alert('Your Password Has Been Mailed !! Please Check your Mail')");
					out.print("</script>");
					resp.setHeader("Refresh","0; url=/Login.jsp");
				}
				
			}
			//if No Email Like That
			else
			{
				resp.setHeader("Refresh","0; url=/UnKnownIssues.jsp?Problem=Email Address You Are Entered Not Registered With Us. Please Make sure that you have entered correct one and try again");
			}
		}
		
		if(Role.equals("professor"))
		{
			String ProfessorDetails="SELECT * FROM ProfessorDetails WHERE EMail='"+Email+"'";
			ps=c.prepareStatement(ProfessorDetails);
			rs=ps.executeQuery();
			if(rs.next())
			{
				String FirstName=rs.getString(2);
				String LastName=rs.getString(3);
				String UserName=rs.getString(4);
				String Password=rs.getString(5);
				
				String Status=SSL.SendMessage(Email, "Reg: Your Request of Password Recovery", " Hello "+FirstName+", "+LastName+"\n We Have Recovered Your Password Successfully \n Your Login Details Are \n User Name  : "+UserName+"\n Password :"+Password+"\n\n\n Thanks And Regards \n Virtual Lab Team");
				if(Status.equals("1"))
				{
					PrintWriter out=resp.getWriter();
					out.print("<script>");
					out.print("alert('Your Password Has Been Mailed !! Please Check your Mail')");
					out.print("</script>");
					resp.setHeader("Refresh","0; url=/Login.jsp");
				}				
			}
			else
			{
				resp.setHeader("Refresh","0; url=/UnKnownIssues.jsp?Problem=Email Address You Are Entered Not Registered With Us. Please Make sure that you have entered correct one and try again");
			}
		}
		}//End Try
		
		catch(Exception e)
		{
			resp.setHeader("Refresh","0; url=/UnKnownIssues.jsp?Problem="+e.getMessage());
		}
		
		}
		
		
		
		
		/*
		 * Grant Students Requests
		 * 
		 * 1.) Update SystemDetails With Ram Hdd Cpu By SystemId
		 * 2.) Change Status Of ResourceRequest to 1
		 */
		
		
		if(btn.equals("Grant"))
		{
			int Status=0;
			String StudId=req.getParameter("txtstudentid");
        	String StudentName=req.getParameter("txtstudentname");        	
        	String LabName=req.getParameter("txtlab");
        	String SystemId=req.getParameter("txtsystemnumber");        	
        	String RequestId=req.getParameter("txtrequestid");
        	String DateofReq=req.getParameter("txtdateofrequest");
        	String Ram=req.getParameter("txtram");
        	String Hdd=req.getParameter("txtharddisk");
        	String cpu=req.getParameter("txtcpu");
        	PrintWriter out1=resp.getWriter();
        	        	
        	try
        	{
	        		
        		ResultSet resou=dal.getRamCpuHdd(SystemId);
        		
        		if(resou.next())
        		{
        		
        		if(Ram.equals("null"))
            	{
            		Ram=resou.getString(3);
            		
            	}
            	
            	if(Hdd.equals("null"))
            	{
            		Hdd=resou.getString(4);
            		
            	}
            	
            	if(cpu.equals("null"))
            	{
            		cpu=resou.getString(5);
            		
            	}
            	
            	
        		}
    			//Updating Resources
    			DriverManager.registerDriver(new AppEngineDriver());
    			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
    			String Query="UPDATE SystemDetails SET RAM='"+Ram+"',HardDisk='"+Hdd+"',CPU='"+cpu+"' WHERE SystemId='"+SystemId+"'";
    			PreparedStatement stmt=c.prepareStatement(Query);
    			Status=stmt.executeUpdate();
    			if(Status==1)
    			{
    				//Set 1 in RequestResources
    				String Query2="UPDATE ResourceRequests SET Status='1' WHERE RequestId='"+RequestId+"'";
        			PreparedStatement stmt2=c.prepareStatement(Query2);
        			Status=stmt2.executeUpdate();
        			if(Status==1)
        			{
        				HttpSession session=req.getSession();
        				String ProfessorId=(String)session.getAttribute("ProfId");
        				
        				ResultSet prof=dal.GetProfessorDetailsByProfessorId(ProfessorId);
        				prof.next();
        				
        				ResultSet stud=dal.GetStudentDetailsByStudentId(StudId);
        				stud.next();
        				
        				String ProfessorFirstName=prof.getString(2);
        				String ProfessorLastName=prof.getString(3);
        				
        				String FirstName=stud.getString(2);
        				String LastName=stud.getString(3);
        				String EMail=stud.getString(8);
        				
        				SSL.SendMessage(EMail, "Reg : Your Virtual Lab Resource Request Approval", " Hello "+FirstName+","+LastName+". \n Prof."+ProfessorFirstName +","+ProfessorLastName+". Had reviewed your request and Granted your Resources for "+LabName+","+SystemId+ " Number System  \n Now You Can Use the Resources. \n\n\n Thanks And Regards \n Virtual Lab Team");
        				
        				PrintWriter out=resp.getWriter();
        				out.print("<script>");
        				out.print("alert('Resources Allocated Successfully')");
        				out.print("</script>");
        				resp.setHeader("Refresh","0; url=/Professor/ProfessorResourceRequests.jsp");
        			}
    								
    			}
    		}
    		
        	catch(Exception e)
    		{
    			resp.setHeader("Refresh","0; url=/Professor/ProfessorError.jsp?Problem="+e.getMessage());
    		}        	
		}
		
		
		
		
		
		
		
		
		
		
		/*
		 * Deny Students Requests
		 * 
		 * 
		 * 2.) Change Status Of ResourceRequest to 1
		 */
		if(btn.equals("Deny"))
		{
			
			String StudId=req.getParameter("txtstudentid");
        	String StudentName=req.getParameter("txtstudentname");
        	String LabName=req.getParameter("txtlab");
        	String SystemId=req.getParameter("txtsystemnumber");        	
        	String RequestId=req.getParameter("txtrequestid");        	        	        	
			
			int Status=0;
			
			try
        	{       		
    				//Set 1 in RequestResources
    				String Query2="UPDATE ResourceRequests SET Status='2' WHERE RequestId='"+RequestId+"'";
        			PreparedStatement stmt2=c.prepareStatement(Query2);
        			Status=stmt2.executeUpdate();
        			if(Status==1)
        			{
        				HttpSession session=req.getSession();
        				String ProfessorId=(String)session.getAttribute("ProfId");
        				
        				ResultSet prof=dal.GetProfessorDetailsByProfessorId(ProfessorId);
        				prof.next();
        				
        				ResultSet stud=dal.GetStudentDetailsByStudentId(StudId);
        				stud.next();
        				
        				String ProfessorFirstName=prof.getString(2);
        				String ProfessorLastName=prof.getString(3);
        				
        				String FirstName=stud.getString(2);
        				String LastName=stud.getString(3);
        				String EMail=stud.getString(8);
        				
        				SSL.SendMessage(EMail, "Reg : Your Virtual Lab Resource Request Denial", " Hello "+FirstName+","+LastName+". \n Prof."+ProfessorFirstName +","+ProfessorLastName+". Had reviewed your request and Denied your Request for "+LabName+","+SystemId+ " Number System  \n You Can Contact The Professor for further information. \n\n\n Thanks And Regards \n Virtual Lab");
        				
        				
        				PrintWriter out=resp.getWriter();
        				out.print("<script>");
        				out.print("alert('Resources Request Canceled')");
        				out.print("</script>");
        				resp.setHeader("Refresh","0; url=/Professor/ProfessorResourceRequests.jsp");
        			}    								
    		
    		}
    		
        	catch(Exception e)
    		{
    			resp.setHeader("Refresh","0; url=/Professor/ProfessorError.jsp?Problem="+e.getMessage());
    		}        	
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
	
		/*
		 * Request More Resources
		 */
		if(btn.equals("Request"))
		{
			HttpSession session=req.getSession(true);
			String StudentId=(String)session.getAttribute("StudentId");
			String ProfessorId=req.getParameter("dropprofessor");
			session.setAttribute("ProfessorId", ProfessorId);
			String date=dal.GetDate();
			String LabName=(String)session.getAttribute("LabName");
			String LabId=dal.getLabIdByLabName(LabName);
			String SystemId=(String)session.getAttribute("SystemId");
			String ram=req.getParameter("txtram");
			if(ram.equals(""))
			{
				ram=null;
			}
			String hdd=req.getParameter("txthdd");
			if(hdd.equals(""))
			{
				hdd=null;
			}
			String cpu=req.getParameter("txtprocessor");
			if(cpu.equals(""))
			{
				cpu=null;
			}
			
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());      	      
			      
				String statement ="INSERT INTO ResourceRequests(StudentId,ProfessorId,DateOfRequest,labId,SystemId,RAM,HardDisk,CPU,Status) VALUES(?,?,?,?,?,?,?,?,?)";
      
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				PreparedStatement stmt = c.prepareStatement(statement);
				
				stmt.setString(1, StudentId);
				stmt.setString(2, ProfessorId);
				stmt.setString(3, date);
				stmt.setString(4, LabId);
				stmt.setString(5, SystemId);
				stmt.setString(6, ram);
				stmt.setString(7, hdd);
				stmt.setString(8, cpu);
				stmt.setString(9, "0");
      
				int status= 0;
				status= stmt.executeUpdate();
					if(status== 1) 
					{
						resp.setHeader("Refresh","0; url=/User/ResourcesRequestSuccess.jsp");
					}					
			}	     

			catch (Exception e) 
			{
				resp.setHeader("Refresh","0; url=/User/UserProblem.jsp?Problem="+e.getMessage());
			} 
			
}// Request Completed
		
		
		/*
		 * Change System Reserve Status
		 */
		
		if(btn.equals("Use System"))
		{
			// Transfer LabName And System Id To UserSystemRunning.jsp
			// Change Availabilty In SystemDetails to 0
			// Add a Record in MonitorStudent Table
			String LabName=req.getParameter("hiddenlabname");
			String SystemId=req.getParameter("userSystem");
			
			
			//Storing LabName And System Id In Session
			HttpSession session = req.getSession(true);
			 session.setAttribute("LabName", LabName);
			 session.setAttribute("SystemId", SystemId);

			resp.setHeader("Refresh","0; url=/User/UserSystemRunning.jsp");
			
			
			//Test
			
		}
		
		
		
		/*
		 * Enable Student To Login
		 */
		
		if(btn.equals("Enable"))
		{
			int Status=0;
			String StudentId=req.getParameter("dropstatus");
			try
			{
			DriverManager.registerDriver(new AppEngineDriver());
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="UPDATE StudentDetails SET Status='1' WHERE StudentId='"+StudentId+"'";
			PreparedStatement stmt=c.prepareStatement(Query);
			Status=stmt.executeUpdate();
			if(Status==1)
			{
				ResultSet mail=dal.GetStudentDetailsByStudentId(StudentId);
				mail.next();
				String FirstName=mail.getString(2);
				String LastName=mail.getString(3);
				String UserName=mail.getString(4);
				String Password=mail.getString(5);
				String EMail=mail.getString(8);
				
				HttpSession session=req.getSession();
				String ProfessorId=(String)session.getAttribute("ProfId");
				ResultSet prof=dal.GetProfessorDetailsByProfessorId(ProfessorId);
				prof.next();
				String ProfessorFirstName=prof.getString(2);
				String ProfessorLastName=prof.getString(3);
				
				SSL.SendMessage(EMail, "Reg : Virtual Lab Activation Information", " Hello "+FirstName+","+LastName+". \n Thank you for Registering With Virtual Lab. \n Your Account Information \n UserName : "+UserName+"\n Password : "+Password+"\n \n Your Account Has been Activated Successfully By Prof."+ProfessorFirstName +","+ProfessorLastName+".  \n Now You Can Login with your User Name And Password. \n\n\n Thanks And Regards \n Virtual Lab Team");
				resp.setHeader("Refresh","0; url=/Professor/ProfessorStudentStatusSuccess.jsp");				
			}
			}
			catch(Exception e)
			{
				resp.setHeader("Refresh","0; url=/Professor/ProfessorError.jsp?Problem="+e.getMessage());
			}					
		}
		
		
		
		
		
		//Add System Configuration
		if(btn.equals("Add Systems"))
		{
			boolean b=true;
			int Status=0;
			String LabId=req.getParameter("droplabs");
			String Ram=req.getParameter("txtram");
			String Hdd=req.getParameter("txthdd");
			String Cpu=req.getParameter("txtprocessor");
			try
			{				
					
				//Getting Number Of Systems
					int NoOfSystems=0;														
					
					DriverManager.registerDriver(new AppEngineDriver());     	      
					
					String statement1 ="SELECT * FROM LabsDetails Where LabId='"+LabId+"'";

					c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				
					PreparedStatement stmt1 = c.prepareStatement(statement1);
				
					ResultSet rs1=stmt1.executeQuery();
				
					b=rs1.next();
					NoOfSystems=Integer.parseInt(rs1.getString(3));

					
					//Insert Systems
					
					for(int i=0;i<NoOfSystems;i++)
					{
					
					DriverManager.registerDriver(new AppEngineDriver());      	      
					
				     
					String statement ="INSERT INTO SystemDetails(LabId,RAM,HardDisk,CPU,Available) VALUES(?,?,?,?,?)";
	      
					c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
					PreparedStatement stmt = c.prepareStatement(statement);
					stmt.setString(1, LabId);
					stmt.setString(2, Ram);
					stmt.setString(3, Hdd);
					stmt.setString(4, Cpu);
					stmt.setString(5, "1");
				
		
					Status= stmt.executeUpdate();
					}
					
					if(Status==1)
					{
						resp.setHeader("Refresh","0; url=/Professor/ProfessorCreateLabSuccess.html");
					}
						
				}	     

				catch (Exception e) 
				{
					resp.setHeader("Refresh","0; url=/Professor/ProfessorError.jsp?Problem="+e.getMessage()+b);	
				}															
			}
				
		
		
		
		
		//Add Labs
		if(btn.equals("Create"))
		{
			int Status=0;
			String name=req.getParameter("txtlabname");
			String Systems=req.getParameter("txtnoofmechines");
			try
			{
				Status=dal.AddLab(name, Systems);
				if(Status==1)
				{
					resp.setHeader("Refresh","0; url=/Professor/ProfessorCreateLabSuccess.html");
				}
			}
			catch(Exception er)
			{
				resp.setHeader("Refresh","0; url=/Professor/ProfessorError.jsp?Problem="+er.getMessage());
			}
			
		}
		
		
		
		
		
		
		//Register User
		if(btn.equals("Register"))
		{
		
			PrintWriter out = resp.getWriter();			
				try 
				{
					DriverManager.registerDriver(new AppEngineDriver());      	      
					
					String fn=req.getParameter("txtfn");
					String ln=req.getParameter("txtln");
					String un=req.getParameter("txtun");
					String pw=req.getParameter("txtpw");
					String dob=req.getParameter("txtdob");
					String gen=req.getParameter("gender");
					String mail=req.getParameter("txtmail");
					String add=req.getParameter("txtadd");
					String phno=req.getParameter("txtphno");
					String sq=req.getParameter("txtsq");
					String sa=req.getParameter("txtsa");
	      
					String statement ="INSERT INTO StudentDetails(FirstName ,LastName ,UserName ,Password ,DateOfBirth,Gender,EMail ,Address ,PhoneNumber ,SecurityQuestion ,SecurityAnswer,Status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
	      
					c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
					PreparedStatement stmt = c.prepareStatement(statement);
					
					stmt.setString(1, fn);
					stmt.setString(2, ln);
					stmt.setString(3, un);
					stmt.setString(4, pw);
					stmt.setString(5, dob);
					stmt.setString(6, gen);
					stmt.setString(7, mail);
					stmt.setString(8, add);
					stmt.setString(9, phno);
					stmt.setString(10, sq);
					stmt.setString(11, sa);
					stmt.setString(12, "0");
	      
					int status= 0;
					status= stmt.executeUpdate();
						if(status== 1) 
						{
							String s=SSL.SendMessage(mail, "Reg : Virtual Lab Registration Conformation ", " Hello "+fn+","+ln+". \n Thank you for Registering With Virtual Lab. \n Your Account Information \n UserName : "+un+"\n Password : "+pw+"\n \n Althought Your Account Successfully Created it require that considered professor need to approve it. \n You will get an Account Activation Mail when ever professor responds to your Request. \n\n\n Thanks And Regards \n Virtual Lab");
							
							resp.setHeader("Refresh","0; url=/Success.html");
							
							
						} 
						
						else 
							if (status== 0) 
							{
								resp.setHeader("Refresh","0; url=/Fail.html");
							}
				}	     
	
				catch (Exception e) 
				{
					e.printStackTrace();
				} 
				
				finally 
				{
					if (c != null) 
						try 
						{
							c.close();
						} 
						catch (SQLException ignore) 
						{
						}
				}
		} // Register Completed
		
		
		
		
		
		//Add Professor
		
		if(btn.equals("Add Professor"))
		{
								
				try 
				{
					DriverManager.registerDriver(new AppEngineDriver());      	      
					
					String fn=req.getParameter("txtfn");
					String ln=req.getParameter("txtln");
					String un=req.getParameter("txtun");
					String pw=req.getParameter("txtpw");
					String dob=req.getParameter("txtdob");
					String gen=req.getParameter("gender");
					String dept=req.getParameter("department");
					String mail=req.getParameter("txtmail");
					String add=req.getParameter("txtadd");
					String phno=req.getParameter("txtphno");
					String sq=req.getParameter("txtsq");
					String sa=req.getParameter("txtsa");
	      
					String statement ="INSERT INTO ProfessorDetails(FirstName ,LastName ,UserName ,Password ,DateOfBirth,Gender,Department,EMail ,Address ,PhoneNumber ,SecurityQuestion ,SecurityAnswer,Status) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	      
					c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
					PreparedStatement stmt = c.prepareStatement(statement);
					
					stmt.setString(1, fn);
					stmt.setString(2, ln);
					stmt.setString(3, un);
					stmt.setString(4, pw);
					stmt.setString(5, dob);
					stmt.setString(6, gen);
					stmt.setString(7, dept);
					stmt.setString(8, mail);
					stmt.setString(9, add);
					stmt.setString(10, phno);
					stmt.setString(11, sq);
					stmt.setString(12, sa);
					stmt.setString(13, "1");
					
					int status= 0;
					status= stmt.executeUpdate();
						if(status== 1) 
						{
							resp.setHeader("Refresh","0; url=/Admin/RegisterProfessorSuccess.html");
						} 
						
						else 
							if (status== 0) 
							{
								resp.setHeader("Refresh","0; url=/Admin/RegisterProfessorFail.html");
							}
				}	     
	
				catch (Exception e) 
				{
					String Problem=e.getMessage();
					resp.setHeader("Refresh","0; url=/UnKnownIssues.jsp?Problem="+Problem);
				} 
				
				finally 
				{
					if (c != null) 
						try 
						{
							c.close();
						} 
						catch (SQLException ignore) 
						{
						}
				}
		} // Register Completed
		
		
		
		
		
		
		
		//Login User
		
		if(btn.equals("Login"))
		{
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());      	      
				
				String un=req.getParameter("txtun");
				String pw=req.getParameter("txtpw");
				String role=req.getParameter("role");
				
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				
				
				
				//Role Selecting----------Student
				if(role.equals("student"))
				{
					String statement ="SELECT * FROM StudentDetails WHERE UserName='"+un+"' AND Password='"+pw+"'";
			      
				
					PreparedStatement stmt = c.prepareStatement(statement);
					ResultSet rs=stmt.executeQuery();
				
						if(rs.next())
						{
							//	Getting Status
							String Status=rs.getString(13);
								if(Status.equals("1"))
								{
									String StudentId=rs.getString(1);
									HttpSession session = req.getSession(true);
									 session.setAttribute("StudentId", StudentId);
									
									 resp.setHeader("Refresh","0; url=/User/UserHome.jsp");
									
								}
								else
								{
									resp.setHeader("Refresh","0; url=/Success.html");
								}
						}
				
						else
						{
							resp.setHeader("Refresh","0; url=/LoginFail.html");
						}
				}   //-----------End Student
				
				
				
				
				
				//Role Admin
				if(role.equals("admin"))
				{
					String statement ="SELECT * FROM Admin WHERE UserName='"+un+"' AND Password='"+pw+"'";
				      
					PreparedStatement ps=c.prepareStatement(statement);					
					ResultSet rs=ps.executeQuery();
				
						if(rs.next())
						{
							resp.setHeader("Refresh","0; url=/Admin/AdminHome.jsp");
						}																			
				
						else
						{
							resp.setHeader("Refresh","0; url=/LoginFail.html");
						}										
						
				}//---------- Admin Login Completed
				
				
				
				
				
				
				
				//Role Professor
				if(role.equals("professor"))
				{
					String statement ="SELECT * FROM ProfessorDetails WHERE UserName='"+un+"' AND Password='"+pw+"'";
				      
					PreparedStatement ps=c.prepareStatement(statement);					
					ResultSet rs=ps.executeQuery();
				
						if(rs.next())
						{
							String ProfessorId=rs.getString(1);
							HttpSession session = req.getSession(true);
							session.setAttribute("ProfId", ProfessorId);
		
		
							resp.setHeader("Refresh","0; url=/Professor/ProfessorHome.jsp");
						}
				
						else
						{
							resp.setHeader("Refresh","0; url=/LoginFail.html");
						}
				}//------------- Professor Login Completed												
				
				
			}//------- Try Competed
			

			catch (Exception e) 
			{
				String Problem=e.getMessage();
				resp.setHeader("Refresh","0; url=/UnKnownIssues.jsp?Problem="+Problem);
			}				
		}
	  }
}