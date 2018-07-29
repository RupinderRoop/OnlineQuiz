<%-- 
    Document   : addQuestion
    Created on : 18 Apr, 2018, 1:10:29 PM
    Author     : Rupinder
--%>
<%@page import="java.sql.*"%>
<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>
    <% 
        String str = (String)session.getAttribute("username");
        if(session.getAttribute("category") != null ){
            int type = Integer.parseInt(session.getAttribute("category").toString());
            if( type != 1 ){
                response.sendRedirect("index.jsp?error=Not a administrator Account.");
            }
        }
        else {
            response.sendRedirect("index.jsp");
        }
    %>
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <img src="public/images/Folder-Add-icon.png" alt="Login">
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form method="POST" action="actions/addquestion.jsp">
                            <div class="form-group">
                                <label class="form-control-label">QUESTION</label>
                                <input type="text" name="question" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">OPTION ONE</label>
                                <input type="text" name="option1" required class="form-control" i>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">OPTION TWO</label>
                                <input type="text" name="option2" required class="form-control" i>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">OPTION THREE</label>
                                <input type="text" name="option3" required class="form-control" i>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">OPTION FOUR</label>
                                <input type="text" name="option4" required class="form-control" i>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">CORRECT OPTION</label>
                                <input type="text" name="coption" required class="form-control" i>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-control-label">CATEGORY</label>
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
                                    
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">Add Question</button>
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
