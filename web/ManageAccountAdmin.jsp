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
        <link href="assets/css/toast.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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
                                    <li class="breadcrumb-item active" aria-current="page">Quản lý tài khoản</li>
                                </ol>
                            </nav>
                            <div
                                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                                <h1 class="h2">Quản lý tài khoản</h1>
                            </div>

                            <!-- toast -->
                            <div id="snackbar"></div>
                        <c:if test="${msg != null}">
                            <script>
                                var x = document.getElementById("snackbar");
                                x.textContent = '${msg}';
                                x.className = "show";
                                setTimeout(function () {
                                    x.className = x.className.replace("show", "");
                                }, 3000);
                            </script>
                        </c:if>

                        <form action="manageAccount" method="post">
                            <div class="mt-3 d-flex gap-4 align-items-center">
                                <input type="hidden" value="search" name="action">
                                <div class="form-outline" style="width: 100%;">
                                    <input value="${textSearch}" type="text" name="textSearch" id="form12" class="form-control" placeholder="Tìm kiếm..." />
                                </div>
                                <select class="form-select" style="width: 200px;" id="" name="status">
                                    <option value="-1"
                                            <c:if test="${status == -1}">
                                                selected
                                            </c:if>
                                            >Tất cả trạng thái</option>
                                    <option value="1"
                                            <c:if test="${status == 1}">
                                                selected
                                            </c:if>
                                            >Hoạt động</option>
                                    <option value="0"
                                            <c:if test="${status == 0}">
                                                selected
                                            </c:if>
                                            >Không hoạt động</option>
                                </select> 
                                <button style="border: none;border-radius: 5px;background-color: #21D192" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </div>
                        </form>

                        <table class="table mt-2">
                            <thead>
                                <tr style="background-color: #21D19240;">
                                    <th scope="col">ID</th>
                                    <th scope="col">Tên</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Giới tính</th>
                                    <th scope="col">Vai trò</th>
                                    <th scope="col">Trạng thái</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="a" items="${list}">
                                    <tr>
                                        <td>${a.getId()}</td>
                                        <td>${a.getFullname()}</td>
                                        <td>${a.getEmail()}</td>
                                        <td>${a.getPhone_Number()}</td>
                                        <td>${a.getAddress()}</td>
                                        <td>
                                            <c:if test="${a.getGender() == 1}">Nam</c:if>
                                            <c:if test="${a.getGender() == 0}">Nữ</c:if>
                                            </td>
                                            <td>
                                            <c:if test="${a.getRole_ID() == 2}">Người thuê</c:if>
                                            <c:if test="${a.getRole_ID() == 3}">Chủ sở hữu</c:if>
                                            </td>
                                            <td>
                                            <c:if test="${a.getStatus() == 1}">
                                                Hoạt động
                                            </c:if>
                                            <c:if test="${a.getStatus() == 0}">
                                                Không hoạt động
                                            </c:if>
                                        </td>
                                        <td>
                                            <div class="justify-content-center d-flex gap-2">
                                                <!--View Profile button--> 
                                                <form action="viewProfile" method="post">
                                                    <input type="hidden" value="${a.getId()}" name="accountID">
                                                    <button type="submit" class="btn btn-success me-2">
                                                        <i class="fa-solid fa-eye"></i>
                                                    </button>
                                                </form>
                                                <c:if test="${a.getStatus() == 0}">
                                                    <!--Edit button--> 
                                                    <button type="button" class="btn btn-success me-2" data-bs-toggle="modal"
                                                            data-bs-target="#updateItem_${a.getId()}">
                                                        <i class="fa-solid fa-check"></i>
                                                    </button>
                                                    <!--Modal Edit Detail-->
                                                    <div class="modal fade" id="updateItem_${a.getId()}" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-lg modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Cập nhật trạng thái tài khoản</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h6>Bạn có muốn chuyển trạng thái tài khoản có ID: ${a.getId()} thành hoạt động?</h6>
                                                                    <form method="POST" action="manageAccount" class="register-form"
                                                                          id="register-form">
                                                                        <input type="hidden" value="active" name="action"/>
                                                                        <input type="hidden" value="${a.getId()}" name="accountID"/>
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">
                                                                            Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                                <c:if test="${a.getStatus() == 1}">
                                                    <!--Edit button--> 
                                                    <button type="button" class="btn btn-danger me-2" data-bs-toggle="modal"
                                                            data-bs-target="#updateItem_${a.getId()}">
                                                        <i class="fa-solid fa-xmark"></i>
                                                    </button>
                                                    <!--Modal Edit Detail-->
                                                    <div class="modal fade" id="updateItem_${a.getId()}" tabindex="-1"
                                                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog modal-lg modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="exampleModalLabel">Cập nhật trạng thái tài khoản</h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                                            aria-label="Close"></button>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <h6>Bạn có muốn chuyển trạng thái tài khoản có ID: ${a.getId()} thành không hoạt động?</h6>
                                                                    <form method="POST" action="manageAccount" class="register-form"
                                                                          id="register-form">
                                                                        <input type="hidden" value="deactive" name="action"/>
                                                                        <input type="hidden" value="${a.getId()}" name="accountID"/>
                                                                        <button type="button" class="btn btn-secondary"
                                                                                data-bs-dismiss="modal">
                                                                            Đóng
                                                                        </button>
                                                                        <button type="submit" class="btn btn-primary">Lưu</button>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:if>
                                        </td>
                                        </div>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                        <!-- pagination -->
                        <div class="d-flex justify-content-center mt-2">
                            <nav aria-label="Page navigation example col-12">
                                <ul class="pagination">
                                    <%--For displaying Previous link except for the 1st page --%>
                                    <c:if test="${currentPage != 1}">
                                        <li class="page-item">
                                            <a class="page-link" href="manageAccount?page=${currentPage - 1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <%--For displaying Page numbers. The when condition does not display
                                                a link for the current page--%>
                                    <c:forEach begin="1" end="${noOfPages}" var="i">
                                        <c:choose>
                                            <c:when test="${currentPage eq i}"> 
                                                <li class="page-item"><a class="page-link bg-light" href="#">${i}</a></li>
                                                </c:when>
                                                <c:otherwise>
                                                <li class="page-item"><a class="page-link" href="manageAccount?page=${i}">${i}</a></li>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>

                                    <%--For displaying Next link --%>
                                    <c:if test="${currentPage lt noOfPages}">
                                        <li class="page-item">
                                            <a class="page-link" href="manageAccount?page=${currentPage + 1}" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/8d39de38b8.js" crossorigin="anonymous"></script>
    </body>

</html>
