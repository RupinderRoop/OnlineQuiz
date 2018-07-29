<%-- 
    Document   : Dashboard
    Created on : 18 Apr, 2018, 12:24:17 PM
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
    <div class="myrow">
        <div class="container">
            <h1>ADMIN PANEL</h1>
            <div class="col-md-4 db-items">
                <a href="addQuestion.jsp">
                    <div class="db-img">
                        <img src="public/images/Folder-Add-icon.png" />
                    </div>

                    <div class="db-content">
                            Add New Question
                    </div>
                </a>
            </div>
            <div class="col-md-4 db-items">
                <a href="addCategory.jsp">
                    <div class="db-img">
                        <img src="public/images/category.png" />
                    </div>

                    <div class="db-content">
                            Add New Category
                    </div>
                </a>
            </div>
            <div class="col-md-4 db-items">
                <a href="reports.jsp">
                    <div class="db-img">
                        <img src="public/images/Reports-icon.png" />
                    </div>

                    <div class="db-content">
                        View Reports
                    </div>
                </a>
            </div>
            <div class="col-md-4 db-items">
                <a href="../changePassword.jsp">
                    <div class="db-img">
                        <img src="public/images/user-info-icon.png" />
                    </div>

                    <div class="db-content">
                        Manage Account
                    </div>
                </a>
            </div>
        </div>
    </div>
<jsp:include page="partials/footer.jsp"></jsp:include>
