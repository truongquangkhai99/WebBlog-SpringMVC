<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đổi mật khẩu</title>
</head>

<body>
    <div class="row">
        <div class="col-lg-3">
            <h1 class="my-4"></h1>
            <div class="list-group">
                <a href="<c:url value='/nguoi-dung'/>" class="list-group-item">Thông tin tài khoản</a>
                <a href="<c:url value='/nguoi-dung/doi-mat-khau'/>" class="list-group-item">Đổi mật khẩu</a>
            </div>
        </div>
        <div class="col-lg-9">

            <c:if test="${not empty message}">
                <div class="alert alert-<c:out value='${alert}'/>">
                    <c:out value='${message}' />
                </div>
            </c:if>

            <form action="<c:url value='/nguoi-dung/doi-mat-khau'/>" method="post">
                <h3>Đổi mật khẩu</h3>
                <div class="form-group">
                    <label for="usr">Mật khẩu hiện tại:</label>
                    <input type="password" name="myPassword" class="form-control" required="">
                </div>
                <div class="form-group">
                    <label for="usr">Nhập mật khẩu :</label>
                    <input type="password" name="newPassword1" class="form-control" required="">
                </div>
                <div class="form-group">
                    <label for="pwd">Nhập lại mật khẩu :</label>
                    <input type="password" name="newPassword2" class="form-control" required="">
                </div>
                <button type="submit" class="btn btn-primary">Đổi mật khẩu</button>
            </form>
        </div>
    </div>
    <!-- /.row -->
</body>

</html>