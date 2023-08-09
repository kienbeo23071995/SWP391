<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 2:40:05 AM
    Author     : kienb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
        <meta name="robots" content="noindex,nofolow">
        <meta name="_token" content="ad0BOalbGjFaYLL4hTEY4texgMXBD7KaiapWPxwP">

        <link rel="stylesheet" href="assets/css/style1.css">
        <link rel="stylesheet" href="assets/css/style2.css">
        <link rel="stylesheet" href="assets/css/style3.css">
        <link rel="stylesheet" href="assets/css/style4.css">
        <link rel="stylesheet" href="assets/css/style5.css">
        <link rel="stylesheet" href="assets/css/style10.css">
        <link rel="stylesheet" href="assets/css/style6.css">
        <link rel="stylesheet" href="assets/css/style7.css">
        <link rel="stylesheet" href="assets/css/style8.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .dropdown-menu {
                display: none;
            }
            .dropdown.show .dropdown-menu {
                display: block;
            }
        </style>
        <title>Quản lý tin đăng</title>
    </head>

    <body class="desktop dashboard quan-ly tin-dang loaded ready">
        <div id="webpage">
            <jsp:include page="header_sidebar.jsp"></jsp:include>
                <div class="container-fluid">
                    <div class="row">
                    <jsp:include page="sidebar.jsp"></jsp:include>   
                        <main role="main" class="ml-sm-auto col-lg-10">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="homeController">House Rental System</a></li>
                                    <li class="breadcrumb-item"><a href="https://phongtro123.com/quan-ly/index.html">Quản lý</a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Đăng tin mới</li>
                                </ol>
                            </nav>
                            <div
                                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                                <h1 class="h1">Đăng tin mới</h1>
                            </div>
                            <form id="form_dangtin" class="form-horizontal js-form-submit-data js-frm-manage-post"
                                  action="posthouse" method="post"
                                  data-action-url="https://phongtro123.com/api/post/create" novalidate="novalidate">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <h3>Địa chỉ cho thuê</h3>
                                            </div>
                                        </div>
                                        <div class="form-group row mt-3">
                                            <label for="post_cat" class="col-md-12 col-form-label">Quận/Huyện</label>
                                            <div class="col-md-3">
                                                <select class="form-control" id="post_cat" name="district">
                                                    <option value="Tất cả">-- Chọn quận/huyện --</option>
                                                <c:forEach items="${lsD}" var="d">
                                                    <option value="${d.getId()}">${d.getDistrict()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="diachi" class="col-form-label">Địa chỉ chính xác</label>
                                                <input type="text" class="form-control" name="address"
                                                       id="diachi">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-5">
                                        <div class="col-md-12">
                                            <h3>Thông tin mô tả</h3>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-3">
                                        <label for="post_cat" class="col-md-12 col-form-label">Loại chuyên mục</label>
                                        <div class="col-md-6">
                                            <select class="form-control" id="post_cat" name="category">
                                                <option value="Tất cả">-- Chọn chuyên mục --</option>
                                                <c:forEach items="${lsC}" var="c">
                                                    <option value="${c.getId()}">${c.getCategory()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="post_title" class="col-md-12 col-form-label">Tiêu đề</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control js-title" name="title" id="post_title"
                                                   value="" minlength="30" maxlength="120" required=""
                                                   data-msg-required="Tiêu đề không được để trống"
                                                   data-msg-minlength="Tiêu đề quá ngắn" data-msg-maxlength="Tiêu đề quá dài">
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="post_content" class="col-md-12 col-form-label">Nội dung mô tả</label>
                                        <div class="col-md-12">
                                            <textarea class="form-control js-content" name="description" id="post_content"
                                                      rows="10" required="" minlength="100"
                                                      data-msg-required="Bạn chưa nhập nội dung"
                                                      data-msg-minlength="Nội dung tối thiểu 100 kí tự"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="fullname" class="col-md-12 col-form-label">Thông tin liên hệ</label>
                                        <div class="col-md-6">
                                            <div class="input-group mb-3">
                                                <input id="fullname" type="text" name="fullname" class="form-control"
                                                       readonly="readonly" required="" data-msg-required="Tên liên hệ"
                                                       value="${sessionScope.acc.getFullname()}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="phone" class="col-md-12 col-form-label">Điện thoại</label>
                                        <div class="col-md-6">
                                            <div class="input-group mb-3">
                                                <input id="phone" type="number" name="phone" class="form-control"
                                                       readonly="readonly" required="" data-msg-required="Số điện thoại"
                                                       value="${sessionScope.acc.getPhone_Number()}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="giachothue" class="col-md-12 col-form-label">Giá cho thuê</label>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <input id="giachothue" name="price" pattern="[0-9.]+" type="number"
                                                       class="form-control" required=""
                                                       data-msg-required="Bạn chưa nhập giá phòng"
                                                       data-msg-min="Giá phòng chưa đúng">
                                                <div class="input-group-append">
                                                    <span class="input-group-text">đồng</span>
                                                </div>
                                            </div>
                                            <small class="form-text text-muted">Nhập đầy đủ số, ví dụ 1 triệu thì nhập là
                                                1000000</small>
                                        </div>
                                        <label for="text_giachothue" id="text_giachothue"
                                               class="col-sm-12 control-label js-number-text" style="color: red;"></label>
                                    </div>
                                    <div class="form-group row">
                                        <label for="post_acreage" class="col-md-12 col-form-label">Diện tích</label>
                                        <div class="col-md-6">
                                            <div class="input-group mb-3">
                                                <input id="post_acreage" type="number" attern="[0-9.]+" name="area"
                                                       max="1000" class="form-control" required=""
                                                       data-msg-required="Bạn chưa nhập diện tích">
                                                <div class="input-group-append">
                                                    <span class="input-group-text">m<sup>2</sup></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="direction" class="col-md-12 col-form-label">Hướng</label>
                                        <div class="col-md-6">
                                            <div class="input-group mb-3">
                                                <select class="form-control" id="post_cat" name="direction">
                                                    <option value="Hướng">-- Hướng --</option>
                                                    <c:forEach items="${lsDR}" var="dr">
                                                        <option value="${dr.getId()}">${dr.getDirection()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="post_acreage" class="col-md-12 col-form-label">Phòng ngủ</label>
                                        <div class="col-md-6">
                                            <div class="input-group mb-3">
                                                <input id="post_acreage" type="number" attern="[0-9.]+" name="bedroom"
                                                       max="1000" class="form-control" required=""
                                                       data-msg-required="Bạn chưa nhập diện tích">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="post_acreage" class="col-md-12 col-form-label">Phòng tắm</label>
                                        <div class="col-md-6">
                                            <div class="input-group mb-3">
                                                <input id="post_acreage" type="number" attern="[0-9.]+" name="bathroom"
                                                       max="1000" class="form-control" required=""
                                                       data-msg-required="Bạn chưa nhập diện tích">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-5">
                                        <div class="col-md-12">
                                            <h3>Hình ảnh</h3>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-md-12">
                                            <div class="photo_item col-md-2 col-3 js-photo-manual">
                                                <input name="image" value="" type="file">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group row mt-5">
                                        <div class="col-md-12">
                                            <button type="submit"
                                                    class="btn btn-success mb-5 btn-lg btn-block js-btn-hoan-tat">Đăng tin</button>
                                        </div>
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <div class="card mb-5"
                                         style="color: #856404; background-color: #fff3cd; border-color: #ffeeba;">
                                        <div class="card-body">
                                            <h4 class="card-title">Lưu ý khi đăng tin</h4>
                                            <ul>
                                                <li style="list-style-type: square; margin-left: 15px;">Nội dung phải viết
                                                    bằng tiếng Việt có dấu</li>
                                                <li style="list-style-type: square; margin-left: 15px;">Tiêu đề tin không
                                                    dài quá 100 kí tự</li>
                                                <li style="list-style-type: square; margin-left: 15px;">Các bạn nên điền đầy
                                                    đủ thông tin vào các mục để tin đăng có hiệu quả hơn.</li>
                                                <li style="list-style-type: square; margin-left: 15px;">Để tăng độ tin cậy
                                                    và tin rao được nhiều người quan tâm hơn, hãy sửa vị trí tin rao của bạn
                                                    trên bản đồ bằng cách kéo icon tới đúng vị trí của tin rao.</li>
                                                <li style="list-style-type: square; margin-left: 15px;">Tin đăng có hình ảnh
                                                    rõ ràng sẽ được xem và gọi gấp nhiều lần so với tin rao không có ảnh.
                                                    Hãy đăng ảnh để được giao dịch nhanh chóng!</li>
                                            </ul>
                                        </div>
                                    </div>

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
                                        <a rel="nofollow" href="tel:0903007123">Điện thoại: 0903007123</a>
                                        <a rel="nofollow" target="_blank" href="https://zalo.me/0903007123">Zalo:
                                            0903007123</a>
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
        <script src="/js/3rd/feather.min.js"></script>
        <script>feather.replace();</script>
        <script>
            $(document).ready(function () {
                $('.dropdown-toggle').click(function () {
                    $('.dropdown-menu').toggle();
                });
            });
        </script>
    </body>

</html>
