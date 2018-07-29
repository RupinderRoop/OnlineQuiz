<%-- 
    Document   : addcat
    Created on : 18 Apr, 2018, 2:55:44 PM
    Author     : Rupinder
--%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%  try
    {
        String category=request.getParameter("category");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        PreparedStatement ps=con.prepareStatement("INSERT INTO `categories`(`name`)"
                + "VALUES (?)");

        ps.setString(1,category);
        
        int s=ps.executeUpdate();
        System.out.print(s);
        response.sendRedirect("../dashboard.jsp");
    }
    catch(SQLException e2){
        e2.printStackTrace();
    }
%>