<%@page import="org.google.cloud.sql.DataAccessLayer"%>
<%
DataAccessLayer dal=new DataAccessLayer();
//Set System Available
String SystemId=(String)session.getAttribute("SystemId");
int SetAvailability=dal.ChangeAvailabilityToOneInSystemDetails(SystemId);

//Record Logout Time
String Time=dal.GetPresentTime();
int SetLogoutTime=dal.RecordLogoutTime(SystemId,Time);
session.invalidate();
response.setHeader("Refresh","0; url=../Login.jsp");
%>

