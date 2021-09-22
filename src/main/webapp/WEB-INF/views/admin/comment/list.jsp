<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="CommentAPI" value="/api/comment"/>
<c:url var="CommentURL" value="/quan-tri/binh-luan/danh-sach"/>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Danh sách comment</title>
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

											<button id="btnDelete" type="button" onclick="warningBeforeDelete()"
													class="dt-button buttons-html5 btn btn-white btn-primary btn-bold" data-toggle="tooltip" title='Xóa Comment'>
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
													<th>UserId</th>
													<th>NewId</th>
													<th>Content</th>
													<th>Thao tác</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="item" items="${model.listResult}">
													<tr>
														<td><input type="checkbox" id="checkbox_${item.id}" value="${item.id}"></td>
														<td><c:out value="${item.userId}"/></td>
														<td><c:out value="${item.newId}"/></td>
														<td><c:out value="${item.content}"/></td>
														<td>
															<c:url var="editCommentURL" value="/quan-tri/binh-luan/chinh-sua">
																<c:param name="id" value="${item.id}"/>
															</c:url>

															<a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
																title="Cập nhật" href='${editCommentURL}'><i class="fa fa-pencil-square-o" aria-hidden="true"></i>
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
						$('#sortName').val('id');
						$('#sortBy').val('desc');
						$('#formSubmit').submit();
					}
				}
			});
		});

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
					deleteComment(ids);
				} else if ( result.dismiss === Swal.DismissReason.cancel ) {
					swalWithBootstrapButtons.fire(
							'Hủy bỏ thành công'
					)
				}
			})
		}
		
		function deleteComment(data) {
			$.ajax({
				url: '${CommentAPI}',
				type: 'DELETE',
				contentType: 'application/json',
				data: JSON.stringify(data),
				success: function (result) {
					window.location.href = "${CommentURL}?page=1&limit=5&sortName=id&sortBy=desc&message=delete_success";
				},
				error: function (error) {
					window.location.href = "${CommentURL}?page=1&limit=5&sortName=id&sortBy=desc&message=error_system";
				}
			});
		}
	</script>
</body>

</html>