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
    <link href="${App_Path}/static/css/bootstrap-select.min.css" rel="stylesheet">
    <!---->


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
            <a class="navbar-brand" href="${App_Path}">人力资源管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class=""><a href="${App_Path}">首页</a></li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">员工信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="list">查看员工信息</a></li>
                        <li class="active"><a href="input">新增员工信息</a></li>
                    </ul>
                </li>
            </ul>
            <!--   <ul class="nav navbar-nav navbar-right">
                   <li><a href="../navbar/">Default</a></li>
                   <li><a href="../navbar-static-top/">Static top</a></li>
                   <li class="active"><a href="./">Fixed top <span class="sr-only">(current)</span></a></li>
               </ul>-->
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">
    <div class="page-header">
        <h3>新增员工信息</h3>
    </div>
    <div class="col-lg-12">
        <form class="form-horizontal" role="form" method="post" action="${App_Path}/emp">
            <div class="form-group">
                <label for="empName" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="empName" name="empName" placeholder="请输入姓名"
                    <c:if test="${requestScope.employee !=null && requestScope.employee.empName !=null}">
                           value="${requestScope.employee.empName}"
                    </c:if>
                    >
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10 radio">
                    <label>
                        <input type="radio" name="empGender" id="empGender1_add_input" value="1"
                        <c:if test="${requestScope.employee !=null && requestScope.employee.empGender == 1}">
                              checked
                        </c:if>
                        >男
                    </label>
                    <label>
                        <input type="radio" name="empGender" id="empGender2_add_input" value="0"
                        <c:if test="${requestScope.employee !=null && requestScope.employee.empGender == 0}">
                               checked
                        </c:if>
                        >女
                    </label>
                    <span class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="empBirthday" class="col-sm-2 control-label">生日</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="empBirthday" name="empBirthday" placeholder="请输入生日"
                           aria-describedby="help-birthday"
                    <c:if test="${requestScope.employee !=null && requestScope.employee.empBirthday != null}">
                           value="${requestScope.employee.empBirthday}"
                    </c:if>
                    >
                    <span id="help-birthday" class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="empEmail" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="email" class="form-control" id="empEmail" name="empEmail" placeholder="请输入Email"
                           aria-describedby="help-email"
                    <c:if test="${requestScope.employee !=null && requestScope.employee.empEmail != null}">
                           value="${requestScope.employee.empEmail}"
                    </c:if>
                    >
                    <span id="help-email" class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="empSalary" class="col-sm-2 control-label">薪水</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="empSalary" name="empSalary" placeholder="请输入薪水"
                           aria-describedby="help-salary"
                    <c:if test="${requestScope.employee !=null && requestScope.employee.empSalary != null}">
                           value="${requestScope.employee.empSalary}"
                    </c:if>
                    >
                    <span id="help-salary" class="help-block"></span>
                </div>
            </div>
            <div class="form-group">
                <label for="department" class="col-sm-2 control-label">部门</label>
                <div class="col-sm-10 select">
                    <select class="selectpicker form-control" name="deptId" id="department" title="请选择部门">
                        <c:forEach items="${requestScope.depts}" var="dept">
                            <option value="${dept.id}">${dept.deptName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <button class="btn btn-lg btn-primary btn-block" type="button" id="emp_save_btn">提交</button>
        </form>

    </div>
</div> <!-- /container -->


<footer class="footer">
    <div class="container">
        <p class="text-muted">©2020 杭州职业技术学院　软件技术专业</p>
    </div>
</footer>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${App_Path}/static/js/jquery.min.js"></script>
<script src="${App_Path}/static/js/bootstrap-select.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/js/bootstrap.min.js"></script>
<script src="javascripts/prettify.js"></script>

<script type="text/javascript">
    window.onload = function () {
        $('.selectpicker').selectpicker();
    };
</script>

<script type="text/javascript">
    $("#emp_save_btn").click(function () {
        if (!validate_add_form()) {
            return false;
        }
        $("form").submit();
    });

    function validate_add_form() {
        var empName = $("#empName").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName", "error", "用户名必须是2-5位中文或6-16位英文和数字的组合！", 2);
            return false;
        } else {
            show_validate_msg("#empName", "success", "", 2);
        }


        var flag = false;
        $("[name='empGender']").each(function (index, item) {
            if (item.checked == true) flag = true;
        });
        if (!flag) {
            show_validate_msg("[name='empGender']", "error", "请选择性别", 3);
            return false;
        } else {
            show_validate_msg("[name='empGender']", "success", "", 3);
        }

        var empBirthday = $("#empBirthday").val();
        var regBirthday = /(^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$)/;
        if (!regBirthday.test(empBirthday)) {
            show_validate_msg("#empBirthday", "error", "生日格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empBirthday", "success", "", 2);
        }
        var empEmail = $("#empEmail").val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]|w+)*$/;
        if (!regEmail.test(empEmail)) {
            show_validate_msg("#empEmail", "error", "email格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empEmail", "success", "", 2);
        }
        var empSalary = $("#empSalary").val();
        var regSalary = /(^[\w]{1,9}$)/;
        if (!regSalary.test(empSalary)) {
            show_validate_msg("#empSalary", "error", "薪水格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empSalary", "success", "", 2);
        }
        if ($("[name='deptId']").val() == null) {
            show_validate_msg("[name='deptId']", "error", "请选择部门", 3);
            return false;
        } else {
            show_validate_msg("[name='deptId']", "success", "", 3);
        }
        return true;
    }

    function show_validate_msg(element, status, msg, level) {
        var ctrl;
        if (level == 2) {
            ctrl = $(element).parent().parent();
        } else {
            ctrl = $(element).parent().parent().parent();
        }
        ctrl.removeClass("has-error has-success");
        if ("success" == status) {
            ctrl.addClass("has-success");
        } else if ("error" == status) {
            ctrl.addClass("has-error");
        }
        ctrl.find("span.help-block").text(msg);
    }

    $("#empName").change(function () {
        var empName = this.value;
        $.ajax({
            url: "${App_Path}/checkEmpName",
            data: {"empName": empName},
            type: "Post",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName", "success", "用户名可用", 2);
                } else {
                    show_validate_msg("#empName", "error", result.extend.fail_msg, 2);
                }
            }
        });
    });
</script>


</body>
</html>