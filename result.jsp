<%-- 
    Document   : result
    Created on : 18 Apr, 2018, 6:37:07 PM
    Author     : Rupinder
--%>
<%
    String category = "";
    if (session.getAttribute("username") != null) {

    } else {
        response.sendRedirect("login.jsp");
    }
    String username = (String) session.getAttribute("username");
    String quiz = (String) session.getAttribute("category");
    int ques = Integer.parseInt(request.getParameter("ques"));
    int score = 0;
    
%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 quiz-box">
                <div class="col-lg-12 quiz-key">
                    <h2> <%= quiz.toUpperCase() %> - Quiz's Result </h2>
                </div>

                <div class="col-lg-12 quiz-form">
                    <div class="col-lg-12 quiz-form">
                        <table class="table table-striped">
                            <thead>
                              <tr>
                                <th>Question Number</th>
                                <th>Answer</th>
                                <th>Points</th>
                              </tr>
                            </thead>
                            <tbody>
                                <% for(int i=1; i<=ques; i++) { %>
                                <tr>
                                    <td><%= i %><br></td>
                                    <td><%= request.getParameter("question"+i).toUpperCase() %><br></td>
                                    <td>
                                        <% 
                                            if(request.getParameter("question"+i).toString().contains("incorrect")) 
                                                out.println("0");
                                            else {
                                                out.println("1");
                                                score++;
                                            }
                                        %>
                                    </td>
                                </tr>
                                <% } %>
                                <tr>
                                    <td></td>
                                    <td><strong>TOTAL</strong><br></td>
                                    <td>
                                        <%= score  %>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </div>
<%
    try {
        category = (String) session.getAttribute("category");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
        PreparedStatement ps = con.prepareStatement("INSERT INTO `results`( `username`, `total`, `score`, `category`) VALUES (?,?,?,?)");
        
        ps.setString(1,username);
        ps.setInt(2,ques);
        ps.setInt(3,score);
        ps.setString(4,category);
        
        int s=ps.executeUpdate();
        
    } catch (Exception e) {
        response.sendRedirect("error.jsp");
    }
%>
<jsp:include page="partials/footer.jsp"></jsp:include>

