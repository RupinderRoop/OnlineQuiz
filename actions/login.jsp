<%-- 
    Document   : login
    Created on : 17 Apr, 2018, 12:19:19 PM
    Author     : Rupinder
--%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%  try
    {
        String username=request.getParameter("username");
        String userpass=request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        PreparedStatement ps = con.prepareStatement("SELECT * from `users` WHERE user_name=? and password=?");
        ps.setString(1,username);
        ps.setString(2,userpass);
        
        ResultSet rs = ps.executeQuery();
        boolean status = rs.next();
        if(status) 
        {
            out.println("Login");
            username=rs.getString(2);
            int type = rs.getInt(4);
            session.setAttribute("username",String.valueOf(username));
            session.setAttribute("category",type);
            response.sendRedirect("../user.jsp");
        }
        else{
            response.sendRedirect("../login.jsp?error=Invalid Username or Password");
        }
    }
    catch(SQLException e2){
        e2.printStackTrace();
    }
%>