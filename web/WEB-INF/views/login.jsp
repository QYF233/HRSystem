<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%
    pageContext.setAttribute("App_Path", request.getContextPath());
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${App_Path}/static/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${App_Path}/static/css/signin.css" rel="stylesheet">

</head>

<body>
<div class="container">
   <%-- <div class="col-lg-4"></div>--%>
    <div class="form-signin center-block">
        <h2 class="form-signin-heading"><fmt:message key="i18n.Please"></fmt:message></h2>
        <br>
        <div class="form-group">
            <fmt:message key="i18n.username"></fmt:message>
            <input type="text" id="user-name-label" name="username" class="form-control" placeholder="<fmt:message key="i18n.Pname"></fmt:message>" required
                   autofocus value="${username}">
            <span class="help-block"></span>
        </div>
        <div class="form-group">
            <fmt:message key="i18n.password"></fmt:message>
            <input type="password" id="user-pwd-label" name="password" class="form-control" placeholder="<fmt:message key="i18n.Ppwd"></fmt:message>" required
                   value="${password}">
            <span class="help-block"></span>
        </div>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="记住我" id="rem" ${rem}><fmt:message key="i18n.rem"></fmt:message>
            </label>
        </div>
        <div class="form-group">
            <button class="btn btn-lg btn-primary btn-block login-btn" type="submit"><fmt:message key="i18n.login"></fmt:message></button>
            <span class="help-block"></span>
        </div>
        <div class="form-group pull-right">
            <a href="${App_Path}/login?lang=zh_CN"><fmt:message key="i18n.Chinese"></fmt:message></a>
            <a href="${App_Path}/login?lang=en_US"><fmt:message key="i18n.English"></fmt:message></a>
        </div>
        <span id="login-time"></span>
    </div>

</div> <!-- /container -->


</body>
<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${App_Path}/static/js/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    $("#user-name-label").change(function () {
        var username = this.value;
        $.ajax({
            url: "${App_Path}/checkAccName",
            data: {"username": username},
            type: "Post",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#user-name-label", "success", "用户名可用");
                } else {
                    show_validate_msg("#user-name-label", "error", result.extend.fail_msg);
                }
            }
        });
    });

    function show_validate_msg(element, status, msg) {
        var ctrl = $(element).parent();
        ctrl.removeClass("has-error has-success");
        if ("success" == status) {
            ctrl.addClass("has-success");
        } else if ("error" == status) {
            ctrl.addClass("has-error");
        }
        ctrl.find("span.help-block").text(msg);
    }
</script>

<script type="text/javascript">
    $(".login-btn").click(function () {
        var username = $("#user-name-label").val();
        var password = $("#user-pwd-label").val();
        var rem = $("#rem").prop("checked");
        /* alert(rem);*/
        $.ajax({
            url: "${App_Path}/login",
            data: {"username": username, "password": password, "rem": rem},
            type: "Post",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    window.location.href = "${App_Path}/index";
                } else {
                    show_validate_msg(".login-btn", "error", result.extend.fail_msg);
                }
            }
        });
    });
</script>
<script type="text/javascript">
    $(".login-btn").click(function () {
        $.ajax({
            url: "${App_Path}/getCookieValue",
            type: "Get",
            dataType: "json",
            success: function (result) {
                $("#login-time").text("1分钟内您已尝试"+result+"次登录");
            }
        });
    });
</script>
</html>
