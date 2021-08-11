<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="CategoryAPI" value="/api/category"/>
<c:url var ="CategoryURL" value="/quan-tri/the-loai/chinh-sua"/>
<html>
<head>
    <title>Chỉnh sửa thể loại</title>
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
                <li class="active">Chỉnh sửa thể loại</li>
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
                                <label class="col-sm-3 control-label no-padding-right">Name</label>
                                <div class="col-sm-9">  
                                    <form:input cssClass="form-control" id="name" path="name"/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Code</label>
                                <div class="col-sm-9">
                                    <form:input cssClass="form-control" id="code" path="code"/>
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
	
    $('#btnAddOrUpdateNew').click(function (e) {
        e.preventDefault();
        var data = {}; 
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        var id = $('#id').val();
        if (id == "") {
            addNew(data);
        } else {
            updateNew(data);
        }
    });
    function addNew(data) {
        $.ajax({
            url: '${CategoryAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${CategoryURL}?page=1&limit=6&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${CategoryURL}?page=1&limit=6&page=1&message=error_system";
            }
        });
    }
    function updateNew(data) {
        $.ajax({
            url: '${CategoryAPI}',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
            	window.location.href = "${CategoryURL}?page=1&limit=6&message=insert_success";
            },
            error: function (error) {
            	window.location.href = "${CategoryURL}?page=1&limit=6&page=1&message=error_system";
            }
        });
    }

    
</script>
</body>
</html>
