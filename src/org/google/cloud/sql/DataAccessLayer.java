package org.google.cloud.sql;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import com.google.appengine.api.rdbms.*;
import com.google.cloud.sql.jdbc.Connection;
import com.google.cloud.sql.jdbc.PreparedStatement;
import com.google.cloud.sql.jdbc.ResultSet;


public class DataAccessLayer {
	
	Connection c = null;
	
	public String GetFirstNameByUserName(String UserName) 
	{
	String FirstName=null;		
					
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());     	      
				
				String statement ="SELECT FirstName FROM StudentDetails WHERE UserName='"+UserName+"'";
      
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				
				PreparedStatement stmt = c.prepareStatement(statement);
				
				ResultSet rs=stmt.executeQuery();
				if(rs.next())
				{
				FirstName=rs.getString(1);
				
				}
				else
				{
					FirstName="";
				}
			}
			
			catch (Exception e) {
				FirstName="";
			}				

			return FirstName;	
	}
	
	
	/*
	 * Get All ProfessorDetails
	 */
	
	public ResultSet GetProfessorDetails()
	{		
		ResultSet rs=null;
		try 
		{
			DriverManager.registerDriver(new AppEngineDriver());     	      
			
			String statement ="SELECT * FROM ProfessorDetails";
  
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			
			PreparedStatement stmt = c.prepareStatement(statement);
			
			rs=stmt.executeQuery();
			
		}
		
		catch (Exception e) {
			
		}				

		return rs;
	}
	
	
	
	
	
	
	
	
	/*
	 * Get Student Details By StudentId
	 */
	
	public ResultSet GetStudentDetailsByStudentId(String StudentId)
	{		
		ResultSet rs=null;
		try 
		{
			DriverManager.registerDriver(new AppEngineDriver());     	      
			
			String statement ="SELECT * FROM StudentDetails WHERE StudentId='"+StudentId+"'";
  
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			
			PreparedStatement stmt = c.prepareStatement(statement);
			
			rs=stmt.executeQuery();
			
		}
		
		catch (Exception e) {
			
		}				

		return rs;
	}
	
	
	
	
	
	
	/*
	 * Get Professor Details By ProfessorId
	 */
	
	public ResultSet GetProfessorDetailsByProfessorId(String ProfessorId)
	{		
		ResultSet rs=null;
		try 
		{
			DriverManager.registerDriver(new AppEngineDriver());     	      
			
			String statement ="SELECT * FROM ProfessorDetails WHERE ProfessorId='"+ProfessorId+"'";
  
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			
			PreparedStatement stmt = c.prepareStatement(statement);
			
			rs=stmt.executeQuery();
			
		}
		
		catch (Exception e) {
			
		}				

		return rs;
	}
	
	

	
	
	
	
	
	
	
	
	
	/*
	 * Get System Usages By Students
	 */
	
	public ResultSet getStudentsSystemUsage()
	{		
		ResultSet rs=null;
		try 
		{
			DriverManager.registerDriver(new AppEngineDriver());     	      
			
			String statement ="Select s.FirstName,l.LabName,s1.SystemId,r.DateUse,r.StartTime,r.EndTime FROM MonitorStudent r INNER JOIN StudentDetails s ON r.StudentId=s.StudentId INNER JOIN LabsDetails l ON r.LabId=l.LabId INNER JOIN SystemDetails s1 ON r.SystemId=s1.SystemId";
  
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			
			PreparedStatement stmt = c.prepareStatement(statement);
			
			rs=stmt.executeQuery();
			
		}
		
		catch (Exception e) {
			
		}				

		return rs;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * Get All Labs
	 */
	
	public ResultSet GetLabs()
	{		
		ResultSet rs=null;
		try 
		{
			DriverManager.registerDriver(new AppEngineDriver());     	      
			
			String statement ="SELECT * FROM LabsDetails";
  
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			
			PreparedStatement stmt = c.prepareStatement(statement);
			
			rs=stmt.executeQuery();
			
		}
		
		catch (Exception e) {
			
		}				

		return rs;
	}

	
	
	
	
	
	
	/*
	 * Add Labs
	 */
	
	public int AddLab(String LabName,String NoOfSystems)
	{
	
		int status= 0;
						
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());      	      
				
     
				String statement ="INSERT INTO LabsDetails(LabName,NumberOfSystems) VALUES(?,?)";
      
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				PreparedStatement stmt = c.prepareStatement(statement);
				
				stmt.setString(1, LabName);
				stmt.setString(2, NoOfSystems);
				
				status= stmt.executeUpdate();
					
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
			return status;
	} // Register Completed
	
	
	
	
	
	
	
	
	/*
	 * Change Availability 0 in SystemDetails Table So that System Knows that it reserved
	 */
	
	public int ChangeAvailabilityToZeroInSystemDetails(String LabId,String SystemId)
	{
	
		int status= 0;
						
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());      	      
				
     
				String statement ="UPDATE SystemDetails SET Available='0' WHERE SystemId='"+SystemId+"' AND LabId='"+LabId+"'";
      
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				PreparedStatement stmt = c.prepareStatement(statement);
				
				
				status= stmt.executeUpdate();
					
			}	     

			catch (Exception e) 
			{
				status=0;
			}
			
			
			return status;
	} // Change Status Completed
	
	
	
	
	
	
	
	
	
	
	/*
	 * Change Availability 1 in SystemDetails Table So that System Knows that it Available ( Used In Logout )
	 */
	
	public int ChangeAvailabilityToOneInSystemDetails(String SystemId)
	{
	
		int status= 0;
						
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());      	      
				
     
				String statement ="UPDATE SystemDetails SET Available='1' WHERE SystemId='"+SystemId+"'";
      
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				PreparedStatement stmt = c.prepareStatement(statement);
				
				
				status= stmt.executeUpdate();
					
			}	     

			catch (Exception e) 
			{
				status=0;
			}
			
			
			return status;
	} // Change Status Completed
	
	
	
	
	
	
	/*
	 * View System Configuration That Student Using
	 */
	
	public ResultSet getSystemConfiguration(String SystemId)
	{
			ResultSet rs=null;
			boolean b=false;
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());     	      
				
				String statement ="SELECT l.LabName,s.SystemId,s.RAM,s.HardDisk,s.CPU FROM LabsDetails l INNER JOIN SystemDetails s ON l.LabId=s.LabId WHERE s.SystemId='"+SystemId+"'";
	  
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				
				PreparedStatement stmt = c.prepareStatement(statement);
				
				rs=stmt.executeQuery();
				b=rs.next();
			}
			catch(Exception e)
			{
			}
			
			return rs;
}
		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * Record Logout Time In MonitorStudent Table
	 */
	
	public int RecordLogoutTime(String SystemId,String EndTime)
	{
	
		int status= 0;
						
			try 
			{
				DriverManager.registerDriver(new AppEngineDriver());      	      
				
     
				String statement ="UPDATE MonitorStudent SET EndTime='"+EndTime+"' WHERE SystemId='"+SystemId+"' AND EndTime IS NULL";
      
				c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
				PreparedStatement stmt = c.prepareStatement(statement);
				
				
				status= stmt.executeUpdate();
					
			}	     

			catch (Exception e) 
			{
				status=0;
			}
			
			
			return status;
	} // Change Status Completed

	
	

	
	
	
	
	
	
	

	
	
	
	/*
	 * Get Present date
	 */
	public String GetDate()
	{
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Calendar cal = Calendar.getInstance();
		String Date1=dateFormat.format(cal.getTime());
		return Date1;
	}
	
	
	
	/*
	 * Get Present Time
	 */
	public String GetPresentTime()
	{
		DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
		Calendar cal = Calendar.getInstance();
		String Time1=dateFormat.format(cal.getTime());
		return Time1;
	}
	
	
	
	/*
	 * Monitor Student By Storing Data in MonitorStudent
	 */
	
	public int MonitorStudent(String StudentId,String LabId,String SystemId,String DateUse,String StartTime)
	{
		int Status=0;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());      	      
						
			String statement ="INSERT INTO MonitorStudent(StudentId ,LabId,SystemId,DateUse,StartTime) VALUES(?,?,?,?,?)";
  
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			PreparedStatement stmt = c.prepareStatement(statement);
			
			stmt.setString(1, StudentId);
			stmt.setString(2, LabId);
			stmt.setString(3, SystemId);
			stmt.setString(4, DateUse);
			stmt.setString(5, StartTime);
			
			Status= stmt.executeUpdate();
			
			}
		catch(Exception e)
		{
			Status=0;
		}
		return Status;
		
	}
	
	
	
	
	
	
	
	
	
		
	/*
	 * Find Number Of Systems By LabId
	 */
	
	public int GetNumberOfSystemsByLabId(String LabId)
	{
	int NoOfSystems=0;
	try
	{
		DriverManager.registerDriver(new AppEngineDriver());     	      
	
		String statement ="SELECT NumberOfSystems FROM LabsDetails Where LabId='"+LabId+"'";

	c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
	
	PreparedStatement stmt = c.prepareStatement(statement);
	
	ResultSet rs=stmt.executeQuery();

	NoOfSystems=(rs.getInt(1));
	}
	catch(Exception e)
	{
	}
	
	return NoOfSystems;
	}		
	
	
	
	//Disabled Students Account
	public ResultSet getStudentsWhoseStatusIsZero()
	{
		ResultSet rs=null;
		try
		{
		DriverManager.registerDriver(new AppEngineDriver());
		c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
		String Query="SELECT * FROM StudentDetails WHERE Status='0'";
		PreparedStatement stmt=c.prepareStatement(Query);
		rs=stmt.executeQuery();
		}
		catch(Exception e)
		{
			
		}
		return rs;
	}
	
	
	
	/*
	 * Get Lab Name By LabId
	 */
	
	public String getLabNameByLabId(String LabId)
	{
		String LabName=null;
		boolean b=true;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT * FROM LabsDetails WHERE LabId='"+LabId+"'";
			PreparedStatement ps=c.prepareStatement(Query);
			ResultSet rs=ps.executeQuery();
			b=rs.next();
			LabName=rs.getString(2);
		}
		catch(Exception e)
		{
			LabName=e.getMessage()+b;
		}
		return LabName;
	}
	
	
	
	
	/*
	 * Get Lab Id By Lab Name
	 */
	
	public String getLabIdByLabName(String LabName)
	{
		String LabId=null;
		boolean b=true;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT * FROM LabsDetails WHERE LabName='"+LabName+"'";
			PreparedStatement ps=c.prepareStatement(Query);
			ResultSet rs=ps.executeQuery();
			b=rs.next();
			LabId=rs.getString(1);
		}
		catch(Exception e)
		{
			LabId=e.getMessage()+b;
		}
		return LabId;
	}
	
	
	
	
	
	
	/*
	 * Get Student Name By StudentId
	 */
	public String getStudentNameById(String StudentId)
	{
		String StudentName=null;
		boolean b=true;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT * FROM StudentDetails WHERE StudentId='"+StudentId+"'";
			PreparedStatement ps=c.prepareStatement(Query);
			ResultSet rs=ps.executeQuery();
			b=rs.next();
			StudentName=rs.getString(2);
		}
		catch(Exception e)
		{
			StudentName=e.getMessage()+b;
		}
		return StudentName;
	}//Completed
	
	
	
	
	
	
	/*
	 * Get Professor Name By ProfessorId
	 */
	public String getProfessorNameById(String ProfessorId)
	{
		String ProfessorName=null;
		boolean b=true;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT * FROM ProfessorDetails WHERE ProfessorId='"+ProfessorId+"'";
			PreparedStatement ps=c.prepareStatement(Query);
			ResultSet rs=ps.executeQuery();
			b=rs.next();
			ProfessorName=rs.getString(2);
		}
		catch(Exception e)
		{
			ProfessorName=e.getMessage()+b;
		}
		return ProfessorName;
	}
	
	
	
	/*
	 * Get RAM CPU HDD Values
	 */
	public ResultSet getRamCpuHdd(String SystemId)
	{
		ResultSet rs=null;
		boolean b=true;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			
			
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT * FROM SystemDetails WHERE SystemId='"+SystemId+"'";
			PreparedStatement ps=c.prepareStatement(Query);
			rs=ps.executeQuery();
			
			
		}
		catch(Exception e)
		{
			
		}
		return rs;
	}
	
	
	
	
	
	/*
	 * Get The Names Of Resource Requested Students
	 */
	public ResultSet StudentsWhoRequestedResources(String ProfessorId)
	{
		ResultSet rs=null;
		boolean b=true;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			
			
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT s.StudentId,s.FirstName FROM StudentDetails s INNER JOIN ResourceRequests r ON s.StudentId=r.StudentId WHERE r.Status='0' AND r.ProfessorId='"+ProfessorId+"'";
			PreparedStatement ps=c.prepareStatement(Query);
			rs=ps.executeQuery();
		}
		catch(Exception e)
		{
			
		}
		return rs;
	}
	
	
	
	
	
	
	/*
	 * Get The Resource Details
	 */
	public ResultSet getRequestedResources(String StudentId)
	{
		ResultSet rs=null;
		boolean b=true;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT s.StudentId,s.FirstName,r.RequestId,l.LabName,r.SystemId,r.DateOfRequest,r.RAM,r.HardDisk,r.CPU FROM StudentDetails s INNER JOIN ResourceRequests r ON s.StudentId=r.StudentId INNER JOIN LabsDetails l ON r.LabId=l.LabId WHERE s.StudentId='"+StudentId+"' AND r.Status='0'";
			PreparedStatement ps=c.prepareStatement(Query);
			rs=ps.executeQuery();
			b=rs.next();
			
		}
		catch(Exception e)
		{
			
		}
		return rs;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * Get Systems By LabId
	 */
	
	public ResultSet getSystemsByLabId(String LabId)
	{
		ResultSet rs=null;
		try
		{
			DriverManager.registerDriver(new AppEngineDriver());
			c = (Connection) DriverManager.getConnection("jdbc:google:rdbms://sjsucloud9:vlab/VirtualLab","rajeev","sanjose");
			String Query="SELECT * FROM SystemDetails WHERE LabId='"+LabId+"' AND Available='1'";
			PreparedStatement ps=c.prepareStatement(Query);
			rs=ps.executeQuery();			
		}
		catch(Exception e)
		{
			
		}
		return rs;
	}
	
}
