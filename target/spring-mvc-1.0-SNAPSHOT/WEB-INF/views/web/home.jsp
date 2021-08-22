<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chủ</title>
</head>
<body>



   <form action="<c:url value="/trang-chu" />" method="get" id="formSubmit">

       <c:forEach var="item" items="${model.listResult}">

           <div class="row align-items-center my-5">
               <div class="col-lg-7">
                   <img class="img-fluid rounded mb-4 mb-lg-0" src="${item.thumbnail}" alt="">
               </div>
               <!-- /.col-lg-8 -->
               <div class="col-lg-5">
                   <h1 class="font-weight-light"> ${item.title} </h1>
                   <p> ${item.shortDescription} </p>
                   <a class="btn btn-primary" href="<c:url value="/bai-viet?id=${item.id}"/>">Xem chi tiết</a>
               </div>
           </div>

       </c:forEach>
       <!-- /.row -->

       <ul class="pagination" id="pagination"  ></ul>
       <input type="hidden" value="" name="limit" id = "limit"/>
       <input type="hidden" value="" name="page" id = "page"/>
       <input type="hidden" value="" name="sortName" id = "sortName"/>
       <input type="hidden" value="" name="sortBy" id = "sortBy"/>

   </form>




    <!-- Call to Action Well -->
    <div class="card text-white bg-secondary my-5 py-4 text-center">
        <div class="card-body">
            <p class="text-white m-0">This call to action card is a great place to showcase some important information or display a clever tagline!</p>
        </div>
    </div>






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
                    $('#sortName').val('name');
                    $('#sortBy').val('desc');
                    $('#formSubmit').submit();
                }
            }
        });
    });

</script>
</body>
</html>
