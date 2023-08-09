<%-- 
    Document   : user_profile
    Created on : Aug 9, 2023, 09:20:15 AM
    Author     : kienb
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Phản hồi</title>
        <link rel="stylesheet" href="assets/css/style9.css">
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div>
                <section class="content-item" id="comments">
                    <div class="container">   
                        <div class="row">
                            <div class="col-ms-12"> 
                            <c:if test="${sessionScope.acc != null}">
                                <form method="post" action="feedbackforsystem">
                                    <div class="section-header" style="margin-bottom: 50px; text-align: center;">
                                        <div class="section-title big"><h2>Bạn nghĩ sao về chúng tôi</h2></div>
                                        <h3>Sự hài lòng của khách hàng là động lực phát triển của chúng tôi</h3>
                                    </div>

                                    <fieldset>
                                        <div class="row">
                                            <div class="col-sm-3 col-lg-2">
                                                <img class="img-responsive" src="assets/images/default-avatar.jpg" alt="" >
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-9 col-lg-10">
                                                <h4 class="media-heading">
                                                    <c:if test="${sessionScope.acc.id == i.getAccount_ID()}">
                                                        <span id="fullname-${i.getID()}">${i.getFullname()}</span>
                                                        <input type="text" id="edit-fullname-${i.getID()}" class="edit-fullname" value="${i.getFullname()}" style="display: none;">
                                                    </c:if>
                                                    <c:if test="${sessionScope.acc.id != i.getAccount_ID()}">
                                                        ${i.getFullname()}
                                                    </c:if>
                                                </h4>
                                                <textarea class="form-control" id="message" placeholder="Your message" name="comment" required=""></textarea>
                                            </div>
                                            <button type="submit" class="btn btn-normal pull-right">Comment</button>
                                        </div>  	
                                    </fieldset>

                                </form>
                                <div class="post-sort">
                                    <span>Sắp xếp: </span>
                                    <a class="${request.orderBy == 1? '' : 'active'}" href="feedbackforsystem">Mặc định</a>
                                    <a class="${request.orderBy == 1? '' : 'active'}" href="feedbackforsystem?orderBy=1">Mới nhất</a>
                                    <a class="${request.orderBy == 1? '' : 'active'}" href="feedbackforsystem?accID=${sessionScope.acc.id}">Bình luận của tôi</a>
                                </div>
                            </c:if>

                            <c:if test="${sessionScope.acc == null}">
                                <form>
                                    <div class="section-header" style="margin-bottom: 50px; text-align: center;">
                                        <div class="section-title big"><h2>Bạn nghĩ sao về chúng tôi</h2></div>
                                        <h3>Sự hài lòng của khách hàng là động lực phát triển của chúng tôi</h3>
                                    </div>
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-sm-3 col-lg-2 hidden-xs">
                                                <img class="img-responsive" src="assets/images/default-avatar.jpg" alt="">
                                            </div>
                                            <div class="form-group col-xs-12 col-sm-9 col-lg-10">
                                                <h4>Name</h4>
                                                <textarea class="form-control" id="message" placeholder="Your message" required=""></textarea>
                                            </div>
                                            <a href="login" class="btn btn-primary pull-right" style=" color: white" type="submit">Comment</a></div>
                                        </div>  	
                                    </fieldset>
                                </form>
                                <div class="post-sort">
                                    <span>Sắp xếp: </span>
                                    <a class="${request.orderBy == 1? '' : 'active'}" href="feedbackforsystem">Mặc định</a>
                                    <a class="${request.orderBy == 1? '' : 'active'}" href="feedbackforsystem?orderBy=1">Mới nhất</a>
                                </div>
                            </c:if>
                            <c:forEach items="${requestScope.listf}" var="i">
                                <div class="media">
                                    <a class="pull-left" href="#"><img class="media-object" src="assets/images/default-avatar.jpg" alt=""></a>
                                    <div class="media-body">
                                        <h4 class="media-heading">Name</h4>
                                        <p>
                                            <c:if test="${sessionScope.acc.id == i.getAccount_ID()}">
                                                <span id="content-${i.getID()}">${i.getContent()}</span>
                                                <textarea id="edit-content-${i.getID()}" class="edit-content" style="display: none;">${i.getContent()}</textarea>
                                            </c:if>
                                            <c:if test="${sessionScope.acc.id != i.getAccount_ID()}">
                                                ${i.getContent()}
                                            </c:if>
                                        </p>
                                        <ul class="list-unstyled list-inline media-detail pull-left">
                                            <li><i class="fa fa-calendar"></i>${i.getAddDate()}</li>
                                            <li><i class="fa fa-thumbs-up"></i>13</li>
                                        </ul>
                                        <c:if test="${sessionScope.acc.id == i.getAccount_ID()}">
                                            <ul class="list-unstyled list-inline media-detail pull-right">
                                                <li class=""><a href="">Edit</a></li>
                                                <li class=""><a href="deletefeedbacksystem?accountID=${i.getID()}">Delete</a></li>
                                            </ul>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="text-center">
                                <ul class="pagination">
                                    <c:forEach begin="1" end="${requestScope.total}" var="i">
                                        <li class="page-item"><a class="page-link" href="feedbackforsystem?pageNum=${i}&orderBy=${requestScope.orderBy}">${i}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                            <script>
                                const editFullnameFields = document.querySelectorAll('.edit-fullname');
                                const editContentFields = document.querySelectorAll('.edit-content');

                                editFullnameFields.forEach((editFullnameField) => {
                                    const commentId = editFullnameField.id.split('-')[2];
                                    const fullnameElement = document.getElementById(`fullname-${commentId}`);
                                    const editFullnameElement = document.getElementById(`edit-fullname-${commentId}`);

                                    editFullnameField.addEventListener('input', () => {
                                        fullnameElement.innerText = editFullnameField.value;
                                    });

                                    editFullnameElement.addEventListener('input', () => {
                                        editFullnameField.value = editFullnameElement.value;
                                    });
                                });

                                editContentFields.forEach((editContentField) => {
                                    const commentId = editContentField.id.split('-')[2];
                                    const contentElement = document.getElementById(`content-${commentId}`);
                                    const editContentElement = document.getElementById(`edit-content-${commentId}`);

                                    editContentField.addEventListener('input', () => {
                                        contentElement.innerText = editContentField.value;
                                    });

                                    editContentElement.addEventListener('input', () => {
                                        editContentField.value = editContentElement.value;
                                    });
                                });
                            </script>
                            </section>
                        </div>

                        <jsp:include page="footer.jsp"></jsp:include>
                        </body>
                        </html>

