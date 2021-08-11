<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="api-admin-new"/>
<c:url var="NewURL" value="/new-list"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Trang chủ</title>
</head>
<body>
<div class="row">

        <div class="col-lg-3">

          <h1 class="my-4"><a href="<c:url value='/new-edit?type=edit'/>">Tao bai viet moi</a></h1>
          <div class="list-group">
            <a href="<c:url value='/new-list?type=list&page=1&maxPageItem=3&sortName=title&sortBy=desc'/>" class="list-group-item">Danh sach bai viet</a>
            <a href="<c:url value='/user-view?action=userInfo'/>" class="list-group-item">Thong tin tai khoan</a>
            
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

                <c:if test="${not empty model}">
                  <div class="alert alert-<c:out value='${model.alert}'/>">
                      <c:out value='${model.message}'/>
                  </div>
                </c:if>

          <div class="row">

<form action="<c:url value='/new-list' />"  id="formSubmit" method="get">
  
<table id="customers">
    <tr>
      <th><input type="checkbox" id="checkAll"></th>
      <th>Title</th>
      <th>The loai</th>
      <th></th>
    </tr>
    <c:forEach var="item" items="${model.listResult}">
      <tr>
        <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
        <td>${item.title}</td>
        <td>${item.category.name}</td>
        <td><a href="<c:url value='/view-new?type=view&id=${item.id}'/>">Xem</a></td>
      </tr>
    </c:forEach>

    <c:if test="${empty model}">
      <tr>
        <td>Khong co bai viet nao</td>
        <td></td>
        <td></td>
      </tr>
    </c:if>
</table>


  <ul class="pagination" id="pagination"></ul>

 
<button id="btnDelete" type="button">Xóa bài viết</button>
<input type="hidden" value="" name="maxPageItem" id = "maxPageItem"/>
<input type="hidden" value="" name="page" id = "page"/>
<input type="hidden" value="" name="sortName" id = "sortName"/>
<input type="hidden" value="" name="sortBy" id = "sortBy"/>
<input type="hidden" value="" name="type" id = "type"/>
</form>

<script type="text/javascript">
      $('#checkAll').click(function(){
        if($('#checkAll').prop('checked')){
          $('input:checkbox').prop('checked',true);
        }else{
          $('input:checkbox').prop('checked',false);
        }
      });
      

      var totalPages = ${model.totalPage};
      var currentPage = ${model.page};
      var limit = 3;
      $(function () {
        window.pagObj = $('#pagination').twbsPagination({
          totalPages: totalPages,
          visiblePages: 10,
          startPage: currentPage,
          onPageClick: function (event, page) {
            if (currentPage != page) {
              $('#maxPageItem').val(limit);
              $('#page').val(page);
              $('#sortName').val('title');
              $('#sortBy').val('desc');
              $('#type').val('list');
              $('#formSubmit').submit();
            }
          }
        });
      });
  
  $("#btnDelete").click(function() {
        var data = {};
        var ids = $('tbody input[type=checkbox]:checked').map(function () {
                return $(this).val();
            }).get();
        data['ids'] = ids;
        deleteNew(data);
      });


  function deleteNew(data) {
            $.ajax({
                url: '${APIurl}',
                type: 'DELETE',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (result) {
                    window.location.href = "${NewURL}?type=list&maxPageItem=3&page=1&message=delete_success";
                },
                error: function (error) {
                  window.location.href = "${NewURL}?type=list&maxPageItem=3&page=1&message=error_system";
                }
            });
        }
</script>

            

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->
</body>
</html>