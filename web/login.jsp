<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 10:20:15 AM
    Author     : kienb
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <section class="section section-access">
                <div class="section-header">
                    <h1 class="section-title big">Đăng nhập</h1>
                </div>
                <div class="section-content">
                    <form class="form-access login-form js-login-form clearfix" action="login" method="POST">
                        <div class="form-group form-group-phone">
                            <label for="email">Email</label>
                            <input type="text" class="form-control" id="email" name="email">
                            <div id="email-error" class="error-message" style="color: red;"></div>
                        </div>

                        <script>
                            var inputEmail = document.getElementById('email');
                            var errorSpan = document.getElementById('email-error');


                            inputEmail.addEventListener('blur', function () {
                                var email = inputEmail.value;
                                var emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;

                                if (!emailRegex.test(email)) {
                                    errorSpan.textContent = 'Email không hợp lệ.';
                                } else {
                                    errorSpan.textContent = '';
                                }
                            });
                        </script>

                        <div class="form-group form-group-password">
                            <label for="password">Mật khẩu</label>
                            <input type="password" class="form-control" id="password" name="password" >
                            <div class="error-message" style="color: red;"></div>
                        </div>

                        <script>
                            document.querySelector('form').addEventListener('submit', function (event) {
                                var passwordInput = document.getElementById('password');
                                var password = passwordInput.value.trim();
                                var errorDiv = passwordInput.nextElementSibling;

                                if (password === '') {
                                    errorDiv.textContent = 'Vui lòng nhập mật khẩu.';
                                    event.preventDefault();
                                } else {
                                    errorDiv.textContent = '';
                                }
                            });
                        </script>

                        <div class="form-group">
                            <p style="color: red">${requestScope.mess}</p>
                        <button type="submit" name="signin" id="signin" class="btn btn-submit">Đăng nhập</button></div>
                    <div class="form-group">
                        <a class="btn btn-outline-dark" href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8081/SWP391/loginGoogle&response_type=code
                           &client_id=188672854294-9n1ftbqtng34nq5hq6g5t0usaptr3m6g.apps.googleusercontent.com&approval_prompt=force" role="button" style="text-transform:none;color: white">
                            Login with Google
                        </a>
                    </div>
                    <div class="form-group clearfix">
                        <a href="forgotpassword">Bạn quên mật khẩu?</a>
                        <a style="float: right;" href="register">Tạo tài khoản mới</a></div>
                </form>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>
