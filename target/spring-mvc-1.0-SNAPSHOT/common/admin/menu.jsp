<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<div id="sidebar" class="sidebar responsive ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <div class="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>
    <ul class="nav nav-list">
        <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Quản lý bài viết
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                    <a href="<c:url value='/quan-tri/bai-viet/danh-sach?page=1&limit=6'/>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS bài viết
                    </a>
                    <b class="arrow"></b>
                </li>

                <li>
                    <a href="<c:url value='/quan-tri/the-loai/danh-sach?page=1&limit=6&${_csrf.parameterName}=${_csrf.token}'/>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS thể loại
                    </a>
                    <b class="arrow"></b>
                </li>

                <li>
                    <a href="<c:url value='/quan-tri/nguoi-dung/danh-sach?page=1&limit=6'/>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS người dùng
                    </a>
                    <b class="arrow"></b>
                </li>

                <li>
                    <a href="<c:url value='/quan-tri/binh-luan/danh-sach?page=1&limit=6'/>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS bình luận
                    </a>
                    <b class="arrow"></b>
                </li>

                <li>
                    <a href="<c:url value='/quan-tri/vai-tro/danh-sach?page=1&limit=6'/>">
                        <i class="menu-icon fa fa-caret-right"></i>
                        DS Roles
                    </a>
                    <b class="arrow"></b>
                </li>


            </ul>
        </li>
    </ul>
    <div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>