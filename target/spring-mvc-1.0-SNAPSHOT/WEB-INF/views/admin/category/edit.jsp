<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="CategoryAPI" value="/api/category"/>
<c:url var ="CategoryURL" value="/quan-tri/the-loai/danh-sach"/>
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
                        <c:url value = "/quan-tri/the-loai/chinh-sua" var="CategoryPostURL"/>
                        <form:form action="${CategoryPostURL}" method="post" modelAttribute="model">
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
                                        <input type="submit" class="btn btn-white btn-warning btn-bold" value="Cập nhật"/>
                                    </c:if>
                                    <c:if test="${empty model.id}">
                                        <input type="submit" class="btn btn-white btn-warning btn-bold" value="Thêm" />
                                    </c:if>
                                </div>
                            </div>
                            <form:hidden id="id" path="id"/>
                            <input type="hidden"  name="${_csrf.parameterName}"   value="${_csrf.token}"/>
                        </form:form>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
