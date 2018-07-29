<%-- 
    Document   : start.jsp
    Created on : 18 Apr, 2018, 3:27:02 PM
    Author     : Rupinder
--%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%  try
    {
        String category=request.getParameter("category");
        session.setAttribute("category",category);
        response.sendRedirect("../play.jsp");
    }
    catch(Exception e2){
        e2.printStackTrace();
    }
%>
