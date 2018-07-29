<%-- 
    Document   : change.jsp
    Created on : 18 Apr, 2018, 8:25:18 PM
    Author     : Rupinder
--%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%  try
    {
        String cpassword = request.getParameter("cpassword");
        String userpass = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        PreparedStatement ps=con.prepareStatement("UPDATE `users` SET `password` = ?");

        ps.setString(1,userpass);
        int s=ps.executeUpdate();
        System.out.print(s);
        response.sendRedirect("../index.jsp");
    }
    catch(SQLException e2){
        e2.printStackTrace();
    }
%>