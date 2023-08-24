<%-- 
    Document   : CreateBill
    Created on : Aug 24, 2023, 7:54:24 AM
    Author     : kienb
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        .list-comment-2020 .item-comment-2020:first-child {
            padding-top: 0;
        }
        .list-comment-2020 .item-comment-2020 {
            display: flex;
            padding: 20px 0;
            border-bottom: 1px solid #f3f3f3;
        }
        .list-comment-2020 .item-comment-2020 .first-letter {
            float: left;
            width: 64px;
            height: 64px;
            background: #ddd;
            text-align: center;
            color: #666;
            text-transform: uppercase;
            font-size: 20px;
            line-height: 64px;
            font-weight: 600;
            text-shadow: 1px 1px 0 rgba(255,255,255,.2);
            border-radius: 9999px;
        }
        .user-info {
            display: flex;
            flex-direction: column;
            -webkit-box-align: center;
            align-items: center;
            width: 180px;
            padding: 5px 10px;
        }
    </style>
</head>  
<body>
    <script>
        var imagePaths = [];
        imagePaths = '${imgPath}'.split(',');
        var slider = document.getElementById('sliderimg');
        var currentIndex = 0;
        function changeImage() {
            slider.src = "./assets/images/" + imagePaths[currentIndex];
        }
        function nextImage() {
            currentIndex++;
            if (currentIndex >= imagePaths.length) {
                currentIndex = 0;
            }
            changeImage();
        }
        function prevImage() {
            currentIndex--;
            if (currentIndex < 0) {
                currentIndex = imagePaths.length - 1;
            }
            changeImage();
        }
        function disMess() {
            var m = document.getElementById('ofmess');
            if (m.style.display === 'none') {
                m.style.display = 'block';
            } else {
                m.style.display = 'none';
            }
        }
        function submitForm() {
            document.getElementById('sen').submit();
        }
    </script>
    <jsp:include page="header.jsp"></jsp:include>
        <div id="webpage">
            <main id="main">
                <div class="container clearfix">
                    <div id="breadcrumb">
                        <ol class="clearfix">
                            <li class="first link"><a href="homeController"
                                                      title="Cho thuê phòng trọ"><span>Trang chủ</span></a></li>
                        </ol>
                    </div>
                    <div id="left-col">
                        <article class="the-post tin-vip vipnoibat">
                            <div class="post-images">
                                <div class="images-swiper-container swiper-container-horizontal">
                                    <img style="width: 500px; margin: auto; height: 100%" id="sliderimg" src="${firstImg}" alt="alt">
<!--                                    <img id="sliderimg" src="${firstImg}" alt="alt" style="width: 100%;">-->
                                <div class="swiper-wrapper"
                                     style="transform: translate3d(-728px, 0px, 0px); transition-duration: 0ms;">
                                    <div class="swiper-slide swiper-slide-duplicate swiper-slide-prev"
                                         style="width: 728px;">
                                        <c:if test="${!imgPath.isEmpty()}">
                                            <div class="btnc">
                                                <input style="margin-right: 1em;cursor: pointer;" type="button" value="Prev" onclick="prevImage()">
                                                <input style="cursor: pointer;" type="button" value="Next" onclick="nextImage()">
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                                <div class="swiper-pagination swiper-pagination-fraction"><span
                                        class="swiper-pagination-current">1</span> / <span
                                        class="swiper-pagination-total">7</span>
                                </div>
                                <div class="swiper-button-prev" tabindex="0" role="button" aria-label="Previous slide">
                                </div>
                                <div class="swiper-button-next" tabindex="0" role="button" aria-label="Next slide">
                                </div>
                                <span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
                            </div>
                        </div>
                        <header class="page-header">
                            <h1 class="page-h1"> <span style="color: #E13427;" class="star star-5"><i style="color: #e4f03c;" class="fas fa-star"></i>${fhouse.getRating()}</span>
                                <a style="color: #E13427;" href="">${fhouse.getTitle()}</a>
                            </h1>
                            <br/>
                            <div class="clearfix">
                                <address class="post-address"><i class="fas fa-map-marker-alt" style="margin-right: 10px"></i>Địa chỉ: ${fhouse.getFull_Address()}</address> 
                            </div>
                            <div class="post-attributes">
                                <div class="item price"><i></i><span
                                        style="color: #16c784; font-weight: bold; font-size: 1.5rem">${fhouse.getPrice()/1000000}triệu/tháng</span></div>
                                <div class="item acreage"><i class="fas fa-vector-square"></i><span> ${fhousedetail.getArea()}m<sup>2</sup></span></div>
                                <div class="item acreage"><i class="fas fa-bed"></i><span> ${fhousedetail.getNumber_Of_Bedrooms()}</span></div>
                                <div class="item acreage"><i class="fas fa-bath"></i><span> ${fhousedetail.getNumber_Of_Bathrooms()}</span></div>
                                <div class="item acreage"><i class="fas fa-swimming-pool"></i><span> ${fhousedetail.getPool()}</span></div>
                                <div class="item acreage"><i class="fas fa-compass"></i><span> ${fhousedirection.getDirection()}</span></div>
                                <!--                                <div class="item published"><i></i><span>4 giờ</span></div>
                                                                <div class="item hashtag"><i></i><span>202766</span></div>-->
                            </div>
                        </header>
                        <form action="createBill" method="post">
                            <h1>Hợp đồng thuê nhà</h1>
                            <input type="hidden" name="houseID" value="${requestScope.fhouse.getId()}">
                            <div class="form-group row">
                                <label for="owner" class="col-sm-2 col-form-label col-form-label-sm">Tên người cho thuê</label>
                                <div class="col-sm-10">
                                   <input type="text" class="form-control" id="owner" name="owner" value="${finforowner.getFullName()}" readonly=""> 
                                </div>
                                
                            </div>
                            <div class="form-group row">
                                <label for="tenant" class="col-sm-2 col-form-label col-form-label-sm">Tên người thuê</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="tenant" name="tenant" value="${sessionScope.acc.getFullname()}" readonly="">
                                </div>
                                
                            </div>
                            <div class="form-group row">
                                <label for="tenant" class="col-sm-2 col-form-label col-form-label-sm">Ngày bắt đầu</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="date" name="startDate" required="">
                                </div>
                                
                            </div>
                            <div class="form-group row">
                                <label for="tenant" class="col-sm-2 col-form-label col-form-label-sm">Ngày kết thúc</label>
                                
                                <div class="col-sm-10">
                                   <input class="form-control" type="date" name="endDate" required="">
                                </div>
                            </div>
                            <div class="form-group row text-center">
                                <button  type="submit">Tạo</button>
                                <button type="reset">Đặt lại</button>
                            </div>
                        </form>
                    </article>
                </div>
            </div>
        </main>
    </div>
</body>
