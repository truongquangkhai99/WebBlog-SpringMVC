<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${model.title}</title>
</head>
<body>

  <div class="row jumbotron jumbotron-fluid rounded">

       <div class="col-lg-3">

          <h1 class="my-4">Thể Loại</h1>
          <div class="list-group">
            <c:forEach var="item" items="${categories}">
              <c:if test="${model.category.code == item.code}">
                <a href="<c:url value='/the-loai?page=1&maxPageItem=6&categoryId=${item.id}'/>" class="list-group-item bg-warning text-white">${item.name}</a>
              </c:if>

              <c:if test="${model.category.code != item.code}">
                <a href="<c:url value='/the-loai?page=1&maxPageItem=6&categoryId=${item.id}'/>" class="list-group-item">${item.name}</a>
              </c:if>

            </c:forEach>
            
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <h2 class="font-weight-bold text-uppercase">${model.title}</h2>
          <br>

        <blockquote class="blockquote">
            <p><mark>Dân trí</mark>${model.shortDescription}</p>
        <img src="${model.thumbnail}" width="660px" height="470px" class="rounded" alt="Cinque Terre"/>
        <hr>
        <p>${model.content}</p>

            <footer class="blockquote-footer">Actor : ${model.createdBy}</footer> 
            <footer class="blockquote-footer">CreatedDate : ${model.createdDate}</footer>   
        </blockquote>

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->


    </div>
    
      
</body>
</html>
