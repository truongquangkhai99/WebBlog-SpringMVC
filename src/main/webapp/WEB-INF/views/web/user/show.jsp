<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thông tin tài khoản</title>
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
                <h3>Thông tin tài khoản</h3>
                <table class="table table-dark">
                    <thead>
                        <tr>
                            <td>Username </td>
                            <td>Fullname </td>
                            <td>Status </td>
                            <td>Role </td>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                            <td>${USERMODEL.userName}</td>
                            <td>${USERMODEL.fullName}</td>
                            <c:if test="${USERMODEL.status == 1}">
                                <td>Hoạt Động</td>
                            </c:if>
                            <c:if test="${USERMODEL.status == 0}">
                                <td>Vô hiệu hóa</td>
                            </c:if>
                            <td>${USERMODEL.roleCode}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
    </div>
    <!-- /.row -->
</body>

</html>