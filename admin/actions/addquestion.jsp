<%-- 
    Document   : addquestion
    Created on : 18 Apr, 2018, 1:33:47 PM
    Author     : Rupinder
--%>

<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%  try
    {
        String question=request.getParameter("question");
        String option1=request.getParameter("option1");
        String option2=request.getParameter("option2");
        String option3=request.getParameter("option3");
        String option4=request.getParameter("option4");
        String coption=request.getParameter("coption");
        String category=request.getParameter("category");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        PreparedStatement ps=con.prepareStatement("INSERT INTO `questionbank`(`question`, `option1`, `option2`, `option3`, `option4`, `correct`, `category`) "
                + "VALUES (?,?,?,?,?,?,?)");

        ps.setString(1,question);
        ps.setString(2,option1);
        ps.setString(3,option2);
        ps.setString(4,option3);
        ps.setString(5,option4);
        ps.setString(6,coption);
        ps.setString(7,category);
        
        int s=ps.executeUpdate();
        System.out.print(s);
        response.sendRedirect("../dashboard.jsp");
    }
    catch(SQLException e2){
        e2.printStackTrace();
    }
%>