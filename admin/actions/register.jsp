<%-- 
    Document   : register
    Created on : 17 Apr, 2018, 11:44:42 AM
    Author     : Rupinder
--%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%  try
    {
        String username=request.getParameter("username");
        String userpass=request.getParameter("password");
        String phone=request.getParameter("phone");
        String email=request.getParameter("email");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        PreparedStatement ps=con.prepareStatement("INSERT INTO `users`(`user_name`, `password`, `email_id`, `phone`) VALUES (?,?,?,?)");

        ps.setString(1,username);
        ps.setString(2,userpass);
        ps.setString(3,email);
        ps.setString(4,phone);
        int s=ps.executeUpdate();
        System.out.print(s);
        response.sendRedirect("../index.jsp");
    }
    catch(SQLException e2){
        e2.printStackTrace();
    }
%>