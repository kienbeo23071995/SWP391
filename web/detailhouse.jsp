<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 09:30:15 AM
    Author     : kienb
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <!-- Title  -->
        <title>South - Real Estate Agency Template | Single Blog</title>

        <!-- Favicon  -->
        <link rel="icon" href="img/core-img/favicon.ico">

        <!-- Style CSS -->
        <link rel="stylesheet" href="style.css">
        <style>
            #banner{
                width: 100%;
                height: auto;
                background-color: #Eaeaea;
                padding: 2em;
            }
            .item1{
                display: flex;
                background-color: white;
                margin: 0.5px auto;
                width: 80%;
                height: auto;
                border: 1px solid black;
                border-radius: 10px;
            }
            .leftdetailhouse{
                border-right: 1px solid black;
                width: 70%;
                height: auto;
                padding-top: 1em;
            }
            .leftdetailhouse .listimg{
                width: 80%;
                height: 30em;
                margin: 0 auto;
            }
            .listimg img{
                width: 100%;
                height: 85%;
                object-fit: cover;
                border-radius: 10px;
            }
            .inforuser{
                text-align: center;
                width: 30%;
                height: 50em;
            }
            .btnc{
                height: 3em;
                display: flex;
                justify-content: center;
            }
            .btnc input{
                padding: 0;
                text-align: center;
                padding: 0 1em;
                background-color: #1E90FF;
                border-radius: 10px;
                color: white;

            }
            .cont{
                width: 95%;
                margin: 0 auto;

            }
            .aboutuser{
                margin-top: 0.5em;
                background: #FFA500;
                height: 30em;
                border-radius: 10px;
            }
            .imguser{
                width: 40%;
                height: 40%;
                padding-top: 1.5em;
                margin-left: 8.1em;
            }
            .imguser img{
                border-radius: 50%;
                height: 8em;
                width: 8em;
            }
            .fillinfor{
                padding-top: 0.5em;
                border-radius: 10px;
                width: 90%;
                height: 2.5em;
                margin: 0 auto;
                margin-bottom: 1em;
                background-color: white;
            }
            .fillinfor ion-icon{
                font-size: 20px;
            }
            #activeHeart ion-icon{
                color: red;
            }
            #noactiveHeart ion-icon{
                color: black;
            }
            .detail{
                padding: 0.5em 1em;
                width: 100%;
                height: auto;
            }
            .detail h2{
                color: red;
            }
            .detail h4{
                font-weight: 700;
                color: black;
            }
            .detail ion-icon{
                color: #ffd454;
            }
            .detail p ion-icon{
                color:#3e82f0;
            }
            .detail #ins ion-icon{
                color: black;
                margin-right: 0.5em;
            }
            .detail #ins span{
                margin-right: 2em;
            }
            #discx{
                color: black;
                font-weight: normal;
            }
            .secti{
                margin: 2em 0;
            }
            .secti p{
                color: black;
                font-weight: normal;
            }
            .tb{
                padding-left:0.5em;
                margin: 0 auto;
                width: 100%;
                height: 2em;
                display: flex;
            }
            #butmess{
                cursor: pointer;
            }
            #butfa{
                cursor: pointer;
            }
            body{
                position: relative;
            }
            .messcontain{
                position: fixed;
                right: 6em;
                bottom: 0;
                width: 22%;
                height: 25em;
                border: 1px solid black;
                background-color: #333333;
                z-index: 99;
                border-top-left-radius: 10px;
                border-top-right-radius: 10px;
            }
            /*            #ofmess{
                            display: none;
                        }*/
            #hdmess ion-icon{
                color: white;
                font-size: 2em;

            }
            #hdmess #cls ion-icon:hover{
                color: black;
                background-color: gray;
                cursor: pointer;
                border-radius: 50%;
            }
            #banmess p{
                color: white;
                margin-bottom: 0.5em;
                padding-left: 0.2em;
            }
            #banmess p span{
                padding: 0.5em;
            }
            .msl{
                background-color: #818281;
                border-radius: 10px;
                width: 70%;
            }
            .msr{
                background-color: #f72f57;
                border-radius: 10px;
                width: 70%;
                margin-left: 5em;
            }
            #sn{
                display: grid;
                place-items: center;
                cursor: pointer;
            }
            #sn ion-icon{
                color: #f72f57;
                font-size: 22px;
            }
            #ftmess{
                margin-right: 0.5em;
            }
            #ftmess input{
                padding-left: 0.5em;
                width: 100%;
                height: 100%;
                border-radius: 10px;
            }
            .lsnewpost{
                width: 95%;
                margin: 1em auto;
                padding: 1em 0;
                border: 1px solid black;
                height: auto;
                border-radius: 10px;
            }
            .imgnp{
                width: 25%;
                height: 100%;
            }
            .imgnp img{
                width: 100%;
                height: 100%;
            }
            .contnp{
                margin-left: 0.5em;
                width: 73%;
                height: 100%;
            }
            .contnp ion-icon{
                color: #ffd454;
            }
            .hcontpn{
                width: 100%;

            }
            .contnp .hcontpn h6{
                text-align: left;
                display: -webkit-box;
                -webkit-box-orient: vertical;
                -webkit-line-clamp: 2;
                overflow: hidden;
                text-overflow: ellipsis;
                color: red;
            }
            .contnp h6{
                color: #1fcc73;
                text-align: left;
            }
            #lsStar{
                display: none;
                position: absolute;
                top: -2.2em;
                background-color: #f1f1f1;
                box-shadow: 0 0 1px black;
            }
            #lsStar ul{
                display: flex;
            }
            #lsStar ul li{
                margin: 0;
                padding: 0;
            }
            #lsStar ul li a{
                font-size: 17px;
                padding: 0.2em 0.5em;
                font-weight: normal;
                display: block;
            }
            #vote{
                position: relative;
            }
            #noteVote{
                font-weight: 500;
                font-family: sans-serif;
                cursor: pointer;
                color: #1E90FF;
            }
            #vote span{
                font-weight: 500;
                font-family: sans-serif;
                cursor: pointer;
                font-weight: 600;
            }
            #activevote{
                background-color: #ddd;
                color: #16c784;
                cursor: default;
            }
            #lsStar ul li .inactivevote:hover{
                background-color: #ddd;
            }
            #vote:hover span{
                font-weight: 600;
                font-family: sans-serif;
                cursor: pointer;
                color: #1E90FF;
            }
            #vote:hover #lsStar{
                display: block;
            }


        </style>
    </head>

    <body>
        <!-- ##### Nhớ Login tai khoan truoc roi dung duong dan  http://localhost:8080/SWP391_HouseRentalSystem/detailhouse?id = 1 hoac 2 ...(tu lay id trong bang House trong sql) ##### -->
        <!--Messenger-->
        <form method="post" action="messages" id="sen">
            <input type="hidden" name="receiverId" value="${finforowner.getId()}"/>
            <input type="hidden" name="houseId" value="${houseId}"/>
            <div class="messcontain" id="ofmess" style="display: ${showM==null?"none":"block"}">
                <div id="hdmess" style="padding: 0.3em;width: 100%;height: 11%;border-bottom: 1px solid #5c5c5c;display: flex">
                    <div style=" width:13%; height:100%"><img style="border-radius: 50%" src="./assets/images/${finforowner.getProfilePicture()}" alt="alt"/></div>
                    <div style="width: 77%;height: 100%"><p style="color:white;font-weight: 600;margin-left: 0.5em;">${finforowner.getFullName()}</p></div>
                    <div id="cls" style="width: 10%;height: 100%;" onclick="disMess()"><ion-icon name="close-outline"></ion-icon></div>
                </div>
                <div id="banmess" style="padding: 0.5em;height: 78%;width: 100%;overflow-x: hidden">

                    <c:forEach items="${lsM}" var="m">
                        <div class=${m.getSender_ID() == sessionScope.acc.getId()?"msr":"msl"}><p><span>${m.getContent()}</span></p></div>
                    </c:forEach>
                </div>
                <div id="ftmess" style="display: flex;height: 11%;width: 100%;padding: 0.3em 0;padding-left: 0.2em;">
                    <div style="width: 88%"><input type="text" name="inbox"></div>
                    <div style="width: 10%" id="sn" onclick="submitForm()"><ion-icon name="send"></ion-icon></div>
                </div>
            </div> 
        </form>
        <!-- Header -->
        <jsp:include page="header.jsp"></jsp:include>


            <!-- ##### Blog Area Start ##### -->
            <div id="banner">
                <div class="item1">
                    <div class="leftdetailhouse">
                        <!-- Image of house -->
                        <div class="listimg">
                            <img id="sliderimg" src="${firstImg}" alt="alt"/><br>
                        <c:if test="${!imgPath.isEmpty()}">
                            <div class="btnc">
                                <input style="margin-right: 1em;cursor: pointer;" type="button" value="Prev" onclick="prevImage()">
                                <input style="cursor: pointer;" type="button" value="Next" onclick="nextImage()">
                            </div>
                        </c:if>
                    </div>
                    <div class="detail">
                        <!-- Information of house -->
                        <h2><ion-icon name="star"></ion-icon><ion-icon name="star"></ion-icon><ion-icon name="star"></ion-icon>${fhouse.getTitle()}</h2>
                        <p style="color:black;font-weight: normal"><ion-icon name="location"></ion-icon>Địa chỉ: ${fhouse.getFull_Address()}</p>  
                        <p style="color:black;font-size: 18px" id="ins">
                        <ion-icon name="wallet-outline"></ion-icon><span style="font-size: 22px;color: #1fcc73">${fhouse.getPrice()}$/tháng</span>
                        <ion-icon name="cube-outline"></ion-icon><span>${fhousedetail.getArea()}m<sup>2</sup></span>
                        <ion-icon name="bed-outline"></ion-icon><span>${fhousedetail.getNumber_Of_Bedrooms()}</span>
                        <ion-icon name="woman-outline"></ion-icon><span>${fhousedetail.getNumber_Of_Bathrooms()}</span>
                        <ion-icon name="car-sport-outline"></ion-icon><span>${fhousedetail.getPool()}</span>
                        <ion-icon name="compass-outline"></ion-icon><span>${fhousedirection.getDirection()}</span>
                        </p>
                        <div class="secti">
                            <!-- Description House -->
                            <h4>Thông tin mô tả</h4>
                            <p id="discx">
                                ${fhouse.getDescription()}
                            </p>
                        </div>

                        <div class="secti">
                            <h4>Đặc điểm tin đăng</h4>
                            <!-- Dac diem cua house -->
                            <div class="tb" >
                                <div style="width: 50%"><p>Mã nhà:</p></div>
                                <div style="width: 50%"><p>#${fhouse.getId()}</p></div>
                            </div>
                            <div class="tb" style="background-color: #dedede;border-radius: 5px">
                                <div style="width: 50%"><p>Quận:</p></div>
                                <div style="width: 50%"><p>${fdistrict.getDistrict()}</p></div>
                            </div>
                            <div class="tb" >
                                <div style="width: 50%"><p>Loại nhà:</p></div>
                                <div style="width: 50%"><p>${fhousecategory.getCategory()}</p></div>
                            </div>
                            <div class="tb" style="background-color: #dedede;border-radius: 5px">
                                <div style="width: 50%"><p>Đối tượng thuê::</p></div>
                                <div style="width: 50%"><p>Mọi người</p></div>
                            </div>
                            <div class="tb" >
                                <div style="width: 50%"><p>Ngày đăng:</p></div>
                                <div style="width: 50%"><p>${fhouse.getAdded_Date()}</p></div>
                            </div>
                        </div>
                        <div class="secti">
                            <h4>Contact Info</h4>
                            <!-- Information of owner house -->
                            <div class="tb" >
                                <div style="width: 50%"><p>Liên hệ:</p></div>
                                <div style="width: 50%"><p>${finforowner.getFullName()}</p></div>
                            </div>

                            <div class="tb" style="background-color: #dedede;border-radius: 5px">
                                <div style="width: 50%"><p>Số điện thoại:</p></div>
                                <div style="width: 50%"><p>${finforowner.getPhoneNumber()}</p></div>
                            </div>
                            <div class="tb" >
                                <div style="width: 50%"><p>Email:</p></div>
                                <div style="width: 50%"><p>${finforowner.getEmail()}</p></div>
                            </div>
                            <div class="tb" style="background-color: #dedede;border-radius: 5px">
                                <div style="width: 50%"><p>Địa chỉ:</p></div>
                                <div style="width: 50%"><p>${finforowner.getAddress()}</p></div>
                            </div>
                        </div>
                        <!-- Section Vote House -->
                        <c:if test="${(sessionScope.acc!=null)&&(sessionScope.acc.getId() != fhouse.getHouse_Owener_ID())}">
                            <div id="vote" style="margin-bottom: 2em;margin-top: 3em;">
                                <span id="${hr!=null?'noteVote':''}">Đánh giá</span>
                                <div id="lsStar">
                                    <ul>
                                        <c:forEach begin="1" end="5" step="1" var="c">
                                            <c:choose>
                                                <c:when test="${(hr.getVote_Id() == sessionScope.acc.getId())&&(c == hr.getRating())}">
                                                    <li><a id="activevote" href="#">${c} <ion-icon name="star"></ion-icon></a></li>
                                                            </c:when>
                                                            <c:otherwise>
                                                    <li><a class="inactivevote" href="houseratings?rating=${c}&houseid=${fhouse.getId()}">${c} <ion-icon name="star"></ion-icon></a></li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                    </ul>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </div>
                <div class="inforuser">
                    <div class="cont">
                        <!-- Phan ben phai cua house detail hien thong tin lien lac cua owner house -->
                        <div class="aboutuser">
                            <div class="imguser">
                                <img src="./assets/images/${finforowner.getProfilePicture()}" alt="alt"/>
                            </div>
                            <div>
                                <h6 style="font-weight: 800;margin-bottom: 2em;">${finforowner.getFullName()}</h6>
                            </div>
                            <div class="fillinfor" style="background-color: #16c784;color:white">
                                <h6 style="color: white;display: inline-flex"><ion-icon name="call"></ion-icon>${finforowner.getPhoneNumber()}</h6>
                            </div>
                            <c:if test="${(sessionScope.acc!=null)&&sessionScope.acc.getId() != finforowner.getId()}">
                                <div class="fillinfor" id="butmess" onclick="disMess()">
                                    <h6 style="color: black;display: inline-flex"><ion-icon name="chatbox-outline"></ion-icon>Thuê</h6>
                                </div>
                            </c:if>
                            <c:if test="${(sessionScope.acc==null)||(sessionScope.acc.getId() == finforowner.getId())}">
                                <div class="fillinfor" id="butmess">
                                    <h6 style="color: black;display: inline-flex"><ion-icon name="chatbox-outline"></ion-icon>Thuê</h6>
                                </div>
                            </c:if>
                            <div class="fillinfor" id="butfa">
                                <c:if test="${sessionScope.acc!=null}">
                                    <a href="favouritehouse?houseId=${houseId}"><h6 style="color: black;display: inline-flex" id="${heart}"><ion-icon name="heart"></ion-icon>Yêu thích</h6> </a>
                                            </c:if>
                                            <c:if test="${sessionScope.acc==null}">
                                    <a href="#"><h6 style="color: black;display: inline-flex" id="${heart}"><ion-icon name="heart"></ion-icon>Yêu thích</h6> </a>
                                            </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- List new post houses -->
                    <div class="lsnewpost">
                        <h4 style="margin-bottom: 14px;font-weight: 600">Tin mới</h4>
                        <c:forEach items="${lsH}" var="h">
                            <div style="width: 100%;padding: 0 0.5em;padding-bottom: 0.5em;height: 5em;display: flex;border-bottom: 1px solid #dedede">
                                <div class="imgnp">
                                    <img src="./assets/images/${h.getImage()}" alt="alt"/>
                                </div>
                                <div class="contnp">
                                    <a href="detailhouse?id=${h.getId()}"><div class="hcontpn"><h6><ion-icon name="star"></ion-icon><ion-icon name="star"></ion-icon><ion-icon name="star"></ion-icon>${h.getTitle()}</h6></div></a>
                                    <h6>${h.getPrice()}$/month</h6>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

        </div>
        <!-- ##### Footer Area End ##### -->
        <jsp:include page="footer.jsp"></jsp:include>  



            <!-- jQuery (Necessary for All JavaScript Plugins) -->
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
            <!-- Javascript code display image -->
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
    </body>

</html>
