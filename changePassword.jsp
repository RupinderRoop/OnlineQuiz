<%-- 
    Document   : changePassword
    Created on : 18 Apr, 2018, 8:20:28 PM
    Author     : Rupinder
--%>
<%
    String username = (String) session.getAttribute("username");
    if (session.getAttribute("username") != null) {
        
    } else {
        response.sendRedirect("login.jsp");
    }
%>
<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 quiz-key">
                    <h2 style='color:#fff;'>Change Password</h2>
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form method="POST" action="actions/change.jsp">
                            <div class="form-group">
                                <label class="form-control-label">NEW PASSWORD</label>
                                <input type="password" id='password' name="password" required class="form-control">
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">CONFIRM PASSWORD</label>
                                <input type="password" id='cpassword' name="cpassword" required class="form-control" i>
                            </div>

                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                    <% 
                                        String str = (String)request.getParameter("error"); 
                                        if(str == null)
                                            str = "";
                                        out.println(str);
                                    %>
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">Save Changes</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </div>
<script>
    var password = document.getElementById("password");
    var confirm_password = document.getElementById("cpassword");

    function validatePassword(){
    if(password.value !== confirm_password.value) {
        confirm_password.setCustomValidity("Passwords Don't Match");
    } else {
        confirm_password.setCustomValidity('');
    }
    }

    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>
<jsp:include page="partials/footer.jsp"></jsp:include>