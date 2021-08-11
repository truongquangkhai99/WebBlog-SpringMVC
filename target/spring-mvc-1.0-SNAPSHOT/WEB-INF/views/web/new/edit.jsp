<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<c:url var="APIurl" value="api-admin-new"/>
<c:url var="NewList" value="new-list?type=list&page=1&maxPageItem=3&sortName=title&sortBy=desc"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tạo bài viêt mới</title>
</head>
<body>
<div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Thể Loại</h1>
          <div class="list-group">
            <a href="<c:url value='/new-list?type=list&page=1&maxPageItem=3&sortName=title&sortBy=desc'/>" class="list-group-item">Danh sach bai viet</a>
            <a href="#" class="list-group-item">Thong tin tai khoan</a>
            
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          

          <div class="row">

                          <form id="formSubmit">
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Thể loại</label>
                                <div class="col-sm-9">
                                    




                                    <select class="form-control" id="categoryId" name="categoryId">
                                        
                                            <option value="">Chọn loại bài viết</option>
                                            <c:forEach var="item" items="${categories}">
                                                <option value="${item.id}">${item.name}</option>
                                            </c:forEach>
                                       
                                        
                                    </select>



                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Tiêu đề</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="title" name="title" value=""/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Hình đại diện</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="thumbnail" name="thumbnail" value=""/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Mô tả ngắn</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" id="shortDescription" name="shortDescription" value=""/>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <label class="col-sm-3 control-label no-padding-right">Nội dung</label>
                                <div class="col-sm-9">                                 
                                    <textarea rows="" cols="" id="content" name="content" style="width: 820px;height: 175px"></textarea>
                                </div>
                            </div>
                            <br/>
                            <br/>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    
                                        <input type="button" class="btn btn-white btn-warning btn-bold" value="Thêm bài viết" id="btnAddNew"/>
                                    
                                </div>
                            </div>
                            
                        </form>

            

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

<script>
  var editor = '';
  $(document).ready(function(){
    editor = CKEDITOR.replace( 'content');
  });

$('#btnAddNew').click(function(e){
    e.preventDefault();
    var data = {};
    var formData = $('#formSubmit').serializeArray();
    $.each(formData,function(i,v){
        data[""+v.name+""] = v.value;
    });
    data["content"] = editor.getData();
    addNew(data);
});

function addNew(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${NewList}&message=insert_success&alert=success";
            },
            error: function (error) {
                window.location.href = "${NewList}&message=error_system&alert=danger";
            }
        });
    }
  
   
</script>
</body>
</html>