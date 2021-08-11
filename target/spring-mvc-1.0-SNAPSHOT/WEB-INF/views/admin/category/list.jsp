<%@include file="/common/taglib.jsp"%>
<c:url var="CategoryAPI" value="/api/category"/>
<c:url var ="CategoryURL" value="/quan-tri/the-loai/danh-sach"/>
<c:url var ="createCategoryURL" value="/quan-tri/the-loai/chinh-sua"/>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Danh sách thể loại</title>
	</head>

	<body>
		<div class="main-content">
		<form id="formSubmit">
				<div class="main-content-inner">
					<div class="breadcrumbs ace-save-state" id="breadcrumbs">
						<ul class="breadcrumb">
							<li>
								<i class="ace-icon fa fa-home home-icon"></i>
								<a href="<c:url value='/trang-chu'/>">Trang chủ</a>
							</li>
						</ul>
						<!-- /.breadcrumb -->
					</div>
					<div class="page-content">
						<div class="row">
							<div class="col-xs-12">
								<c:if test="${not empty message}">
									<div class="alert alert-<c:out value='${alert}'/>">
  										<c:out value='${message}'/>
									</div>
								</c:if>
								<div class="widget-box table-filter">
									<div class="table-btn-controls">
										<div class="pull-right tableTools-container">
											<div class="dt-buttons btn-overlap btn-group">
												<a flag="info"
												   class="dt-button buttons-colvis btn btn-white btn-primary btn-bold" data-toggle="tooltip"
												   title='Thêm Category' href='${createCategoryURL}'>
															<span>
																<i class="fa fa-plus-circle bigger-110 purple"></i>
															</span>
												</a>
												<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
														class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa thể loại'>
																<span>
																	<i class="fa fa-trash-o bigger-110 pink"></i>
																</span>
												</button>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-xs-12">
										<div class="table-responsive">
											<table class="table table-bordered">
												<thead>
													<tr>
														<th><input type="checkbox" id="checkAll"></th>
														<th>Name</th>
														<th>Code</th>


													</tr>
												</thead>
												<tbody>
													<c:forEach var="item" items="${model.listResult}">
														<tr>
															<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
															<td>${item.name}</td>
															<td>${item.code}</td>
															<td>

																<c:url var="editCategoryURL" value="/quan-tri/the-loai/danh-sach">
																	<c:param name="id" value="${item.id}"/>
																</c:url>

																<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																   title="Cập nhật" href='${editCategoryURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																</a>
															</td>


														</tr>
													</c:forEach>
												</tbody>
											</table>
											<ul class="pagination" id="pagination"></ul>
											<input type="hidden" value="" id="page" name="page"/>
											<input type="hidden" value="" id="limit" name="limit"/>
											<input type="hidden" value="" id="sortName" name="sortName"/>
											<input type="hidden" value="" id="sortBy" name="sortBy"/>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		</form>
		</div>
		<!-- /.main-content -->
		<script>

			$('#checkAll').click(function(){
	        if($('#checkAll').prop('checked')){
	          $('input:checkbox').prop('checked',true);
	        }else{
	          $('input:checkbox').prop('checked',false);
	        }
	      	});

			var totalPages = ${model.totalPage};
			var currentPage = ${model.page};
			var limit = 6;
			$(function () {
				window.pagObj = $('#pagination').twbsPagination({
					totalPages: totalPages,
					visiblePages: 10,
					startPage: currentPage,
					onPageClick: function (event, page) {
						if (currentPage != page) {
							$('#limit').val(limit);
							$('#page').val(page);
							$('#sortName').val('name');
							$('#sortBy').val('desc');
							$('#formSubmit').submit();
						}
					}
				});
			});
			

			
			function deleteCategory(data) {
		        $.ajax({
		            url: '${CategoryAPI}',
		            type: 'DELETE',
		            contentType: 'application/json',
		            data: JSON.stringify(data),
		            success: function (result) {
		                window.location.href = "${CategoryURL}?limit=6&page=1&message=delete_success";
		            },
		            error: function (error) {
		            	window.location.href = "${CategoryURL}?limit=6&page=1&message=error_system";
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
                        deleteCategory(ids);
                    } else if ( result.dismiss === Swal.DismissReason.cancel ) {
                        swalWithBootstrapButtons.fire(
                            'Hủy bỏ thành công'
                        )
                    }
                })
			}


		</script>
	</body>

	</html>