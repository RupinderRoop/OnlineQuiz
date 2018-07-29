<%-- 
    Document   : selectCategory
    Created on : 18 Apr, 2018, 3:15:04 PM
    Author     : Rupinder
--%>
<%@page import="java.sql.*"%>
<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>
    <% 
        String str = (String)session.getAttribute("username");
        if(session.getAttribute("username") != null ){
            
        }
        else {
            response.sendRedirect("login.jsp");
        }
    %>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <img src="public/images/category.png" alt="Register">
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form method="POST" action="actions/start.jsp">
                            <div class="form-group">
                                <label class="form-control-label">CATEGORY NAME</label>
                                <select name="category" required class="form-control" i>
                                    <%
                                        try
                                        {
                                            Class.forName("com.mysql.jdbc.Driver");
                                            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/jsp_quiz", "root", "admin@123");
                                            PreparedStatement ps = con.prepareStatement("SELECT * from `categories`");

                                            ResultSet rs = ps.executeQuery();
                                            while(rs.next()){
                                                out.println("<option value='"+rs.getString(2)+"'>"+rs.getString(2)+"</option>");
                                            }
                                        }
                                        catch(SQLException e2){
                                            response.sendRedirect("error.jsp");
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                    <!-- Error Message -->
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">Start</button>
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
