<%-- 
    Document   : addCategory
    Created on : 18 Apr, 2018, 2:50:57 PM
    Author     : Rupinder
--%>

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
                    <img src="public/images/category.png" alt="Register">
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form method="POST" action="actions/addcat.jsp">
                            <div class="form-group">
                                <label class="form-control-label">CATEGORY NAME</label>
                                <input type="text" name="category" class="form-control" required i>
                            </div>

                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                    <!-- Error Message -->
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">ADD CATEGORY</button>
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