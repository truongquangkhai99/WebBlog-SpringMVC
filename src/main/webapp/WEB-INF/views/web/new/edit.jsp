<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewAPI" value="/api/new" />
<c:url var="EditNewURL" value="/bai-viet/chinh-sua" />
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tạo bài viêt mới</title>
</head>

<body>
    <div class="row">
        <div class="col-lg-9">
            <c:if test="${not empty message}">
                <div class="alert alert-<c:out value='${alert}'/>">
                    <c:out value='${message}' />
                </div>
            </c:if>
            <form:form id="formSubmit" role="form" modelAttribute="model">
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                    <div class="col-sm-9">
                        <form:input path="title" id="title" cssClass="form-control" />
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                    <div class="col-sm-9">
                        <form:select path="categoryCode" id="categoryCode">
                            <form:option value="" label="-- Chọn thể loại --" />
                            <form:options items="${categories}" />
                        </form:select>
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                    <div class="col-sm-9">
                        <form:input class="form-control" path="thumbnail" id="thumbnail" />
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                    <div class="col-sm-9">
                        <form:textarea path="shortDescription" id="shortDescription" rows="5" cols="10" cssClass="form-control" />
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                    <div class="col-sm-9">
                        <form:textarea path="content" id="content" rows="5" cols="10" cssClass="form-control" />
                    </div>
                </div>
                <br />
                <br />
                <div class="form-group">
                    <div class="col-sm-12">
                        <c:if test="${not empty model.id}">
                            <input type="button" class="btn btn-white btn-warning btn-bold" value="Cập nhật bài viết" id="btnAddOrUpdateNew" />
                        </c:if>
                        <c:if test="${empty model.id}">
                            <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm bài viết" id="btnAddOrUpdateNew" />
                        </c:if>
                        &nbsp; &nbsp; &nbsp;
                        <button class="btn" type="reset">
                            <i class="ace-icon fa fa-undo bigger-110"></i>
                            Hủy
                        </button>
                    </div>
                </div>
                <form:hidden path="id" />
            </form:form>
            <!-- /.row -->
        </div>
        <!-- /.col-lg-9 -->
    </div>
    <!-- /.row -->
    <script>
    var editor = '';
    $(document).ready(function() {
        editor = CKEDITOR.replace('content');
    });

    $('#btnAddOrUpdateNew').click(function(e) {
        e.preventDefault();
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function(i, v) {
            data["" + v.name + ""] = v.value;
        });
        data["content"] = editor.getData();
        var id = $('#id').val();
        if (id == "") {
            addNew(data);
        } else {
            updateNew(data);
        }
    });

    function addNew(data) {
        $.ajax({
            url: '${NewAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function(result) {
                window.location.href = "${EditNewURL}?id=" + result.id + "&message=insert_success";
            },
            error: function(error) {
                window.location.href = "${EditNewURL}?message=error_system";
            }
        });
    }

    function updateNew(data) {
        $.ajax({
            url: '${NewAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function(result) {
                window.location.href = "${EditNewURL}?id=" + result.id + "&message=update_success";
            },
            error: function(error) {
                window.location.href = "${EditNewURL}?message=error_system";
            }
        });
    }
    </script>
</body>

</html>