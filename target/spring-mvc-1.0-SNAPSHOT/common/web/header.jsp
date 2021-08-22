<%@page import = "com.laptrinhjavaweb.util.SecurityUtils" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<c:url value='/trang-chu?page=1&limit=5' />">Bài viết</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="<c:url value='/trang-chu?page=1&limit=5' /> ">Trang Chu
                        <span class="sr-only">(current)</span>
                    </a>
                </li>

                <security:authorize access = "isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/dang-nhap'/>">Dang nhap</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/dang-ky'/>">Dang ky</a>
                    </li>
                </security:authorize>

                <security:authorize access = "isAuthenticated()">
                   <c:if test="${SecurityUtils.isWriter()}">
                       <li class="nav-item">
                           <a class="nav-link" href="<c:url value="/bai-viet/chinh-sua" />">Tạo bài viết</a>
                       </li>
                       <li class="nav-item">
                           <a class="nav-link" href="<c:url value="/bai-viet/danh-sach?page=1&limit=5" />">Danh Sách</a>
                       </li>
                   </c:if>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Wellcome <%=SecurityUtils.getPrincipal().getFullName()%></a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="<c:url value='/thoat' />">Thoat</a>
                    </li>
                </security:authorize>


            </ul>
        </div>
    </div>
</nav>