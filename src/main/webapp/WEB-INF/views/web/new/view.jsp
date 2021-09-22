<%@ page import="com.laptrinhjavaweb.util.SecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="CommentAPI" value="/api/comment"/>
<c:url var="NewURL" value="/xem-bai-viet"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Bài viết</title>
</head>
<body>

  <div class="row jumbotron jumbotron-fluid rounded">


        <div class="col-lg-9">

          <h2 class="font-weight-bold text-uppercase"><c:out value="${model.title}"/></h2>
            <mark>Thể loại :<c:out value="${category.name}"/></mark>
          <br><br><br>

        <blockquote class="blockquote">
            <p><c:out value="${model.shortDescription}"/></p>
        <img src="<c:out value="${model.thumbnail}"/>" width="660px" height="470px" class="rounded" alt="Cinque Terre"/>
        <hr>
        <p>${model.content}</p>

            <footer class="blockquote-footer">Người viết : <c:out value="${model.createdBy}"/></footer>
            <footer class="blockquote-footer">Ngày tạo   : <c:out value="${model.createdDate}"/></footer>
        </blockquote>


            <h3>Bình Luận</h3>
            <form id="formCommentSubmit">
                <div class="form-group">
                    <label for="comment">Comment:</label>
                    <textarea class="form-control" rows="5" id="content" name="content"></textarea>
                    <input type="hidden" name="userId" id="userId" value="<%=SecurityUtils.getPrincipal().getId()%>">
                    <input type="hidden" name="newId" id="newId" value="${model.id}">
                </div>
                <button type="submit" id="btnComment" class="btn btn-primary">Submit</button>
            </form>


            <div class="page-header">
                <h1> Comments </h1>
            </div>
            <br><br><br>

            <div class="comments-list">
                <c:forEach var="item" items="${listComments}">
                    <div class="media">
                        <div class="media-body">
                            <h5 class="media-heading user_name">
                                    Tài khoản : <c:out value="${item.createdBy}"/>
                            </h5>
                            <c:out value="${item.content}"/>
                            <p><small><a href="">Like</a> - <a href="">Share</a></small></p>
                            <small><c:out value="${item.createdDate}"/></small>
                        </div>
                    </div>
                    <br><br><br>
                </c:forEach>
            </div>


        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->


    </div>


<script>

    $('#btnComment').click(function (e) {
        e.preventDefault();
        var data={};
        var formData = $('#formCommentSubmit').serializeArray();
        $.each(formData,function (i,v) {
            data[""+v.name+""] = v.value;
        });
        addComment(data);
    });


    function addComment(data) {
        $.ajax({
            url: '${CommentAPI}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                window.location.href = "${NewURL}?id="+result.newId;
            },
            error: function (error) {
                window.location.href = "${NewURL}?message=error_system";
            }
        });
    }


</script>
      
</body>
</html>