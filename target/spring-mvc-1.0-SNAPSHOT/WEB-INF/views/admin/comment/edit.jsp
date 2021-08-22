<%--
  Created by IntelliJ IDEA.
  User: trant
  Date: 8/17/2021
  Time: 11:24 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="CommentAPI" value="/api/comment"/>
<c:url var ="CommentURL" value="/quan-tri/binh-luan/danh-sach"/>
<html>
<head>
    <title>Chỉnh sửa bình luận</title>
</head>
<body>
<div class="main-content">
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <ul class="breadcrumb">
                <li>
                    <i class="ace-icon fa fa-home home-icon"></i>
                    <a href="#">Trang chủ</a>
                </li>
                <li class="active">Chỉnh sửa bình luận</li>
            </ul><!-- /.breadcrumb -->
        </div>
        <div class="page-content">
            <div class="row">
                <div class="col-xs-12">

                    <c:if test="${not empty message}">
                        <div class="alert alert-<c:out value='${alert}'/>">
                            <c:out value='${message}'/>
                        </div>
                    </c:if>

                    <form:form id="formSubmit" role="form" modelAttribute="model">

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">UserId</label>
                            <div class="col-sm-9">
                                <form:input cssClass="form-control" id="userId" path="userId"/>
                            </div>
                        </div>
                        <br/>
                        <br/>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Tài khoản bình luận</label>
                            <div class="col-sm-9">
                                <input class="form-control"  value="${resultsUser.userName}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>



                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">NewId</label>
                            <div class="col-sm-9">
                                <form:input cssClass="form-control" id="newId" path="newId"/>
                            </div>
                        </div>
                        <br/>
                        <br/>


                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Tiêu đề bài viết</label>
                            <div class="col-sm-9">
                                <input class="form-control"  value="${resultsNew.title}"/>
                            </div>
                        </div>
                        <br/>
                        <br/>


                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                            <div class="col-sm-9">
                                <form:textarea path="content" id="content" rows="5" cols="10" cssClass="form-control"/>
                            </div>
                        </div>
                        <br/>
                        <br/>

                        <div class="form-group">
                            <div class="col-sm-12">
                                <c:if test="${not empty model.id}">
                                    <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật" id="btnAddOrUpdateNew"/>
                                </c:if>
                                <c:if test="${empty model.id}">
                                    <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm" id="btnAddOrUpdateNew"/>
                                </c:if>
                            </div>
                        </div>
                        <form:hidden id="id" path="id"/>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>

    var editor = '';
    $(document).ready(function(){
        editor = CKEDITOR.replace( 'content');
    });

    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        data["content"] = editor.getData();
        var id = $('#id').val();
        if (id == "") {
            addComment(data);
        } else {
            updateComment(data);
        }
    });
    function addComment(data) {
        $.ajax({
            url: '${CommentAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${CommentURL}?page=1&limit=5&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${CommentURL}?page=1&limit=5&page=1&message=error_system";
            }
        });
    }
    function updateComment(data) {
        $.ajax({
            url: '${CommentAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${CommentURL}?page=1&limit=5&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${CommentURL}?page=1&limit=5&page=1&message=error_system";
            }
        });
    }


</script>
</body>
</html>