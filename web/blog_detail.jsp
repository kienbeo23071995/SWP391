<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 07:30:15 AM
    Author     : kienb
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/blog_detail.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <title>Blog_detail</title>
        <style>
            .page-header {
                display: flex;
                align-items: center;
            }
            .page-h1 {
                margin-right: 10px; /* Khoảng cách giữa tiêu đề và trái tim */
            }
            .active{
                color:red;
                cursor: default;
            }
            #favoblog ion-icon{
                color:red;
                font-size: 30px;
                transition: 0.5s;
                transition-timing-function: ease;
            }
            #nonfavoblog ion-icon{
                color: black;
                font-size: 30px;
                transition: 0.5s;
                transition-timing-function: ease;
            }
            #na {
                display: flex;
                align-items: center;
            }
            .fa-heart {
                color: black;
            }
            .fa-heart.active {
                color: red;
            }
            .cmtcontent {
                display: flex;
                align-items: center;
            }

            .cmtimg img {
                width: 50px;
                height: 50px;
                border-radius: 50%;
            }

            .cmttext {
                margin-left: 10px;
            }

            .cmtname h6 {
                margin: 0;
            }

            .cmtbl {
                display: flex;
                align-items: center;
            }
             .optionP{
                display: flex;
                justify-content: center;
                align-items: center;
                width: 5%;
                height: 2em;
                position: absolute;
                top: 0;
                right: 0;
                border-radius: 50%;
            }
            .optionP:hover{
                background-color: #cccccc;
                color: black;
                cursor: pointer;
            }
            .optionP ion-icon{
                font-size: 20px;
            }
            .listOption{
                background-color: #333333;
                box-shadow: 0 0 5px black;
                border-radius: 10px;
                position: absolute;
                right: 0;
                top:2em;
            }
            .listOption a{
                display: inline-flex;
                text-decoration: none;
                color: white;
                padding: 1em 1em;
                width: 100%;
                line-height: 1em;
            }
            .listOption a:hover{
                background-color: #cccccc;
                border-radius: 10px;
                color: black;
            }
            .cmt{
                border-top: 1px solid black;
            }
            .cmtcontent{
                display: flex;
                width: 95%;
                height: auto;
                margin: 0.5em auto;
            }
            .lastcontent{
                position: relative;
            }
            .firstcontent{
                margin-bottom: 0.5em;
            }
            .cmtimg{
                width: 8%;
                height: 3em;
            }
            .cmtimg img{
                margin-top: 0.5em;
                width: 100%;
                height: 3em;
                border-radius: 50%;
            }
            .cmttext{
                margin: 0 auto;
                width: 90%;
                height: auto;
            }
            .cmtname{
                padding-top: 0.2em;
                height: 1.8em;
                width: 100%;
            }
            .cmtname h6{
                margin-bottom: 0;
            }

            .cmtbl{
                display: flex;
            }
            .cmtbl input{
                width: 92%;
                border-radius: 10px;
            }
            .cmtbl p{
                color: black;
            }
        </style>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main id="main">
                <div class="container clearfix">
                    <div id="left-col">
                        <article class="the-article">
                            <div id="breadcrumb">
                                <ol class="clearfix">
                                    <li class="first link"><a href="homeController" title="Trang chủ"><span>Trang
                                                chủ</span></a></li>
                                    <li class="link last"><a href="listblog"
                                                             title="Tin tức"><span>Tin tức</span></a></li>
                                </ol>
                            </div>

                            <header class="page-header">
                                <h1 class="page-h1">${b.getTopic()}</h1>
                            <c:if test="${sessionScope.acc!=null}">
                                <div id="${na}">
                                    <a href="favouriteblog?blogId=${b.getId()}&userId=${sessionScope.acc.getId()}"><ion-icon name="heart"></ion-icon></a>
                                </div>
                            </c:if>
                            </header>
                        <div class="article-main-content">
                            <figure>
                                <img
                                    src="./assets/images/${b.getImage()}"
                                    alt="#" width="960" height="720">
                            </figure>
                            <p>${b.getContent()}</p>
                        </div>
                        <div class="cmt">
                            <h2 style="margin-left: 0.5em;">Bình luận</h2>
                            <c:forEach items="${lsC}" var="c">
                                <div class="cmtcontent lastcontent">
                                    <div class="cmtimg">
                                        <img src="./assets/images/${c.getProfilePicture()}" alt="alt"/>
                                    </div>
                                    <div class="cmttext">
                                        <div class="cmtname"><h6>${c.getFullName()}</h6></div>
                                        <div class="cmtbl">
                                            <form id="${c.getId()}f" method="get" action="editcommentblog">
                                                <input name="idBlog" value="${b.getId()}" type="hidden"/>
                                                <input name="id" value="${c.getId()}" type="hidden"/>
                                                <input name="v" id="${c.getId()}a" style="border: none" type="text" value="${c.getContent()}" readonly=""/>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- Fix -->
                                    <c:if test="${c.getCommenterId() == sessionScope.acc.getId()}">
                                        <div class="optionP" onclick="showList('${c.getId()}')"> <i class="fas fa-ellipsis-h"></i></div>
                                    </c:if>
                                            <div id="${c.getId()}" class="listOption" style="display: none;">
                                                <div><a onclick="eidtcom('${c.getId()}a', '${c.getId()}')" href="#"><i class="far fa-edit"></i><span>Sửa</span></a></div>
                                                <div><a href="deletecommentblog?id=${c.getId()}&idBlog=${b.getId()}"><i class="fas fa-trash-alt"></i><span>Xóa</span></a></div>
                                            </div>
                                    </div>
                            </c:forEach>
                            <c:if test="${sessionScope.acc != null}">
                                <form action="commentblog" method="post">

                                    <input type="hidden" value="${b.getId()}" name="idBlog">
                                    <div class="cmtcontent firstcontent">
                                        <div class="cmtimg">
                                            <img src="./assets/images/${sessionScope.acc.getProfile_Picture()}" alt="alt"/>
                                        </div>
                                        <div class="cmttext">
                                            <div class="cmtname"><h6>${sessionScope.acc.getFullname()}</h6></div>
                                            <div class="cmtbl">
                                                <input type="text" name="ctxt">
                                                <input style="margin-left: 0.5em;width: 10%;cursor: pointer;background-color: #6699ff;color: white" type="submit" value="Gửi">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </c:if>
                        </div>
                    </article>
                    <section class="section section-blog-listing">
                        <div class="section-header"><span class="section-title">Có thể bạn quan tâm</span></div>
                        <div class="section-content">
                            <div class="blog-listing">
                                <div class="inner">
                                    <article class="article-item clearfix"><a
                                            href="/khuyen-mai-dac-biet-cho-thanh-vien-moi.html">
                                            <figure><img class="lazy_done"
                                                         src="https://phongtro123.com/img/thumb_default.jpg"
                                                         data-src="https://phongtro123.com/img/thumb_default.jpg"
                                                         data-loaded="true"></figure>
                                            <div class="article-meta">
                                                <h6 class="article-title">Khuyến mãi đặc biệt cho thành viên mới</h6>
                                                <p class="article-summary">TẶNG 50% GIÁ TRỊ NẠP TIỀN CHO THÀNH VIÊN
                                                    MỚI&nbsp;Trong vòng 5 ngày kể từ khi đăng ký, thành viên mới được
                                                    tặng 50% giá trị nạp khi nạp từ 100.000 đồng…</p>
                                            </div>
                                        </a></article>
                                    <article class="article-item clearfix"><a
                                            href="/chuong-trinh-khuyen-mai-phongtro123.html">
                                            <figure><img class="lazy_done"
                                                         src="https://phongtro123.com/img/thumb_default.jpg"
                                                         data-src="https://phongtro123.com/img/thumb_default.jpg"
                                                         data-loaded="true"></figure>
                                            <div class="article-meta">
                                                <h6 class="article-title">Chương trình khuyến mãi phongtro123</h6>
                                                <p class="article-summary">CHƯƠNG TRÌNH KHUYẾN MÃI THÁNG 07/2023* Áp
                                                    dụng cho khách hàng gắn bó lâu năm.* Thời gian áp dụng: 10/07 -
                                                    15/07/2023Khách hàng nạp tiền từ 100.000 đồng…</p>
                                            </div>
                                        </a></article>
                                    <article class="article-item clearfix"><a
                                            href="/cac-cong-ty-chuyen-nha-tro-uy-tin-nhat-hien-nay.html">
                                            <figure><img class="lazy_done"
                                                         src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/06/23/chuyen-tro-taxi-tai-sai-gon-saigonexpress_1655952471.jpg"
                                                         data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/06/23/chuyen-tro-taxi-tai-sai-gon-saigonexpress_1655952471.jpg"
                                                         data-loaded="true"></figure>
                                            <div class="article-meta">
                                                <h6 class="article-title">Các công ty chuyển nhà trọ uy tín nhất hiện
                                                    nay</h6>
                                                <p class="article-summary">Các công ty cung cấp dịch vụ chuyển nhà trọ
                                                    uy tín tại thành phố Hồ Chí MinhĐây đều là những đơn vị cung cấp
                                                    dịch vụ chuyển nhà trọ chất lượng,…</p>
                                            </div>
                                        </a></article>
                                    <article class="article-item clearfix"><a
                                            href="/co-nen-dau-tu-cho-thue-can-ho-azura-khong.html">
                                            <figure><img class="lazy_done"
                                                         src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/03/29/con-nen-chon-thue-can-ho-azura-khong_1648541295.jpg"
                                                         data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/03/29/con-nen-chon-thue-can-ho-azura-khong_1648541295.jpg"
                                                         data-loaded="true"></figure>
                                            <div class="article-meta">
                                                <h6 class="article-title">Có nên đầu tư cho thuê căn hộ Azura không?
                                                </h6>
                                                <p class="article-summary">1. Tổng quan dự án căn hộ AzuraĐể biết chính
                                                    xác Azura có phải dòng căn hộ xứng đáng để đầu tư hay không. Việc
                                                    tìm hiểu và nắm bắt những thông tin…</p>
                                            </div>
                                        </a></article>
                                    <article class="article-item clearfix"><a
                                            href="/top-5-trang-web-cho-thue-nha-nguyen-can-gia-re-tai-viet-nam.html">
                                            <figure><img class="lazy_done"
                                                         src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/03/19/blog-top-5-trang-web-cho-thue-nha-nguyen-can-gia-re-tai-viet-nam_1647671932.jpg"
                                                         data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/03/19/blog-top-5-trang-web-cho-thue-nha-nguyen-can-gia-re-tai-viet-nam_1647671932.jpg"
                                                         data-loaded="true"></figure>
                                            <div class="article-meta">
                                                <h6 class="article-title">Top 5 trang web cho thuê nhà nguyên căn giá rẻ
                                                    tại Việt Nam</h6>
                                                <p class="article-summary">1) Chothuenha.me - Trang web cho thuê nhà
                                                    nguyên căn, nhà riêng số 1 VNĐầu tiên trong danh sách đó là
                                                    Chothuenha.me - Trang web cho thuê nhà riêng nguyên căn số 1 VN.
                                                    Ngay…</p>
                                            </div>
                                        </a></article>
                                    <article class="article-item clearfix"><a
                                            href="/diem-noi-bat-cua-can-ho-legacy-central-la-gi.html">
                                            <figure><img class="lazy_done"
                                                         src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/03/09/legacy-central-binh-duong_1646808335.jpg"
                                                         data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2022/03/09/legacy-central-binh-duong_1646808335.jpg"
                                                         data-loaded="true"></figure>
                                            <div class="article-meta">
                                                <h6 class="article-title">Điểm nổi bật của căn hộ Legacy Central là gì?
                                                </h6>
                                                <p class="article-summary">Khởi công chính thức từ tháng 7 năm 2020, đợt
                                                    mở bán đầu tiên của dự án đã “tẩu tán” hoàn toàn 300 căn hộ. Vậy,
                                                    điểm nổi bật của căn hộ Legacy…</p>
                                            </div>
                                        </a></article>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                <aside id="aside">
                    <section class="section section-aside-tinmoidang">
                        <div class="section-header"><span class="section-title">Tin mới đăng</span></div>
                        <ul class="post-listing aside clearfix">
                            <li class="post-item clearfix normal" post-id="630167">
                                <script
                                type="application/ld+json"> { "@type":"Hostel", "@context":"http://schema.org", "name": "Cho thuê phòng Studio - Gác Phan Đăng Lưu - Phan Tây Hồ P7 Phú Nhuận", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"Đường Phan Tây Hồ, Phường 7, Quận Phú Nhuận, Hồ Chí Minh", "addressLocality":"Quận Phú Nhuận", "addressRegion":"Quận Phú Nhuận", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/cho-thue-phong-studio-gac-phan-dang-luu-phan-tay-ho-p7-phu-nhuan-pr630167.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/z4509818617591-18f0ca764eac37e90625382f768a5acd_1689148827.jpg", "priceRange": "5500000", "telephone": "0377534777" }</script>
                                <a
                                    href="/cho-thue-phong-studio-gac-phan-dang-luu-phan-tay-ho-p7-phu-nhuan-pr630167.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/z4509818617591-18f0ca764eac37e90625382f768a5acd_1689148827.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/z4509818617591-18f0ca764eac37e90625382f768a5acd_1689148827.jpg"
                                                 alt="Cho thuê phòng Studio - Gác Phan Đăng Lưu - Phan Tây Hồ P7 Phú Nhuận"
                                                 height="100" width="100" layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Cho thuê
                                            phòng Studio - Gác Phan Đăng Lưu - Phan… </span><span class="post-price">5.5
                                            triệu/tháng</span><time class="post-time" title="Thứ 4, 15:00 12/07/2023">6
                                            phút trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix tin-vip vip3" post-id="630165">
                                <script
                                type="application/ld+json"> { "@type":"SingleFamilyResidence", "@context":"http://schema.org", "name": "Khai trương căn hộ mini đường Cộng Hòa", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"Đường Cộng Hòa, Phường 13, Quận Tân Bình, Hồ Chí Minh", "addressLocality":"Quận Tân Bình", "addressRegion":"Quận Tân Bình", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/khai-truong-can-ho-mini-duong-cong-hoa-pr630165.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/z4506329833439-19a2b65f15799226d72beb95df973990_1689147998.jpg", "floorSize": "25", "telephone": "0904008395" }</script>
                                <a href="/khai-truong-can-ho-mini-duong-cong-hoa-pr630165.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/z4506329833439-19a2b65f15799226d72beb95df973990_1689147998.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/z4506329833439-19a2b65f15799226d72beb95df973990_1689147998.jpg"
                                                 alt="Khai trương căn hộ mini đường Cộng Hòa" height="100" width="100"
                                                 layout="responsive" data-loaded="true"><span class="has-video"></span>
                                    </figure>
                                    <div class="post-meta"><span class="post-title" style="color: #3763e0;"><span
                                                class="star star-2"></span> Khai trương căn hộ mini đường Cộng Hòa
                                        </span><span class="post-price">3.9 triệu/tháng</span><time class="post-time"
                                                                                                    title="Thứ 4, 14:47 12/07/2023">19 phút trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630159">
                                <script
                                type="application/ld+json"> { "@type":"Hostel", "@context":"http://schema.org", "name": "Phòng gác lửng, máy lạnh gần BigC Trường Chinh,Tân Bình", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"66 Đường Nguyễn Sỹ Sách, Phường 15, Quận Tân Bình, Hồ Chí Minh", "addressLocality":"Quận Tân Bình", "addressRegion":"Quận Tân Bình", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/phong-gac-lung-may-lanh-gan-bigc-truong-chinh-tan-binh-pr630159.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/2e627af1-172c-4a59-9990-30eda2627182_1689147475.jpg", "priceRange": "3500000", "telephone": "0796707016" }</script>
                                <a href="/phong-gac-lung-may-lanh-gan-bigc-truong-chinh-tan-binh-pr630159.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/2e627af1-172c-4a59-9990-30eda2627182_1689147475.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/2e627af1-172c-4a59-9990-30eda2627182_1689147475.jpg"
                                                 alt="Phòng gác lửng, máy lạnh gần BigC Trường Chinh,Tân Bình" height="100"
                                                 width="100" layout="responsive" data-loaded="true"><span
                                                 class="has-video"></span></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Phòng gác
                                            lửng, máy lạnh gần BigC Trường… </span><span class="post-price">3.5
                                            triệu/tháng</span><time class="post-time" title="Thứ 4, 14:38 12/07/2023">28
                                            phút trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630155">
                                <script
                                type="application/ld+json"> { "@type":"SingleFamilyResidence", "@context":"http://schema.org", "name": "Cho thuê căn hộ mini , khu VCN Phước Long ( đi đường 22)", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"12 A2, Phường Phước Long, Thành Phố Nha Trang, Khánh Hòa", "addressLocality":"Thành Phố Nha Trang", "addressRegion":"Thành Phố Nha Trang", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/cho-thue-can-ho-mini-khu-vcn-phuoc-long-di-duong-22-pr630155.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/3fbb0c10fe742e2a776519_1689145522.jpg", "floorSize": "45", "telephone": "0774556789" }</script>
                                <a href="/cho-thue-can-ho-mini-khu-vcn-phuoc-long-di-duong-22-pr630155.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/3fbb0c10fe742e2a776519_1689145522.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/3fbb0c10fe742e2a776519_1689145522.jpg"
                                                 alt="Cho thuê căn hộ mini , khu VCN Phước Long ( đi đường 22)" height="100"
                                                 width="100" layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Cho thuê
                                            căn hộ mini , khu VCN Phước Long ( đi… </span><span class="post-price">3.2
                                            triệu/tháng</span><time class="post-time" title="Thứ 4, 14:31 12/07/2023">34
                                            phút trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630156">
                                <script
                                type="application/ld+json"> { "@type":"Hostel", "@context":"http://schema.org", "name": "PHÒNG TRỌ DUPLEX ĐẦY ĐỦ NỘI THẤT NGAY TÂY THẠNH - LÊ TRỌNG TẤN( GẦN NGÃ 4 GÒ MÂY)", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"Đường Tây Thạnh, Phường Tây Thạnh, Quận Tân Phú, Hồ Chí Minh", "addressLocality":"Quận Tân Phú", "addressRegion":"Quận Tân Phú", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/phong-tro-duplex-day-du-noi-that-ngay-tay-thanh-le-trong-tan-gan-nga-4-go-may-pr630156.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-5450_1689146560.jpg", "priceRange": "3400000", "telephone": "0374972839" }</script>
                                <a
                                    href="/phong-tro-duplex-day-du-noi-that-ngay-tay-thanh-le-trong-tan-gan-nga-4-go-may-pr630156.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-5450_1689146560.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-5450_1689146560.jpg"
                                                 alt="PHÒNG TRỌ DUPLEX ĐẦY ĐỦ NỘI THẤT NGAY TÂY THẠNH - LÊ TRỌNG TẤN( GẦN NGÃ 4 GÒ MÂY)"
                                                 height="100" width="100" layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> PHÒNG TRỌ
                                            DUPLEX ĐẦY ĐỦ NỘI THẤT NGAY TÂY… </span><span class="post-price">3.4
                                            triệu/tháng</span><time class="post-time" title="Thứ 4, 14:22 12/07/2023">44
                                            phút trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630154">
                                <script
                                type="application/ld+json"> { "@type":"Hostel", "@context":"http://schema.org", "name": "Chính chủ cho thuê phòng trọ có gác xép", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"141A Đường Lý Chính Thắng, Phường 7, Quận 3, Hồ Chí Minh", "addressLocality":"Quận 3", "addressRegion":"Quận 3", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/chinh-chu-cho-thue-phong-tro-co-gac-xep-pr630154.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/nha5_1689145833.jpg", "priceRange": "4000000", "telephone": "0908178746" }</script>
                                <a href="/chinh-chu-cho-thue-phong-tro-co-gac-xep-pr630154.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/nha5_1689145833.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/nha5_1689145833.jpg"
                                                 alt="Chính chủ cho thuê phòng trọ có gác xép" height="100" width="100"
                                                 layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Chính chủ
                                            cho thuê phòng trọ có gác xép </span><span class="post-price">4
                                            triệu/tháng</span><time class="post-time" title="Thứ 4, 14:11 12/07/2023">55
                                            phút trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630153">
                                <script
                                type="application/ld+json"> { "@type":"Hostel", "@context":"http://schema.org", "name": "Cho thuê phòng trọ ngõ 562 Trần Cung, Cổ Nhuế 1, Băc Từ Liêm, Hà Nội", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"Đường Trần Cung, Phường Cổ Nhuế 1, Quận Bắc Từ Liêm, Hà Nội", "addressLocality":"Quận Bắc Từ Liêm", "addressRegion":"Quận Bắc Từ Liêm", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/cho-thue-phong-tro-ngo-562-tran-cung-co-nhue-1-bac-tu-liem-ha-noi-pr630153.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-20230708-200638_1689144479.jpg", "priceRange": "2", "telephone": "0975535286" }</script>
                                <a
                                    href="/cho-thue-phong-tro-ngo-562-tran-cung-co-nhue-1-bac-tu-liem-ha-noi-pr630153.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-20230708-200638_1689144479.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-20230708-200638_1689144479.jpg"
                                                 alt="Cho thuê phòng trọ ngõ 562 Trần Cung, Cổ Nhuế 1, Băc Từ Liêm, Hà Nội"
                                                 height="100" width="100" layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Cho thuê
                                            phòng trọ ngõ 562 Trần Cung, Cổ Nhuế… </span><span class="post-price">2
                                            đồng/tháng</span><time class="post-time" title="Thứ 4, 13:50 12/07/2023">1
                                            giờ trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630152">
                                <script
                                type="application/ld+json"> { "@type":"Hostel", "@context":"http://schema.org", "name": "Phòng mới xây - full TIỆN NGHI - gần Ngã Tư Hàng Xanh", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"203 Đường Quốc Lộ 13, Phường 26, Quận Bình Thạnh, Hồ Chí Minh", "addressLocality":"Quận Bình Thạnh", "addressRegion":"Quận Bình Thạnh", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/phong-moi-xay-full-tien-nghi-gan-nga-tu-hang-xanh-pr630152.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-1688218843211-1688724307271_1689144075.jpg", "priceRange": "3800000", "telephone": "0946953219" }</script>
                                <a href="/phong-moi-xay-full-tien-nghi-gan-nga-tu-hang-xanh-pr630152.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-1688218843211-1688724307271_1689144075.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/img-1688218843211-1688724307271_1689144075.jpg"
                                                 alt="Phòng mới xây - full TIỆN NGHI - gần Ngã Tư Hàng Xanh" height="100"
                                                 width="100" layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Phòng mới
                                            xây - full TIỆN NGHI - gần Ngã Tư… </span><span class="post-price">3.8
                                            triệu/tháng</span><time class="post-time" title="Thứ 4, 13:41 12/07/2023">1
                                            giờ trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630151">
                                <script
                                type="application/ld+json"> { "@type":"Hostel", "@context":"http://schema.org", "name": "Phòng Trọ cho Nữ thuê. An ninh, sạch sẻ.", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"Đường Bà Hạt, Phường 9, Quận 10, Hồ Chí Minh", "addressLocality":"Quận 10", "addressRegion":"Quận 10", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/phong-tro-cho-nu-thue-an-ninh-sach-se-2-pr630151.html", "image": "https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/baeea2b9-1987-4f4c-b9e5-c63150c6d77a_1689141606.jpg", "priceRange": "1600000", "telephone": "0767693266" }</script>
                                <a href="/phong-tro-cho-nu-thue-an-ninh-sach-se-2-pr630151.html">
                                    <figure><img class="lazy_done"
                                                 src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/baeea2b9-1987-4f4c-b9e5-c63150c6d77a_1689141606.jpg"
                                                 data-src="https://pt123.cdn.static123.com/images/thumbs/450x300/fit/2023/07/12/baeea2b9-1987-4f4c-b9e5-c63150c6d77a_1689141606.jpg"
                                                 alt="Phòng Trọ cho Nữ thuê. An ninh, sạch sẻ." height="100" width="100"
                                                 layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Phòng Trọ
                                            cho Nữ thuê. An ninh, sạch sẻ. </span><span class="post-price">1.6
                                            triệu/tháng</span><time class="post-time" title="Thứ 4, 13:27 12/07/2023">1
                                            giờ trước</time></div>
                                </a>
                            </li>
                            <li class="post-item clearfix normal" post-id="630150">
                                <script
                                type="application/ld+json"> { "@type":"SingleFamilyResidence", "@context":"http://schema.org", "name": "Cho thuê ccmn Quan Nhân, full tiện ích, an sinh tốt.", "address":{ "@type":"PostalAddress", "@context":"http://schema.org", "streetAddress":"16C Phố Quan Nhân, Phường Nhân Chính, Quận Thanh Xuân, Hà Nội", "addressLocality":"Quận Thanh Xuân", "addressRegion":"Quận Thanh Xuân", "postalCode":"" }, "geo": { "@type": "GeoCoordinates", "@context":"http://schema.org", "latitude": "", "longitude": "" }, "url":"https://phongtro123.com/cho-thue-ccmn-quan-nhan-full-tien-ich-an-sinh-tot-pr630150.html", "image": "https://phongtro123.com/img/thumb_default.jpg", "floorSize": "25", "telephone": "0914548899" }</script>
                                <a href="/cho-thue-ccmn-quan-nhan-full-tien-ich-an-sinh-tot-pr630150.html">
                                    <figure><img class="lazy_done" src="https://phongtro123.com/img/thumb_default.jpg"
                                                 data-src="https://phongtro123.com/img/thumb_default.jpg"
                                                 alt="Cho thuê ccmn Quan Nhân, full tiện ích, an sinh tốt." height="100"
                                                 width="100" layout="responsive" data-loaded="true"></figure>
                                    <div class="post-meta"><span class="post-title" style="color: #055699;"> Cho thuê
                                            ccmn Quan Nhân, full tiện ích, an sinh tốt. </span><span
                                            class="post-price">4.3 triệu/tháng</span><time class="post-time"
                                            title="Thứ 4, 13:01 12/07/2023">2 giờ trước</time></div>
                                </a>
                            </li>
                        </ul>
                    </section>
                    <section class="section section-sublink">
                        <div class="section-header"><span class="section-title">Có thể bạn quan tâm</span></div>
                        <ul class="list-links clearfix">
                            <li><a rel="nofollow" href="/news/hop-dong-thue-nha-tro-phong-tro"
                                   title="Mẫu hợp đồng cho thuê phòng trọ">Mẫu hợp đồng cho thuê phòng trọ</a></li>
                            <li><a rel="nofollow" href="/kinh-nghiem/kinh-nghiem-thue-phong-tro-tranh-bi-lua-gat.html"
                                   title="Cẩn thận các kiểu lừa đảo khi thuê phòng trọ">Cẩn thận các kiểu lừa đảo khi
                                    thuê phòng trọ</a></li>
                            <li><a rel="nofollow"
                                   href="/kinh-nghiem/chia-se-10-kinh-nghiem-khi-thue-phong-tro-cho-sinh-vien.html"
                                   title="Kinh nghiệm thuê phòng trọ cho Sinh Viên">Kinh nghiệm thuê phòng trọ Sinh
                                    Viên</a></li>
                        </ul>
                    </section>
                </aside>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- Popper js -->
        <script src="js/popper.min.js"></script>
        <!-- Bootstrap js -->
        <script src="js/bootstrap.min.js"></script>
        <!-- Plugins js -->
        <script src="js/plugins.js"></script>
        <script src="js/classy-nav.min.js"></script>
        <script src="js/jquery-ui.min.js"></script>
        <!-- Active js -->
        <script src="js/active.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
        <script>
                                            function showList(s) {
                                                var m = document.getElementById(s);
                                                if (m.style.display === "none") {
                                                    m.style.display = "block";
                                                } else {
                                                    m.style.display = "none";
                                                }
                                            }
                                            function eidtcom(x, s) {
                                                var input = document.getElementById(x);
                                                input.style.paddingLeft = '10px';
                                                input.removeAttribute("readonly");
                                                input.focus();
                                                showList(s);
                                            }
        </script>   
    </body>
</html>
