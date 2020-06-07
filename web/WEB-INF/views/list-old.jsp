<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link href="${App_Path}/static/css/theme.css" rel="stylesheet">
    <link href="${App_Path}/static/css/my.css" rel="stylesheet">
</head>
<body>
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
            <a class="navbar-brand" href="index.html">人力资源管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class=""><a href="index.html">首页</a></li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">员工信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="list-old.jsp">查看员工信息</a></li>
                        <li><a href="input.jsp">新增员工信息</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="page-header">
        <h3>查看员工信息</h3>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="pull-right">
                <button type="button" class="btn btn-primary"><span class="glyphicon glyphicon-plus"></span>新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增
                </button>
                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span>批量删除
                </button>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                <tr>
                    <td><input type="checkbox"></td>
                    <th>ID</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>生日</th>
                    <th>email</th>
                    <th>薪水</th>
                    <th>创建日期</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>
                <c:if test="${pageInfo.total eq 0}">
                    <tr>
                        <td colspan="10">没有任何员工信息</td>
                    </tr>
                </c:if>
                <c:if test="${pageInfo.total gt 0}">
                    <c:forEach items="${pageInfo.list}" var="emp">
                        <tr>
                            <td><input type="checkbox" value="${emp.id}"></td>
                            <td>${emp.id}</td>
                            <td>${emp.empName}</td>
                            <td>${emp.empGender == "F" ? '女':'男'}</td>
                            <td>${emp.empBirthday}</td>
                            <td>${emp.empEmail}</td>
                            <td>${emp.empSalary}</td>
                            <td>${emp.createTime}</td>
                            <td>${emp.department.deptName}</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-warning"><span
                                        class="glyphicon glyphicon-wrench"></span> 修改
                                </button>
                                <button type="button" class="btn btn-sm btn-danger"><span
                                        class="glyphicon glyphicon-remove"></span> 删除
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    <span>当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,总${pageInfo.total}条记录</span>
                </c:if>
                </tbody>
            </table>
            <div class="col-lg-offset-4">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <c:if test="${pageInfo.isFirstPage}">
                            <li>
                                <a href="${App_Path}/list?pn=1" aria-label="Previous" class="btn disabled">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.isFirstPage}">
                            <li>
                                <a href="${App_Path}/list?pn=1" aria-label="Previous" class="btn">
                                    <span aria-hidden="true">首页</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${App_Path}/list?pn=${pageInfo.pageNum-1}" aria-label="Previous" class="btn">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${App_Path}/list?pn=${pageInfo.pageNum-1}" aria-label="Previous"
                                   class=" btn disabled">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${pageInfo.navigatepageNums}" var="num">
                            <c:if test="${pageInfo.pageNum eq num}">
                                <li class="active"><a class="btn">${num}</a></li>
                            </c:if>
                            <c:if test="${pageInfo.pageNum ne num}">
                                <li><a href="${App_Path}/list?pn=${num}" class="btn">${num}</a></li>
                            </c:if>
                        </c:forEach>
                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${App_Path}/list?pn=${pageInfo.pageNum+1}" aria-label="Next" class="btn">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.hasNextPage}">
                            <li>
                                <a href="${App_Path}/list?pn=${pageInfo.pageNum+1}" aria-label="Next"
                                   class="btn disabled">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${pageInfo.isLastPage}">
                            <li>
                                <a href="${App_Path}/list?pn=${pageInfo.pages}" aria-label="Previous"
                                   class="btn disabled">
                                    <span aria-hidden="true">末页</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test="${!pageInfo.isLastPage}">
                            <li>
                                <a href="${App_Path}/list?pn=${pageInfo.pages}" aria-label="Previous" class="btn">
                                    <span aria-hidden="true">末页</span>
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>

        </div>
    </div>
</div> <!-- /container -->


<footer class="footer">
    <div class="container">
        <p class="text-muted">©2020 杭州职业技术学院　软件技术专业</p>
    </div>
</footer>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${App_Path}/static/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/js/bootstrap.min.js"></script>
</body>
</html>