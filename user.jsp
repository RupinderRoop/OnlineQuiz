<%-- 
    Document   : result
    Created on : 18 Apr, 2018, 6:37:07 PM
    Author     : Rupinder
--%>
<%

    String username = (String) session.getAttribute("username");
    if (session.getAttribute("username") != null) {
        
    } else {
        response.sendRedirect("login.jsp");
    }
    ResultSet rs = null;
    int i=1;
    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        PreparedStatement ps = con.prepareStatement("SELECT * from `results` WHERE username ='"+username+"'");
        
        rs = ps.executeQuery();
    } catch (Exception e) {
        response.sendRedirect("error.jsp");
    }
%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 quiz-box">
                <div class="col-lg-12 quiz-key">
                    <h2> <%= username.toUpperCase() %>'s Previous Quizzes </h2>
                </div>
                <div class="col-lg-12 quiz-key">
                    <a href='selectCategory.jsp' class='btn btn-primary'>Attempt Quiz</a>
                </div>
                <div class="col-lg-12 quiz-form">
                    <div class="col-lg-12 quiz-form">
                        <table class="table table-striped">
                            <%
                                if (rs.next() == false) {
                                    out.print("<h3>You haven't attempted any Quiz yet.</h3>");
                                } else {
                            %>
                            <thead>
                                <tr>
                                    <th>Sr.no.</th>
                                    <th>Date</th>
                                    <th>Category</th>
                                    <th>Total Points</th>
                                    <th>Scored Points</th>
                                    <th>Percentile</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% do {%>
                                <tr>
                                    <td><%= i++ %></td>
                                    <th><%= rs.getString(6).substring(0,16) %></th>
                                    <td><%= rs.getString(5).toUpperCase() %></td>
                                    <td><%= rs.getInt(3) %></td>
                                    <td><%= rs.getInt(4) %></td>
                                    <td>
                                        <%
                                            int percentage = (int)(((float)rs.getInt(4)/rs.getInt(3))*100);
                                            out.println(percentage);
                                            if(percentage==100)
                                                out.print("(Perfact Score)");
                                        %>
                                    </td>
                                </tr>
                                <%}while(rs.next());%>
                                <%}%>
                            </tbody>
                        </table>
                        <div class="col-lg-12 quiz-key">
                            <h2> <a class='btn-block' href='changePassword.jsp'>Change Password</a> </h2>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </div>
<jsp:include page="partials/footer.jsp"></jsp:include>

