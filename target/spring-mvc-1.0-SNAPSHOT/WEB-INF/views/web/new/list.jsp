<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="NewAPI" value="/api/new"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Danh sách bài viết</title>
</head>
<body>
<div class="row">




        <div class="col-lg-9">

            <c:if test="${not empty message}">
                <div class="alert alert-<c:out value='${alert}'/>">
                    <c:out value='${message}'/>
                </div>
            </c:if>

          <div class="row">

    <form action="<c:url value='/bai-viet/danh-sach' />"  id="formSubmit" method="get">
        <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <div class="table-responsive">
                    <table class="table table-bordered">
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
                                <td><c:out value="${item.title}"/></td>
                                <td><c:out value="${item.shortDescription}"/></td>
                                <td>
                                    <c:url var="updateNewURL" value="/bai-viet/chinh-sua">
                                        <c:param name="id" value="${item.id}"/>
                                    </c:url>
                                    <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
                                       title="Cập nhật bài viết" href='${updateNewURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
                                    </a>
                                </td>




                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <ul class="pagination" id="pagination"></ul>
                    <button id="btnDelete" type="button" onclick="warningBeforeDelete()">Xóa bài viết</button>
                    <input type="hidden" value="" id="page" name="page"/>
                    <input type="hidden" value="" id="limit" name="limit"/>
                    <input type="hidden" value="" id="sortName" name="sortName"/>
                    <input type="hidden" value="" id="sortBy" name="sortBy"/>
                </div>
            </div>
        </div>
        </div>




 



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
    var limit = 5;
    $(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#limit').val(limit);
                    $('#page').val(page);
                    $('#sortName').val('title');
                    $('#sortBy').val('desc');
                    $('#formSubmit').submit();
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
            success: function (result) {
                window.location.href = "${NewURL}?limit=5&page=1&message=delete_success";
            },
            error: function (error) {
                window.location.href = "${NewURL}?limit=5&page=1&message=error_system";
            }
        });
    }

    function warningBeforeDelete(){
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
                var ids = $('tbody input[type=checkbox]:checked').map(function () {
                    return $(this).val();
                }).get();
                deleteNew(ids);
            } else if ( result.dismiss === Swal.DismissReason.cancel ) {
                swalWithBootstrapButtons.fire(
                    'Hủy bỏ thành công'
                )
            }
        })
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