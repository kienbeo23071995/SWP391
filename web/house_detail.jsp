<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 06:20:15 AM
    Author     : kienb
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
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
    <body>
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
                            <section class="section post-main-content">
                                <div class="section-header">
                                    <h2 class="section-title">Thông tin mô tả</h2>
                                </div>
                                <div class="section-content">
                                    <p>${fhouse.getDescription()}</p>
                                </div>
                            </section>
                            <section class="section post-overview">
                                <div class="section-header">
                                    <h3 class="section-title">Đặc điểm tin đăng</h3>
                                </div>
                                <div class="section-content">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td class="name">Mã tin:</td>
                                                <td>#${fhouse.getId()}</td>
                                            </tr>
                                            <tr>
                                                <td class="name">Quận:</td>
                                                <td>${fdistrict.getDistrict()}</td>
                                            </tr>
                                            <tr>
                                                <td class="name">Loại nhà:</td>
                                                <td>${fhousecategory.getCategory()}</td>
                                            </tr>
                                            <tr>
                                                <td class="name">Đối tượng thuê:</td>
                                                <td>Tất cả</td>
                                            </tr>
                                            <tr>
                                                <td class="name">Ngày đăng:</td>
                                                <td><time>${fhouse.getAdded_Date()}</time>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <section class="section post-contact">
                                <div class="section-header">
                                    <h3 class="section-title">Thông tin liên hệ</h3>
                                </div>
                                <div class="section-content">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td class="name">Liên hệ:</td>
                                                <td> ${finforowner.getFullName()} </td>
                                            </tr>
                                            <tr>
                                                <td class="name">Điện thoại:</td>
                                                <td> ${finforowner.getPhoneNumber()} </td>
                                            </tr>
                                            <tr>
                                                <td class="name">Email:</td>
                                                <td> ${finforowner.getEmail()} </td>
                                            </tr>
                                            <tr>
                                                <td class="name">Địa chỉ:</td>
                                                <td> ${finforowner.getAddress()} </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </section>
                            <section class="section post-map">
                                <div id="comment">
                                    <h2>Ðánh giá</h2>
                                    <c:if test="${sessionScope.acc != null}">
                                        <div class="box-comment-2020">
                                            <textarea style="width: 100%;height: 100px" id="comment_reply_content_0" placeholder="Mời bạn để lại bình luận..." name="content"></textarea>
                                            <div class="actions-comment-2020 js-actions-comment-2020">
                                                <div class="actions-comment-wrap">
                                                    <div class="cmt_right float-right" style="float: right">
                                                        <button style="text-decoration: none" type="button" class="btn btn-success" onclick="reviewReply()">Gửi bình luận</button>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </c:if>

                                    <div class="list-comment-2020" style="margin-top: 8%">
                                        <div id="js-show-comment-list">
                                            <c:forEach items="${requestScope.feedbacks}" var="i">
                                                <div class="item-comment-2020">
                                                    <div class="user-info">
                                                        <div class="first-letter js-first-letter loaded">c</div>
                                                        <span class="ten-khach-hang">${i.sender.getFullname()}</span>              
                                                        <span class="comment-time"><fmt:formatDate value="${i.getFeedback_Date()}" pattern="dd/MM/yyyy" /></span>
                                                    </div>
                                                    <div style="margin-top: 4%;display: flex;width: 100%" class="information row">
                                                        <textarea onkeypress="UpdateComment(event,${i.getId()})" id="feedback${i.getId()}" disabled="" class="comment-content-2020" style="width: 80%;height: 100%;margin-right: 2%">${i.getContent()}</textarea>
                                                        <c:if test="${sessionScope.acc != null && i.getSender_ID() == sessionScope.acc.getId()}">
                                                            <button style="height: 40%;font-size:24px;margin-right: 2%;cursor: pointer" onclick="window.window.location.href = '${pageContext.request.contextPath}/deleteFeedback?id=${i.getId()}&houseid=${requestScope.fhouse.getId()}'"><i class="fa fa-trash"></i></button>
                                                            <button style="height: 40%;font-size:24px;margin-right: 2%;cursor: pointer" onclick="editComment('feedback${i.getId()}')"><i class="fa fa-edit"></i></button>
                                                            </c:if>
                                                    </div>
                                                </div>            
                                            </c:forEach>                   
                                        </div>
                                        <div id="js-show-comment-paging" style="text-align: center; margin: 20px auto;">
                                            <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                <a style="${requestScope.pageNum == i ? 'color : red' : ''}" href="detailhouse?id=${requestScope.fhouse.getId()}&pageNum=${i}">${i}</a>
                                            </c:forEach>
                                        </div>
                                    </div>

                                </div>
                            </section>
                        </article>
                    </div>
                    <aside id="aside">
                        <div class="author-aside">
                            <!--                        https://phongtro123.com/images/default-user.png-->
                            <figure class="author-avatar"><img src="./assets/images/${finforowner.getProfilePicture()}">
                            </figure><span class="author-name">${finforowner.getFullName()}</span>
                            <div style="min-height: 16px; margin-bottom: 10px;">
                                <div class="author-online-status online" author_id="29210"><i></i><span>Đang hoạt
                                        động</span></div>
                            </div>
                            <a class="btn author-phone" rel="nofollow" href="tel:${finforowner.getPhoneNumber()}"><i class="fas fa-phone-alt"></i> ${finforowner.getPhoneNumber()}</a>
                            <a class="btn author-zalo" target="_blank" rel="nofollow" href="https://zalo.me/0909913596"><i class="fab fa-facebook-messenger"></i> Nhắn tin</a>
                            <c:if test="${sessionScope.acc != null}">
                                <span onclick="window.location.href='${pageContext.request.contextPath}/changeStatus?id=${requestScope.fhouse.getId()}&uid=${sessionScope.acc.getId()}'" class="btn post-save js-btn-save saved"><i class="fas fa-heart"></i>Yêu thích</span>
                            </c:if>
                        </div>
                        <section class="section section-aside-tinmoidang">
                            <div class="section-header"><span class="section-title">Tin nổi bật</span></div>
                            <c:forEach items="${lsH}" var="h">
                                <ul class="post-listing aside clearfix">
                                    <li class="post-item clearfix tin-vip vipnoibat" post-id="58962"><a
                                            href="detailhouse?id=${h.getId()}">
                                            <figure><img class="lazy_done"
                                                         src="./assets/images/${h.getImage()}"
                                                         height="100" width="100" layout="responsive" data-loaded="true">
                                            </figure>
                                            <div class="post-meta">
                                                <span class="post-title" style="color: #E13427;">
                                                    <span class="star star-5"></span>
                                                    ${h.getTitle()}
                                                </span>
                                                <span class="post-price">${h.getPrice()/1000000}triệu/tháng</span>
                                                <time class="post-time"></time>
                                            </div>
                                        </a></li>
                                </ul>
                            </c:forEach>
                        </section>
                        <section class="section section-sublink">
                            <div class="section-header"><span class="section-title">Có thể bạn quan tâm</span></div>
                            <ul class="list-links clearfix">
                                <li><a href="/news/hop-dong-thue-nha-tro-phong-tro"
                                       title="Mẫu hợp đồng cho thuê phòng trọ">Mẫu hợp đồng cho thuê phòng trọ</a></li>
                                <li><a href="/kinh-nghiem/kinh-nghiem-thue-phong-tro-tranh-bi-lua-gat.html"
                                       title="Cẩn thận các kiểu lừa đảo khi thuê phòng trọ">Cẩn thận các kiểu lừa đảo khi
                                        thuê phòng trọ</a></li>
                                <li><a href="/kinh-nghiem/chia-se-10-kinh-nghiem-khi-thue-phong-tro-cho-sinh-vien.html"
                                       title="Kinh nghiệm thuê phòng trọ cho Sinh Viên">Kinh nghiệm thuê phòng trọ Sinh
                                        Viên</a></li>
                            </ul>
                        </section>
                    </aside>
                </div>
            </main>

        </div>
        <script type="text/javascript">
            function reviewReply() {
                $.ajax({
                    type: 'POST',
                    url: "${pageContext.request.contextPath}/addFeedBack",
                    data: {
                        content: $('#comment_reply_content_0').val(),
                        houseid: ${requestScope.fhouse.getId()}
                    },
                    success: function (data, textStatus, jqXHR) {
                        var list = JSON.parse(data);
                        var html = '';
                        var id = ${sessionScope.acc.getId()};
                        var size = list.length > 5 ? 5 : list.length;
                        for (let idx = 0; idx < size; idx++) {
                            html += '<div class="item-comment-2020">';
                            html += '<div class="user-info">';
                            html += '<div class="first-letter js-first-letter loaded">c</div>';
                            html += '<span class="ten-khach-hang">' + list[idx].sender.Fullname + '</span>';
                            html += '<span class="comment-time">' + list[idx].Feedback_Date + '</span>';
                            html += '</div>';
                            html += '<div style="margin-top: 4%" class="information">';
                            html += '<textarea disabled="" class="comment-content-2020" style="width: 80%;height: 100%;margin-right: 2%">' + list[idx].Content + '</textarea>';
                            if (id === Number(list[idx].Sender_ID)) {
                                html += '<button style="height: 40%;font-size:24px;margin-right: 2%"><i class="fa fa-trash"></i></button>';
                                html += '<button style="height: 40%;font-size:24px;margin-right: 2%"><i class="fa fa-edit"></i></button>';
                            }
                            html += '</div>';
                            html += '</div>';
                        }
                        $('#js-show-comment-list').html(html);
                        var totalPage = list.length % 5 === 0 ? list.length / 5 : (list.length / 5 + 1);
                        var paging = '';
                        for (let idx = 1; idx <= totalPage; idx++) {
                            if (idx === 1) {
                                paging += '<a style="color:red" href="detailhouse?id=' + list[0].House_ID + '&pageNum=' + idx + '">' + idx + '</a>';
                            } else {
                                paging += '<a href="detailhouse?id=' + list[0].House_ID + '&pageNum=' + idx + '">' + idx + '</a>';
                            }
                        }
                        $('#js-show-comment-paging').html(paging);
                    }
                })
            }

            function editComment(id) {
                $('#' + id).prop("disabled", false);
            }

            function UpdateComment(e, i) {
                if (e.which === 13) {
                    var pageNum = ${requestScope.pageNum};
                    $.ajax({
                        type: 'POST',
                        url: "${pageContext.request.contextPath}/updateFeedBack",
                        data: {
                            id: i,
                            content: $('#feedback' + i).val(),
                            houseid: ${requestScope.fhouse.getId()}
                        },
                        success: function (data, textStatus, jqXHR) {
                            $('#feedback' + i).attr("disabled", true);
                            var list = JSON.parse(data);
                            var html = '';
                            var id = ${sessionScope.acc.getId()};
                            var size = pageNum * 5;
                            for (let idx = (pageNum - 1) * 5; idx < size; idx++) {
                                html += '<div class="item-comment-2020">';
                                html += '<div class="user-info">';
                                html += '<div class="first-letter js-first-letter loaded">c</div>';
                                html += '<span class="ten-khach-hang">' + list[idx].sender.Fullname + '</span>';
                                html += '<span class="comment-time">' + list[idx].Feedback_Date + '</span>';
                                html += '</div>';
                                html += '<div style="margin-top: 4%" class="information">';
                                html += '<textarea disabled="" class="comment-content-2020" style="width: 80%;height: 100%;margin-right: 2%">' + list[idx].Content + '</textarea>';
                                if (id === Number(list[idx].Sender_ID)) {
                                    html += '<button style="height: 40%;font-size:24px;margin-right: 2%"><i class="fa fa-trash"></i></button>';
                                    html += '<button style="height: 40%;font-size:24px;margin-right: 2%"><i class="fa fa-edit"></i></button>';
                                }
                                html += '</div>';
                                html += '</div>';
                            }
                            $('#js-show-comment-list').html(html);
                            var totalPage = list.length % 5 === 0 ? list.length / 5 : (list.length / 5 + 1);
                            var paging = '';
                            for (let idx = 1; idx <= totalPage; idx++) {
                                if (idx === pageNum) {
                                    paging += '<a style="color:red" href="detailhouse?id=' + list[0].House_ID + '&pageNum=' + idx + '">' + idx + '</a>';
                                } else {
                                    paging += '<a href="detailhouse?id=' + list[0].House_ID + '&pageNum=' + idx + '">' + idx + '</a>';
                                }
                            }
                            $('#js-show-comment-paging').html(paging);
                        }
                    })
                }
            }
        </script>
        <jsp:include page="footer.jsp"></jsp:include>  
    </body>
</html>
