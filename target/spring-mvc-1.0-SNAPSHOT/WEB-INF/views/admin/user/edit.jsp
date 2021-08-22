
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="UserAPI" value="/api/user"/>
<c:url var ="UserURL" value="/quan-tri/nguoi-dung/chinh-sua"/>


<html>
<head>
    <title>Chỉnh sửa người dùng</title>
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
                <li class="active">Chỉnh sửa người dùng</li>
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
                            <label class="col-sm-3 control-label no-padding-right">Role</label>
                            <div class="col-sm-9">
                                <form:select cssClass="form-control" id="roleCode" path="roleCode">
                                    <form:option value="" label="-- Chọn role --"  />
                                    <form:options items="${roles}"/>
                                </form:select>
                            </div>
                        </div>

                        <br/>
                        <br/>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Username</label>
                            <div class="col-sm-9">
                                <form:input id="userName" path="userName" cssClass="form-control"/>
                            </div>
                        </div>

                        <br/>
                        <br/>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Password</label>
                            <div class="col-sm-9">
                                <form:password id="password" path="password" cssClass="form-control"/>
                            </div>
                        </div>

                        <br/>
                        <br/>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Fullname</label>
                            <div class="col-sm-9">
                                <form:input cssClass="form-control" id="fullName" path="fullName" />
                            </div>
                        </div>

                        <br/>
                        <br/>

                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Status</label>
                            <div class="col-sm-9">
                                <form:select path="status" id="status"  cssClass="form-control">
                                    <form:option value="" label="-- Chọn trạng thái --"  />
                                    <form:option value="1" label="Hoạt Động"/>
                                    <form:option value="0" label="Vô hiệu hóa"/>
                                </form:select>
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

                                &nbsp; &nbsp; &nbsp;
                                <button class="btn" type="reset">
                                    <i class="ace-icon fa fa-undo bigger-110"></i>
                                    Hủy
                                </button>

                            </div>
                        </div>
                        <form:hidden path="id" id="id" />
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
        var id = $('#id').val();
        if (id == "") {
            addUser(data);
        } else {
            updateUser(data);
        }
    });
    function addUser(data) {
        $.ajax({
            url: '${UserAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${UserURL}?id="+result.id+"&message=insert_success";
            },
            error: function (error) {
                window.location.href = "${UserURL}?page=1&limit=2&message=error_system";
            }
        });
    }
    function updateUser(data) {
        $.ajax({
            url: '${UserAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${UserURL}?id="+result.id+"&message=update_success";
            },
            error: function (error) {
                window.location.href = "${UserURL}?&message=error_system";
            }
        });
    }

</script>
</body>
</html>
