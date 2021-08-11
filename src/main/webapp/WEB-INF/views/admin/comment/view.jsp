<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="/common/taglib.jsp"%>
<c:set var = "Title" value="Xem thông tin bình luận"/>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${Title}</title>
    </head>
    <body>
        <div class="main-content">
            <div class="main-content-inner">
                <div class="breadcrumbs ace-save-state" id="breadcrumbs">
                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Trang chủ</a>
                        </li>
                        <li class="active">${Title}</li>
                        </ul><!-- /.breadcrumb -->
                    </div>
                    <div class="page-content">
                        <div class="row" >
                            <div class="col-xs-12">
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Content</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="title" name="title" value="${model.content}"/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Người đăng</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="title" name="title" value="${model.user.username}"/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Role</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="title" name="title" value="${model.user.role.name}"/>
                                    </div>
                                </div>
                                <br/>
                                <br/>
                                 
                                <c:if test="${model.user.status == 0}">
                                   <c:set var="trangThai" value="Vô hiệu hóa"/>
                                </c:if>

                                <c:if test="${model.user.status == 1}">
                                   <c:set var="trangThai" value="Hoạt động"/>  
                                </c:if>

                                <div class="form-group">
                                    <label class="col-sm-3 control-label no-padding-right">Role</label>
                                    <div class="col-sm-9">
                                        <input type="text" class="form-control" id="title" name="title" value="${trangThai}"/>
                                    </div>
                                </div>

                               
                                <br/>
                                <br/>
                            </div>
                        </div>
                    </div>
                </div>
                </div><!-- /.main-content -->
                <script type="text/javascript">
                
                    var type = "";
                    type = "${model.type}";
                    if(type == "view"){
                    $("input").prop('disabled', true);                
                    }
                </script>
            </body>
        </html>