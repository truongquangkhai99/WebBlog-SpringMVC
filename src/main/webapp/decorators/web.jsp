<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Trang Chủ</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/template/web/vendor/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet" >

    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css" >
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
    <script type='text/javascript' src="<c:url value='/template/admin/js/jquery-2.2.3.min.js' />" ></script>
    <script src="<c:url value='/template/admin/assets/js/jquery.2.1.1.min.js' />" ></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>

<body>

<!-- Navigation -->

<%@ include file="/common/web/header.jsp" %>
<!-- Page Content -->
<main role="main">
    <div class="jumbotron">
<div class="container">

    <dec:body/>
</div>
    </div>
</main>
<!-- /.container -->

<!-- Footer -->
<%@ include file="/common/web/footer.jsp" %>


<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10" ></script>
<script src="<c:url value='/template/web/vendor/bootstrap/js/bootstrap.bundle.min.js'/>" ></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/template/web/vendor/jquery/jquery.min.js'/>"></script>
<script src="<c:url value='/template/admin/paging/jquery.twbsPagination.js'/>"></script>
<script src="<c:url value='/template/ckeditor/ckeditor.js' />"></script>

</body>

</html>
