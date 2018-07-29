<%-- 
    Document   : results.jsp
    Created on : 18 Apr, 2018, 8:30:14 PM
    Author     : Rupinder
--%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>
<%
    String str = (String) session.getAttribute("username");
    int totalUsers = 0,totalAttempts = 0;
    if (session.getAttribute("category") != null) {
        int type = Integer.parseInt(session.getAttribute("category").toString());
        if (type != 1) {
            response.sendRedirect("index.jsp?error=Not a administrator Account.");
        }
    } else {
        response.sendRedirect("index.jsp");
    }
    try
    {
        String category=request.getParameter("category");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        
        //User Count
        PreparedStatement ps=con.prepareStatement("SELECT COUNT(*) AS total FROM users");
        ResultSet rs = ps.executeQuery();
        rs.next();
        
        //Total Attempts
        totalUsers = rs.getInt(1); ps=con.prepareStatement("SELECT COUNT(*) AS total FROM results");
        rs = ps.executeQuery();
        rs.next();
        totalAttempts = rs.getInt(1);
        
        ps.setString(1,category);
        
        int s=ps.executeUpdate();
        System.out.print(s);
        response.sendRedirect("../dashboard.jsp");
    }
    catch(SQLException e2){
        e2.printStackTrace();
    }
%>
<div class="myrow">
    <div class="container">
        <h1>REPORTS</h1>
        <br>
        <h3>Users Registered : <%= totalUsers %></h3>
        <h3>Quizzes Attempted : <%= totalUsers %></h3>
    </div>
</div>
<jsp:include page="partials/footer.jsp"></jsp:include>