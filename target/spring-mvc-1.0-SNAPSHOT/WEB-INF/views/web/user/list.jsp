<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Thông tin tài khoản</title>
</head>
<body>
  <div class="row">
    

    <div class="col-lg-3">

      <h1 class="my-4"></h1>
      <div class="list-group">
        <a href="<c:url value='/user-view?action=changePassword'/>" class="list-group-item">Đổi mật khẩu</a>
      </div>

    </div>
    <!-- /.col-lg-3 -->


    <c:if test="${action == 'userInfo'}">
    <div class="col-lg-9">
      <h1>Thông tin tài khoản</h1>


      <table class="table">

        <tbody>
          <tr>
            <td>Username :</td>
            <td>Fullname :</td>
            <td>Status :</td>
            <td>Role :</td>
          </tr>
          <tr>
            <td>${USERMODEL.username}</td>
            <td>${USERMODEL.fullname}</td>
            <c:if test="${USERMODEL.status == 1}">
            <td>Hoạt Động</td>
          </c:if>

          <c:if test="${USERMODEL.status == 0}">
          <td>Vô hiệu hóa</td>
        </c:if>
        <td>${USERMODEL.role.name}</td>
      </tr>

    </tbody>
  </table>
</div>
</c:if>

<c:if test="${action == 'changePassword'}">
<div class="col-lg-9">
    <c:if test="${not empty model}">
      <div class="alert alert-<c:out value='${alert}'/>">
        <c:out value='${message}'/>
      </div>
    </c:if>



  <form action="<c:url value='user-view'/>" method="post">
    <h1>Đổi mật khẩu</h1>


    <div class="form-group">
      <label for="usr">Mật khẩu hiện tại:</label>
      <input type="password" name="presentPassword" class="form-control" required="">
    </div>

    <div class="form-group">
      <label for="usr">Nhập mật khẩu :</label>
      <input type="password" id="password" name="password" class="form-control" required="">
    </div>
    <div class="form-group">
      <label for="pwd">Nhập lại mật khẩu :</label>
      <input type="password" id="againPassword" name="againPassword" class="form-control" required="">
    </div>
   
    <button type="submit"  class="btn btn-primary">Submit</button>
    </form>

    


</div>
</c:if>

<!-- /.col-lg-9 -->

</div>
<!-- /.row -->

</body>
</html>