<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title><dec:title default="Đăng nhập" /></title>
    <meta charset="utf-8">
    <meta name="author" content="Kodinger">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="stylesheet" type="text/css"  href="<c:url value='/template/login/bootstrap.min.css'/>" >
    <link rel="stylesheet" type="text/css" href="<c:url value='/template/login/css/my-login.css' />" >



</head>
<body id="LoginForm" class="my-login-page">
<dec:body/>


<script src="<c:url value="/template/login/jquery-3.3.1.slim.min.js" />" ></script>
<script src="<c:url value="/template/login/popper.min.js" />" ></script>
<script src="<c:url value="/template/login/bootstrap.min.js" />" ></script>
<script src="<c:url value="/template/login/js/my-login.js" />"></script>


</body>
</html>