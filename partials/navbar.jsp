<%-- 
    Document   : navbar
    Created on : 17 Apr, 2018, 10:27:17 AM
    Author     : Rupinder
--%>

    <nav class="navbar navbar-inverse">
      <div class="container-fluid container">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp"><img src="public/images/logo.png" alt="QUIZ"></a>
        </div>
        <ul class="nav navbar-nav">
          <li class="active"><a href="#">Home</a></li>
          <li><a href="selectCategory.jsp">Play Quiz</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
          <li>
                <%
                    if(session.getAttribute("username") != null){
                        out.println("<a href='user.jsp'> <span class='glyphicon glyphicon-user'></span> Welcome, "+session.getAttribute("username").toString().toUpperCase());
                    }
                    else{
                        out.println("<a href='signup.jsp'> <span class='glyphicon glyphicon-user'></span> Sign Up");
                    }
                %></a>
          </li>
          <li>
              <%
                    if(session.getAttribute("username") != null){
                        out.println("<a href='logout.jsp'> <span class='glyphicon glyphicon-off'></span> Logout");
                    }
                    else{
                        out.println("<a href='login.jsp'> <span class='glyphicon glyphicon-user'></span> Login");
                    }
                %></a>
          </li>
        </ul>
      </div>
    </nav>