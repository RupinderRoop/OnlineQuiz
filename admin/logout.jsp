<%-- 
    Document   : logout
    Created on : 17 Apr, 2018, 1:34:30 PM
    Author     : Rupinder
--%>

<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
