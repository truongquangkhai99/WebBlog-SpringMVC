<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Trang chủ</title>
</head>
<body>



   <form action="<c:url value="/trang-chu" />" method="get" id="formSubmit">

       <c:forEach var="item" items="${model.listResult}">

           <div class="row align-items-center my-5">
               <div class="col-lg-7">
                   <img class="img-fluid rounded mb-4 mb-lg-0" src="<c:out value="${item.thumbnail}"/>" alt="">
               </div>
               <!-- /.col-lg-8 -->
               <div class="col-lg-5">
                   <h1 class="font-weight-light"><c:out value="${item.title}"/></h1>
                   <p> <c:out value="${item.shortDescription}"/> </p>
                   <a class="btn btn-primary" href="<c:url value="/xem-bai-viet?id=${item.id}"/>">Xem chi tiết</a>
               </div>
           </div>

       </c:forEach>
       <!-- /.row -->

       <ul class="pagination" id="pagination"  ></ul>
       <input type="hidden" value="5" name="limit" id = "limit"/>
       <input type="hidden" value="1" name="page" id = "page"/>
       <input type="hidden" value="id" name="sortName" id = "sortName"/>
       <input type="hidden" value="desc" name="sortBy" id = "sortBy"/>
       <input type="hidden" value="title" name="searchKey" id = "searchKey"/>

   




    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
	    <div class="form-group">
	    	<input type="text" class="form-control"  name="searchName" placeholder="Tìm kiếm theo tiêu đề bài viết">
	 	</div>
	    <button type="submit" class="btn btn-warning">Tìm Kiếm</button>
    
      
        <div class="card-body">
          <c:forEach items="${categories}" var="item">
            <a href="
              <c:url value="/trang-chu">
                <c:param name="searchKey" value="categoryCode" />
                <c:param name="searchName" value="${item.code}" />
                <c:param name="page" value="1" /> 
                <c:param name="limit" value="5" /> 
                <c:param name="sortName" value="id" /> 
                <c:param name="sortBy" value="desc" /> 
              </c:url>" 
              class="btn btn-outline-light">${item.name}
            </a>
          </c:forEach>
        </div>
    </div>





</form>
<script>

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
                    $('#searchKey').val('${model.searchKey}');
                    $('#searchName').val('${model.searchName}');
                    $('#formSubmit').submit();
                }
            }
        });
    });

</script>
</body>
</html>
