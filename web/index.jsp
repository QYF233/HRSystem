<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>HR System</title>

    <!-- Bootstrap -->
    <link href="${App_Path}/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="${App_Path}/static/css/sticky-footer-navbar.css" rel="stylesheet">
    <style>
        .header {
            font-size: 100px;
        }
    </style>
</head>


<body>
<h1>
    <a href="index">点我进入index</a>
</h1>
<div class="hidden">
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                        aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${App_Path}/index">人力资源管理系统</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="${App_Path}">首页</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                           aria-expanded="false">员工信息 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="${App_Path}/list">查看员工信息</a></li>
                            <li><a href="${App_Path}/input">新增员工信息</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="${App_Path}/login">登录</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>

    <div class="container">
        <div class="header text-center">Welcome! ${accName}</div>
        <div class="page-header">
            <h3>请选择操作</h3>
        </div>

        <a class="btn btn-lg btn-primary btn-block" href="${App_Path}/list">
            <span class="glyphicon glyphicon-th-list"></span>
            查看员工信息
        </a>
        <a class="btn btn-lg btn-primary btn-block" href="${App_Path}/input">
            <span class="glyphicon glyphicon-download-alt"></span>
            新增员工信息
        </a>

    </div> <!-- /container -->


    <footer class="footer">
        <div class="container">
            <p class="text-muted">©2020 杭州职业技术学院　软件技术专业</p>
        </div>
    </footer>
</div>


<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${App_Path}/static/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/js/bootstrap.min.js"></script>
</body>
</html>