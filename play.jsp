<%-- 
    Document   : start.jsp
    Created on : 18 Apr, 2018, 3:26:38 PM
    Author     : Rupinder
--%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>

    <%
        String str = (String) session.getAttribute("username");
        if (session.getAttribute("username") != null) {

        } else {
            response.sendRedirect("login.jsp");
        }
    %>
    
    <% 
        ResultSet rs = null;
        int i=1;
        int ansval=0,ansindex=1;
        String category = "";
        
        try{
            category=(String)session.getAttribute("category");
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
            PreparedStatement ps=con.prepareStatement("Select * from questionbank WHERE category='"+category+"'");

            rs = ps.executeQuery();
        }
        catch(Exception e){
            response.sendRedirect("error.jsp");
        }
    %>
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12 quiz-box">
                <div class="col-lg-12 quiz-key">
                    <h2> <%= category.toUpperCase() %> - QUIZ </h2>
                </div>

                <div class="col-lg-12 quiz-form">
                    <div class="col-lg-12 quiz-form">
                        <form method="POST" action="result.jsp">
                            <% while(rs.next()) { %>
                                <div class="form-group">
                                    <div class="question">
                                        <h4><strong><em>Question <%= i%>: </em></strong> <%=rs.getString(2) %></h4>
                                        <% for(int x=3;x<7;x++) { %>
                                            <div class="col-md-6">
                                                <input class="custom-form-control" type="radio" required="required" name="question<%=i%>" value="<% 
                                                            ansval = rs.getInt(7);
                                                            if(ansval == ansindex)
                                                                out.println("correct");
                                                            else
                                                                out.println("incorrect");
                                                            ansindex++;
                                                %>"><%=rs.getString(x)%><br>
                                            </div>
                                         <% } %>
                                    </div>                                       
                                </div>
                            <% i++; ansindex=1;}  %>
                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-12 quiz-key">
                                    <button type="submit" name="ques" value="<%= --i %>" class="btn btn-success">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </div>
<jsp:include page="partials/footer.jsp"></jsp:include>
