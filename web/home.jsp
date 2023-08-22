<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 06:23:20 AM
    Author     : kienb
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="vi-VN" itemscope="" itemtype="http://schema.org/WebPage" class="user_active">
    <head>
        <style>
            a.disabled {
                pointer-events: none;
                cursor: default;
            }
        </style>
        <link href="assets/css/toast.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <main id="main">
                <div style="height: 60px; margin-bottom: 10px;">
                    <section id="filter-top-inner">
                        <section id="filter-top">
                            <form class="filter-body" action="homeController">
                                <select id="category-select" name="categoryID" class="filter-item post-estate-type js-filter-show-popup-estate-type active">
                                    <option value="0" selected="">--- Chọn danh mục ---</option>
                                <c:forEach items="${requestScope.listCate}" var="i">
                                    <option value="${i.getId()}" ${i.getId() == requestScope.categoryID? 'selected' : ''}>${i.getCategory()}</option>
                                </c:forEach>
                            </select>   
                            <select id="district-select" class="filter-item location js-filter-show-popup-city" name="districtId">
                                <option value="0" selected="">--- Quận, huyện ---</option>
                                <c:forEach items="${requestScope.listdc}" var="i">
                                    <option value="${i.getId()}" ${i.getId() == requestScope.districtId? 'selected' : ''}>${i.getDistrict()}</option>
                                </c:forEach>
                            </select>
                            <select id="price-select" class="filter-item location js-filter-show-popup-city" name="price">
                                <option value="" selected="">--- Chọn giá ---</option>
                                <option value="0-999999">Dưới 1 triệu</option>
                                <option value="1000000-2000000">Từ 1 - 2 triệu</option>
                                <option value="2000000-3000000">Từ 2 - 3 triệu</option>
                                <option value="3000000-5000000">Từ 3 - 5 triệu</option>
                                <option value="5000000-7000000">Từ 5 - 7 triệu</option>
                                <option value="7000000-10000000">Từ 7 - 10 triệu</option>
                                <option value="10000000-15000000">Từ 10 - 15 triệu</option>
                                <option value="15000000-999999999">Trên 15 triệu</option>
                            </select>   
                            <select id="area-select" class="filter-item location js-filter-show-popup-city" name="area">
                                <option value="" selected="">--- Chọn diện tích ---</option>
                                <option value="0-24">Dưới 25 m<sup>2</sup></option>
                                <option value="25-30">Từ 25 - 30 m<sup>2</sup></option>
                                <option value="30-50">Từ 30 - 50 m<sup>2</sup></option>
                                <option value="50-70">Từ 50 - 70 m<sup>2</sup></option>
                                <option value="70-100">Từ 70 - 100 m<sup>2</sup></option>                           
                                <option value="100-999999999">Trên 100 m<sup>2</sup></option>                           
                            </select>  
                            <script type="text/javascript">
                                var districtSelect = document.getElementById('district-select');
                                var priceSelect = document.getElementById('price-select');
                                var categorySelect = document.getElementById('category-select');
                                var areaSelect = document.getElementById('area-select');

                                districtSelect.addEventListener('change', function () {
                                    localStorage.setItem('selectedDistrict', this.value);
                                });

                                priceSelect.addEventListener('change', function () {
                                    localStorage.setItem('selectedPrice', this.value);
                                });

                                categorySelect.addEventListener('change', function () {
                                    localStorage.setItem('selectedCategory', this.value);
                                });

                                areaSelect.addEventListener('change', function () {
                                    localStorage.setItem('selectedArea', this.value);
                                });

                                var selectedDistrict = localStorage.getItem('selectedDistrict');
                                var selectedPrice = localStorage.getItem('selectedPrice');
                                var selectedCategory = localStorage.getItem('selectedCategory');
                                var selectedArea = localStorage.getItem('selectedArea');
                                var categoryID = ${requestScope.categoryID != null ? requestScope.categoryID : ''};
                                var districtId = ${requestScope.districtId != null ? requestScope.districtId : ''};
                                var price = '${requestScope.price != null ? requestScope.price : ''}';
                                var area = '${requestScope.areaRange != null ? requestScope.areaRange : ''}';
                                if (selectedDistrict) {
                                    districtSelect.value = districtId !== null ? districtId : selectedDistrict;
                                }

                                if (selectedPrice) {
                                    priceSelect.value = price !== null ? price : selectedPrice;
                                }

                                if (selectedCategory) {
                                    categorySelect.value = categoryID !== null ? categoryID : selectedCategory;
                                }

                                if (selectedArea) {
                                    areaSelect.value = area !== null ? area : selectedArea;
                                }
                            </script>
                            <button class="filter-item submit" type="submit">Tìm kiếm</button>
                        </form>
                    </section>
                </section>
            </div>
            <header class="page-header welcome">
                <h1 class="page-h1">Kênh thông tin phòng trọ Hà Nội</h1>
            </header>
            <section class="section section-top-location">
            </section>
            <div class="container clearfix">
                <div id="left-col">
                    <section class="section section-post-listing">
                        <div class="section-header"><span class="section-title">Danh sách tin đăng</span></div>
                        <div class="post-sort">
                            <span>Sắp xếp: </span>
                            <c:if test="${sessionScope.searchSession == 0}">
                                <a class="${request.orderBy == 1? '' : 'active'}" href="homeController">Mặc định</a>
                                <a href="homeController?orderBy=1" class="${request.orderBy == 1? '' : 'active'}">Mới nhất</a>
                            </c:if>
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

                        <ul class="post-listing clearfix">
                            <c:forEach items="${requestScope.list}" var="i">
                                <li class="post-item post-id-627736 style-4 clearfix tin-vip vipnoibat" style="border-color: #E13427;" post-id="627736">
                                    <figure class="post-thumb">
                                        <a class="clearfix" href="detailhouse?id=${i.getId()}">
                                            <img class="lazy_done" src="assets/images/${i.getImg()}" data-src="" alt="" height="100" width="100" style="width:1200" layout="responsive" data-loaded="true">
                                        </a>
                                        <span class="post-save js-btn-save"></span>
                                    </figure>
                                    <div class="post-meta">
                                        <h3 class="post-title">
                                            <a style="color: #E13427;" href="detailhouse?id=${i.getId()}">
                                                <span class="star star-5"><i style="color: #e4f03c;" class="fas fa-star"></i>${i.getRating()}</span>
                                                    ${i.getTitle()}
                                            </a>
                                        </h3>
                                        <div class="meta-row clearfix">
                                            <span class="post-price">${(i.getPrice())/1000000} triệu/tháng</span>
                                            <span class="post-location">${i.getFull_Address()}</span>
                                            <span class="post-location">${i.getArea()}m<sup>2</sup></span>
                                            <time class="post-time">${i.getAdded_Date()}</time>
                                        </div>
                                        <div class="meta-row clearfix"><p class="post-summary">${i.getDescription()}</p></div>
                                        <div class="meta-row clearfix">
                                            <div class="post-author">
                                                <img src="./assets/images/${i.account.getProfile_Picture()}">
                                                <span class="author-name">${i.account.getFullname()}</span>
                                            </div>
                                            <a rel="nofollow" target="_blank" href="" class="btn-quick-zalo">Nhắn Zalo</a>
                                            <a rel="nofollow" target="_blank" href="tel:0965889995" class="btn-quick-call">${i.account.getPhone_Number()}</a>
                                        </div>
                                        <div class="meta-row clearfix">
                                            <span><span>${i.favourites.size()} lượt thích</span>
                                                <c:if test="${sessionScope.acc != null && i.checkFavourite eq false}">
                                                    <a href="changeStatus?id=${i.getId()}&uid=${sessionScope.acc.getId()}">
                                                        <i style="color: gray" class="fas fa-heart" aria-hidden="true" >
                                                        </i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${sessionScope.acc != null && i.checkFavourite eq true}">
                                                    <a href="changeStatus?id=${i.getId()}&uid=${sessionScope.acc.getId()}">
                                                        <i style="color: #E13427" class="fas fa-heart" aria-hidden="true" >
                                                        </i>
                                                    </a>
                                                </c:if>
                                            </span>                                          
                                        </div>
                                        <div class="meta-row clearfix">
                                            <span><span>${i.history.size()} lượt xem</span>
                                                <c:if test="${sessionScope.acc != null && i.checkHistory eq false}">
                                                    <a href="changestatushistory?id=${i.getId()}&uid=${sessionScope.acc.getId()}">
                                                        <i style="color: gray" class="fas fa-history" aria-hidden="true" >
                                                        </i>
                                                    </a>
                                                </c:if>
                                                <c:if test="${sessionScope.acc != null && i.checkHistory eq true}">
                                                    <a href="changestatushistory?id=${i.getId()}&uid=${sessionScope.acc.getId()}">
                                                        <i style="color: #E13427" class="fas fa-history" aria-hidden="true" >
                                                        </i>
                                                    </a>
                                                </c:if>
                                            </span>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>                           
                        </ul>
                    </section>
                    <ul class="pagination">
                        <c:if test="${sessionScope.searchSession == 0}">
                            <c:forEach begin="1" end="${requestScope.total}" var="i">
                                <a class="page-item" href="homeController?pageNum=${i}&orderBy=${requestScope.orderBy}&districtId=${requestScope.districtId}&categoryID=${requestScope.categoryID}&minArea=${requestScope.minArea}&maxArea=${requestScope.maxArea}&minPrice=${requestScope.minPrice}&maxPrice=${requestScope.maxPrice}&txt=${txt}" style="color : ${requestScope.pageNum == i ? 'red' : ''}"><span class="page-link">${i}</span></a>
                                </c:forEach>
                            </c:if>
                    </ul>
                </div>
                <aside id="aside">
                    <section class="section section-sublink">
                        <form action="homeController">
                            <div class="section-header">
                                <h3 class="section-title">Tìm kiếm theo từ khóa</h3>
                                </br>
                                <input type="text" class="form-control" placeholder="Search for address" name="txt">
                                <button>Search</button>
                            </div>
                        </form>
                        <div class="section-content">
                            <ul class="tags-list clearfix">
                                <li class="tag-item"><a title="Phòng trọ dưới 2 triệu HN"
                                                        href="homeController?minPrice=0&maxPrice=2000000">Phòng trọ dưới 2 triệu HN</a></li>
                                <li class="tag-item"><a title="Phòng trọ dưới 3 triệu HN"
                                                        href="homeController?minPrice=0&maxPrice=3000000">Phòng trọ dưới 3 triệu HN </a></li>
                                <li class="tag-item"><a title="Biệt thự có bể bơi"
                                                        href="">Biệt thự có bể bơi</a>
                                </li>
                            </ul>
                        </div>
                    </section>  
                    <section class="section section-sublink">
                        <div class="section-header"><span class="section-title">Xem theo giá</span></div>
                        <ul class="list-links price clearfix">
                            <li><a href="homeController?minPrice=0&maxPrice=999999">Dưới 1 triệu</a></li>
                            <li><a href="homeController?minPrice=1000000&maxPrice=2000000">Từ 1 - 2 triệu</a></li>
                            <li><a href="homeController?minPrice=2000001&maxPrice=3000000">Từ 2 - 3 triệu</a></li>
                            <li><a href="homeController?minPrice=3000001&maxPrice=5000000">Từ 3 - 5 triệu</a></li>
                            <li><a href="homeController?minPrice=5000001&maxPrice=7000000">Từ 5 - 7 triệu</a></li>
                            <li><a href="homeController?minPrice=7000001&maxPrice=10000000">Từ 7 - 10 triệu</a></li>
                            <li><a href="homeController?minPrice=10000000&maxPrice=14999999">Từ 10 - 15 triệu</a></li>
                            <li><a href="homeController?minPrice=15000000&maxPrice=999999999">Trên 15 triệu</a></li>
                        </ul>
                    </section>
                    <section class="section section-sublink">
                        <div class="section-header"><span class="section-title">Xem theo diện tích</span></div>
                        <ul class="list-links acreage clearfix">
                            <li><a href="homeController?minArea=0&maxArea=25">Dưới 25 m<sup>2</sup></a></li>
                            <li><a href="homeController?minArea=25&maxArea=30">Từ 25 - 30m<sup>2</sup></a></li>
                            <li><a href="homeController?minArea=30&maxArea=50">Từ 30 - 50m<sup>2</sup></a></li>
                            <li><a href="homeController?minArea=50&maxArea=70">Từ 50 - 70m<sup>2</sup></a></li>
                            <li><a href="homeController?minArea=70&maxArea=90">Từ 70 - 90m<sup>2</sup></a></li>
                            <li><a href="homeController?minArea=90&maxArea=999999999">Trên 90m<sup>2</sup></a></li>
                        </ul>
                    </section>
                    <section class="section section-aside-tinmoidang">
                        <div class="section-header">
                            <span class="section-title">Tin mới đăng</span>
                        </div>
                        <c:forEach items="${requestScope.listNew}" var="i">
                            <ul class="post-listing aside clearfix">
                                <li class="post-item clearfix normal" post-id="628215">
                                    <a href="" >
                                        <figure>
                                            <img class="lazy_done" src="assets/images/${i.getImg()}" height="100" width="100" layout="responsive" data-loaded="true"/>
                                        </figure>
                                        <div class="post-meta">
                                            <span class="post-title" style="color: #055699">${i.getTitle()}</span>
                                            <span class="post-price">${i.getPrice()/1000000} triệu/tháng</span>
                                            <time class="post-time" title="Chủ Nhật, 14:29 18/06/2023">${i.getAdded_Date()}</time>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </c:forEach>
                    </section>
                    <section class="section section-sublink">
                        <div class="section-header">
                            <span class="section-title">Bài viết mới</span>
                        </div>
                        <ul class="list-links clearfix">
                            <li><a href="/khuyen-mai-dac-biet-cho-thanh-vien-moi.html">Khuyến mãi đặc biệt cho thành viên mới</a></li>
                            <li><a href="/chuong-trinh-khuyen-mai-phongtro123.html">Chương trình khuyến mãi phongtro123</a></li>
                            <li><a href="/noi-kho-cua-nguoi-thue-phong-tro-gan-thi-dat-ma-re-thi-xa.html">Nỗi khổ của người thuê phòng trọ gần thì đắt mà xa thì rẻ</a></li>
                            <li><a href="/cac-cong-ty-chuyen-nha-tro-uy-tin-nhat-hien-nay.html">Các công ty chuyển nhà trọ uy tín nhất hiện nay</a></li>
                            <li><a href="/co-nen-dau-tu-cho-thue-can-ho-azura-khong.html">Có nên đầu tư cho thuê căn hộ Azura không?</a></li>
                            <li><a href="/top-5-trang-web-cho-thue-nha-nguyen-can-gia-re-tai-viet-nam.html">Top 5 trang web cho thuê nhà nguyên căn giá rẻ tại Việt Nam</a></li>
                        </ul>
                    </section>
                    <section class="section section-sublink">
                        <div class="section-header">
                            <span class="section-title">Có thể bạn quan tâm</span>
                        </div>
                        <ul class="list-links clearfix">
                            <li><a href="/news/hop-dong-thue-nha-tro-phong-tro">Mẫu hợp đồng cho thuê phòng trọ</a></li>
                            <li><a href="/kinh-nghiem/kinh-nghiem-thue-phong-tro-tranh-bi-lua-gat.html">Cẩn thận các kiểu lừa đảo khi thuê phòng trọ</a></li>
                            <li><a href="/kinh-nghiem/chia-se-10-kinh-nghiem-khi-thue-phong-tro-cho-sinh-vien.html">Kinh nghiệm thuê phòng trọ Sinh Viên</a></li>
                        </ul>
                    </section>
                </aside>
            </div>
        </main>
        <jsp:include page="footer.jsp"></jsp:include>   
    </body>
</html>
