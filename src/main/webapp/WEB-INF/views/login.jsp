<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta charset="utf-8">
    <meta name="author" content="Kodinger">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Đăng nhập</title>
</head>

<body id="LoginForm" class="my-login-page">

<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">

                <div class="brand">
                    <img src="<c:url value='/template/login/img/logo.jpg' />" alt="logo">
                </div>

                <c:if test="${param.incorrectAccount != null}">
                    <div class="alert alert-danger">
                        Username or password incorrect
                    </div>
                </c:if>
                <c:if test="${param.accessDenied != null}">
                    <div class="alert alert-danger">
                        You not authorize
                    </div>
                </c:if>

                <div class="card fat">
                    <div class="card-body">
                        <h4 class="card-title">Login</h4>
                        <form method="POST" action="j_spring_security_check" class="my-login-validation" novalidate="">

                            <div class="form-group">
                                <label for="email">Tên đăng nhập</label>
                                <input id="userName" name="j_username" placeholder="Tên đăng nhập" class="form-control" name="email" value="" required autofocus>
                                <div class="invalid-feedback">
                                    Điền tên đăng nhập
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="password">Mật khẩu
                                    <a href="forgot.html" class="float-right">
                                        Forgot Password?
                                    </a>
                                </label>
                                <input  class="form-control" type="password" id="password" name="j_password" placeholder="Mật khẩu" required data-eye>
                                <div class="invalid-feedback">
                                    Điền mật khẩu
                                </div>
                            </div>



                            <div class="form-group m-0">
                                <button type="submit" class="btn btn-primary btn-block">
                                    Đăng nhập
                                </button>
                            </div>
                            <div class="mt-4 text-center">
                                Don't have an account? <a href="<c:url value='/dang-ky' />">Đăng ký</a>
                            </div>
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>

                        </form>
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