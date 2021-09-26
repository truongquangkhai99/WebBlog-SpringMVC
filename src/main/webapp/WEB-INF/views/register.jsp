<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>


<html>
<head>
    <meta charset="utf-8">
    <meta name="author" content="Kodinger">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Đăng ký</title>
</head>
<body>
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
                <div class="brand">
                    <img src="<c:url value='/template/login/img/logo.jpg' />" alt="bootstrap 4 login page">
                </div>

                <c:if test="${not empty message}">
                    <div class="alert alert-<c:out value='${alert}'/>">
                        <c:out value='${message}'/>
                    </div>
                </c:if>

                <div class="card fat">
                    <div class="card-body">
                        <h4 class="card-title">Register</h4>
                        <form:form method="POST" action="dang-ky" cssClass="my-login-validation" modelAttribute="model" novalidate="">
                            <div class="form-group">
                                <label for="name">FullName</label>
                                <form:input  cssClass="form-control" path="fullName" />
                            </div>

                            <div class="form-group">
                                <label for="email">Username</label>
                                <form:input  cssClass="form-control" path="userName" />

                            </div>

                            <div class="form-group">
                                <label for="password">Password</label>
                                <form:password cssClass="form-control" path="password" />

                            </div>



                            <div class="form-group m-0">
                                <button type="submit"  class="btn btn-primary btn-block">
                                    Đăng ký
                                </button>
                            </div>
                            <div class="mt-4 text-center">
                                Already have an account? <a href="<c:url value='/dang-nhap'/>">Đăng nhập</a>
                            </div>
                        </form:form>
                    </div>
                </div>
                <div class="footer">
                    Developer : Trần Thanh Tuấn Vũ
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
