<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xem Bài Viết Theo Thể Loại</title>
</head>
<body>
<div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Thể Loại</h1>
          <div class="list-group">
            <c:forEach var="item" items="${categories}">
              <a href="<c:url value='/the-loai?page=1&maxPageItem=6&categoryId=${item.id}'/>" class="list-group-item">${item.name}</a>
            </c:forEach>
            
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          

          <div class="row">

            <c:forEach var="item" items="${model.listResult}">
              
              

              <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">

                <c:if test="${not empty item.thumbnail}">
                  <a href="#"><img class="card-img-top" src="${item.thumbnail}" alt=""></a>
                </c:if>
                
                <c:if test="${empty item.thumbnail}">
                  <a href="#"><img class="card-img-top" src="" alt="http://placehold.it/700x400"></a>
                </c:if>

                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">${item.title}</a>
                  </h4>
                  <p class="card-text">${item.shortDescription}</p>
                </div>
                <div class="card-footer">
                  <small class="text-muted">&#9733; &#9733; &#9733; &#9733; &#9734;</small>
                </div>
              </div>
            </div>
            </c:forEach>
            <form action="formSubmit" method="get">
              
                <input type="hidden" value="" name="maxPageItem" id = "maxPageItem"/>
                <input type="hidden" value="" name="page" id = "page"/>
  
            </form>
            

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->
       
      </div>
      <ul class="pagination"  id="pagination"></ul>
      <!-- /.row -->
      <script type="text/javascript">
        
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
                $('#maxPageItem').val(limit);
                $('#page').val(page);
                $('#formSubmit').submit();
              }
            }
          });
        });
  
      </script>
</body>
</html>