<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String movie=request.getParameter("movie");
String amount=request.getParameter("amount");
String slots=request.getParameter("slots");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/login", "root", "root");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into tickets(MOVIE,AMOUNT,SLOTS)values('"+movie+"','"+amount+"','"+slots+"')");
        out.println("<h1> Your bookings Are Successfull !"+" Movie : "+movie+" Amount : "+amount+" Slots : "+slots+"<br><button><a href=index.jsp><p>Go To Home</p></a></button>");
}
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>