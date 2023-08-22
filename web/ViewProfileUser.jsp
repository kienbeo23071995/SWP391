<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 2:20:15 AM
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
        <style>
            .gender-label {
                display: inline-block;
                margin-right: 40px;
            }
        </style>
        <title>Cập nhật thông tin cá nhân</title>
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
                                    <li class="breadcrumb-item active" aria-current="page">Xem thông tin cá nhân</li>
                                </ol>
                            </nav>
                            <div
                                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                                <h1 class="h2">Xem thông tin cá nhân</h1>
                            </div>

                            <div class="form-group row mt-5">
                                <label for="user_name" class="col-md-2 offset-md-2 col-form-label">Tên hiển thị</label>
                                <div class="col-md-6">
                                    <input type="text" readonly class="form-control" id="user_name" name="fullname" value="${acc.getFullname()}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="user_phone" class="col-md-2 offset-md-2 col-form-label">Số điện thoại</label>
                            <div class="col-md-6">
                                <input type="phone" readonly class="form-control disable" id="user_phone" name="phone"
                                       value="${acc.getPhone_Number()}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="user_phone" class="col-md-2 offset-md-2 col-form-label">Email</label>
                            <div class="col-md-6">
                                <input type="email" readonly class="form-control disable" id="user_phone" name="email"
                                       value="${acc.getEmail()}">                               
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="address" class="col-md-2 offset-md-2 col-form-label">Địa chỉ</label>
                            <div class="col-md-6">
                                <input type="text" readonly class="form-control" id="address" name="address" value="${acc.getAddress()}">
                            </div>
                        </div>
                        <!-- HTML -->
                        <div class="form-group row mt-5">
                            <label for="gender" class="col-md-2 offset-md-2 col-form-label">Giới tính</label>
                            <div class="col-md-6">
                                <label for="male" class="gender-label">
                                    <c:if test="${acc.getGender() == 1}">Nam</c:if>
                                    <c:if test="${acc.getGender() == 0}">Nữ</c:if>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group row mt-5">
                                <label for="gender" class="col-md-2 offset-md-2 col-form-label">Trạng thái</label>
                                <div class="col-md-6">
                                    <label for="male" class="gender-label">
                                    <c:if test="${acc.getStatus() == 1}">Hoạt động</c:if>
                                    <c:if test="${acc.getStatus() == 0}">Không hoạt động</c:if>
                                    </label>
                                </div>
                            </div>
                            <div class="form-group row mt-5">
                                <label for="user_avatar" class="col-md-2 offset-md-2 col-form-label"
                                       style="padding-top: 0;">Ảnh đại diện</label>
                                <div class="col-md-6">
                                    <div class="user-avatar-upload-wrapper js-one-image-wrapper ">
                                        <div class="user-avatar-inner js-one-image-inner">
                                            <div class="user-avatar-preview js-one-image-preview"
                                                 style="background: url(assets/images/${acc.getProfile_Picture()}) center no-repeat; background-size: cover;">
                                            
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </div>

                        <div class="w-100 justify-content-center d-flex mt-5">
                            <button class="btn btn-success" onclick="back()">Quay lai</button>
                        </div>

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
        <script>
            function back() {
                window.history.back();
            }
        </script>
    </body>

</html>
