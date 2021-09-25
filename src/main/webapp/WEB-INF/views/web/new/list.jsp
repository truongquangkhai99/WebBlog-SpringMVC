<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewAPI" value="/api/new" />
<c:url var="NewURL" value="/bai-viet/danh-sach" />
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Danh sách bài viết</title>
</head>

<body>
<form action="<c:url value='/bai-viet/danh-sach' />" id="formSubmit" method="get">
    <div class="row">
        <div class="col-lg-9">
           
           <c:if test="${not empty message}">
              <div class="alert alert-<c:out value='${alert}'/>">
                  <c:out value='${message}'/>
              </div>
           </c:if>
           
            
                
               <div class="page-content">
                   <div class="row">
                       <div class="col-xs-12">
                        <button id="btnDelete" type="button" class="btn btn-dark" onclick="warningBeforeDelete()">Xóa bài viết</button>
                           <div class="table-responsive">
                               <table class="table table-dark">
                                   <thead>
                                       <tr>
                                           <th><input type="checkbox" id="checkAll"></th>
                                           <th>Tên bài viết</th>
                                           <th>Mô tả ngắn</th>
                                           <th>Thao tác</th>
                                       </tr>
                                   </thead>
                                   <tbody>
                                       <c:forEach var="item" items="${model.listResult}">
                                           <tr>
                                               <td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
                                               <td>
                                                   <c:out value="${item.title}" />
                                               </td>
                                               <td>
                                                   <c:out value="${item.shortDescription}" />
                                               </td>
                                               <td>
                                                   <c:url var="updateNewURL" value="/bai-viet/chinh-sua">
                                                       <c:param name="id" value="${item.id}" />
                                                   </c:url>

                                                   <a title="Cập nhật" href='${updateNewURL}' class="btn btn-warning" >Cập Nhật</a>

                                               </td>
                                           </tr>
                                       </c:forEach>
                                   </tbody>
                               </table>
                               <ul class="pagination" id="pagination"></ul>
                               <input type="hidden" value="1" id="page" name="page"/>
                               <input type="hidden" value="5" id="limit" name="limit"/>
                               <input type="hidden" value="id" id="sortName" name="sortName"/>
                               <input type="hidden" value="desc" id="sortBy" name="sortBy"/>
                           </div>
                       </div>
                   </div>
               </div>
                    
                
            
        </div>
        
    	<div class="col-lg-3">
    		
              <div class="form-group">
                <label for="sel1">Tìm kiếm</label>
                <select class="form-control" id="searchKey" name="searchKey">
                  <option value="title">Title</option>                                        
                </select>
              </div>
              
              <div class="form-group">
                <input type="text" class="form-control" placeholder="Nhập vào để tìm kiếm" id="searchName" name="searchName" />
                <span class="input-group-btn">
                  <button class="btn btn-light" type="submit">Search</button>
                </span>
              </div>
    	</div>
    </div>
    </form>
    <script type="text/javascript">

    $('#checkAll').click(function() {
        if ($('#checkAll').prop('checked')) {
            $('input:checkbox').prop('checked', true);
        } else {
            $('input:checkbox').prop('checked', false);
        }
    });

    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};
    var limit = 5;
    $(function() {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function(event, page) {
                if (currentPage != page) {
                    $('#limit').val(limit);
                    $('#page').val(page);
                    $('#sortName').val('id');
                    $('#sortBy').val('desc');
                    $('#formSubmit').submit();
                    $('#searchKey').val('${model.searchKey}');
                    $('#searchName').val('${model.searchName}');
                }
            }
        });
    });





    function deleteNew(data) {
        $.ajax({
            url: '${NewAPI}',
            type: 'DELETE',
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function(result) {
                window.location.href = "${NewURL}?limit=5&page=1&sortName=id&sortBy=desc&message=delete_success";
            },
            error: function(error) {
                window.location.href = "${NewURL}?limit=5&page=1&sortName=id&sortBy=desc&message=error_system";
            }
        });
    }

    function warningBeforeDelete() {
        const swalWithBootstrapButtons = Swal.mixin({
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false
        })

        swalWithBootstrapButtons.fire({
            title: 'Xác nhận xóa?',
            text: "Bạn có chắc muốn xóa!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Xác nhận',
            cancelButtonText: 'Hủy bỏ',
            reverseButtons: true
        }).then((result) => {
            if (result.isConfirmed) {
                var ids = $('tbody input[type=checkbox]:checked').map(function() {
                    return $(this).val();
                }).get();
                deleteNew(ids);
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                swalWithBootstrapButtons.fire(
                    'Hủy bỏ thành công'
                )
            }
        })
    }
    
    </script>
</body>

</html>