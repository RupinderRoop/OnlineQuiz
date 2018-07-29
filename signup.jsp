<jsp:include page="partials/header.jsp"></jsp:include>
<jsp:include page="partials/navbar.jsp"></jsp:include>
    
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div class="col-lg-12 login-key">
                    <img src="public/images/new-reg.png" alt="Register">
                </div>

                <div class="col-lg-12 login-form">
                    <div class="col-lg-12 login-form">
                        <form method="POST" action="actions/register.jsp">
                            <div class="form-group">
                                <label class="form-control-label">EMAIL</label>
                                <input type="email" name="email" class="form-control" required i>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">USERNAME</label>
                                <input type="text" name="username" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">PASSWORD</label>
                                <input type="password" id="password" name="password" class="form-control" required i>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">CONFIRM PASSWORD</label>
                                <input type="password" id="cpassword" name="cpassword" class="form-control" required i>
                            </div>
                            <div class="form-group">
                                <label class="form-control-label">PHONE</label>
                                <input type="number" name="phone" class="form-control" i>
                            </div>

                            <div class="col-lg-12 loginbttm">
                                <div class="col-lg-6 login-btm login-text">
                                    <!-- Error Message -->
                                </div>
                                <div class="col-lg-6 login-btm login-button">
                                    <button type="submit" class="btn btn-outline-primary">LOGIN</button>
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