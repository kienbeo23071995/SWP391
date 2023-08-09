<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023,11:10:15 AM
    Author     : kienb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' />
        <meta name='robots' content='noindex,nofolow' />
        <meta name="_token" content="ad0BOalbGjFaYLL4hTEY4texgMXBD7KaiapWPxwP">

        <link rel="stylesheet" href="assets/css/style1.css">
        <link rel="stylesheet" href="assets/css/style2.css">
        <link rel="stylesheet" href="assets/css/style3.css">
        <link rel="stylesheet" href="assets/css/style4.css">
        <link rel="stylesheet" href="assets/css/style5.css">
        <link rel="stylesheet" href="assets/css/style6.css">
        <link rel="stylesheet" href="assets/css/style7.css">
        <link rel="stylesheet" href="assets/css/style8.css">
        <title>Đổi số điện thoại</title>
    </head>

    <body class="desktop dashboard quan-ly cap-nhat-thong-tin-ca-nhan">
        <div id="webpage">
            <jsp:include page="header_sidebar.jsp"></jsp:include>
                <div class="container-fluid">
                    <div class="row">
                    <jsp:include page="sidebar.jsp"></jsp:include>
                        <main role="main" class="ml-sm-auto col-lg-10">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="homeController">House Rental System</a></li>
                                    <li class="breadcrumb-item"><a href="">Quản lý</a>
                                    </li>
                                    <li class="breadcrumb-item"><a
                                            href="changeinformation">Cập nhật thông tin cá nhân</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">Đổi số điện thoại</li>
                                </ol>
                            </nav>
                            <div
                                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                                <h1 class="h2">Đổi số điện thoại</h1>
                            </div>
                            <form class="js-form-submit-data" action="changephonenumber" method="POST"
                                  novalidate="novalidate">
                                <div class="form-group row mt-5">
                                    <label for="phone" class="col-md-2 offset-md-2 col-form-label">Email</label>
                                    <div class="col-md-6">
                                        <input type="email" name="email" readonly="" class="form-control disable"
                                               id="phone" value="${email}">
                                </div>
                            </div>
                            <div class="form-group row mt-5">
                                <label for="phone" class="col-md-2 offset-md-2 col-form-label">Số điện thoại cũ</label>
                                <div class="col-md-6">
                                    <input type="text" name="phone" readonly="" class="form-control disable"
                                           id="phone" value="${phone}">
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="" class="col-md-2 offset-md-2 col-form-label"></label>
                                <div class="col-md-2">
                                    <a href="mailchangephonenumber">Lấy mã xác thực <a/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="newphone" class="col-md-2 offset-md-2 col-form-label">Số điện thoại mới</label>
                                <div class="col-md-6">
                                    <input type="text" name="newphone" class="form-control js-input-phone" id="newphone" value="">
                                    <span id="phone-error" class="error-message" style="color: red"></span>
                                </div>
                            </div>
                            <script>
                                var inputPhone = document.getElementById('newphone');
                                var errorSpan = document.getElementById('phone-error');

                                inputPhone.addEventListener('blur', function () {
                                    var phoneNumber = inputPhone.value;
                                    var phoneNumberPattern = /^\d{10,}$/;

                                    if (!phoneNumberPattern.test(phoneNumber)) {
                                        errorSpan.textContent = 'Số điện thoại không hợp lệ.';
                                    } else {
                                        errorSpan.textContent = ''; 
                                    }
                                });
                            </script>

                            <div class="form-group row">
                                <label for="OTP" class="col-md-2 offset-md-2 col-form-label">Mã xác thực</label>
                                <div class="col-md-6">
                                    <input type="text" name="OTP" class="form-control" id="OTP" value="">
                                </div>
                            </div>
                            <div class="form-group row mt-5">
                                <label for="" class="col-md-2 col-form-label"></label>
                                <div class="col-md-8">
                                    <button type="submit"
                                            class="btn btn-primary mb-2 btn-block disabled js-btn-cap-nhat">Cập nhật</button>
                                </div>
                            </div>
                        </form>
                        <br><br>
                        <section class="section section-support">
                            <div class="section-content clearfix">
                                <div class="support-bg"></div>
                                <div class="list-support clearfix">
                                    <div class="list-support-title">Liên hệ với chúng tôi nếu bạn cần hỗ trợ:</div>
                                    <div class="support-item">
                                        <span class="support-item-title">Hỗ trợ đăng tin</span>
                                        <a rel="nofollow" href="tel:0902657123">Điện thoại: 0902657123</a>
                                        <a rel="nofollow" target="_blank" href="https://zalo.me/0902657123">Zalo:
                                            0902657123</a>
                                    </div>
                                    <div class="support-item">
                                        <span class="support-item-title">Hỗ trợ đăng tin</span>
                                        <a rel="nofollow" href="tel:0901424123">Điện thoại: 0901424123</a>
                                        <a rel="nofollow" target="_blank" href="https://zalo.me/0901424123">Zalo:
                                            0901424123</a>
                                    </div>
                                    <div class="support-item">
                                        <span class="support-item-title">Hỗ trợ đăng tin</span>
                                        <a rel="nofollow" href="tel:0981504039">Điện thoại: 0981504039</a>
                                        <a rel="nofollow" target="_blank" href="https://zalo.me/0981504039">Zalo:
                                            0981504039</a>
                                    </div>
                                    <div class="support-item">
                                        <span class="support-item-title">Phản ánh/khiếu nại</span>
                                        <a rel="nofollow" href="tel:0917686101">Điện thoại: 0917686101</a>
                                        <a rel="nofollow" target="_blank" href="https://zalo.me/0917686101">Zalo:
                                            0917686101</a>
                                    </div>
                                    <a class="btn btn-page-contact" rel="nofollow" href="/lien-he">Gửi liên hệ</a>
                                </div>
                            </div>
                        </section>
                    </main>
                </div>
            </div>
        </div>
        <script src="/js/main-dashboard.min.js?v=20230606"></script>
        <!-- Icons -->
        <script src="/js/3rd/feather.min.js"></script>
        <script>feather.replace();</script>
    </body>

</html>
