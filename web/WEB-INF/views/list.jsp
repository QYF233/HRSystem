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
    <link href="${App_Path}/static/css/bootstrap-select.min.css" rel="stylesheet">
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
            <a class="navbar-brand" href="${App_Path}/index">人力资源管理系统</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class=""><a href="${App_Path}/index">首页</a></li>
                <li class="dropdown active">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">员工信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class=""><a href="${App_Path}/list">查看员工信息</a></li>
                        <li><a href="${App_Path}/input">新增员工信息</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">部门信息 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="${App_Path}/dept-list">查看部门信息</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a id="login-a" href="${App_Path}/login">登录</a><a id="accName" class="hidden">${accName}</a></li>
                <li><a href="${App_Path}/exit">退出</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="page-header">
        <h3>查看员工信息</h3>
    </div>
    <div class="row">
        <input type="hidden" id="pn" value="${requestScope.pn}">
        <div class="col-md-12">
            <div class="pull-right">
                <button type="button" class="btn btn-info" id="emp_download_all_btn"
                        onclick="window.location.href='${App_Path}/testExcel'"><span
                        class="glyphicon glyphicon-download"></span>&nbsp;下载数据
                </button>
                <button class="btn btn-primary" id="emp_add_btn" data-toggle="modal" data-target="#input-modal"><span
                        class="glyphicon glyphicon-plus"></span>&nbsp;新&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;增
                </button>
                <button type="button" class="btn btn-danger" id="emp_delete_all_btn"><span
                        class="glyphicon glyphicon-remove"></span>&nbsp;批量删除
                </button>
            </div>
            <table class="table table-striped table-hover" id="emps-table">
                <thead>
                <tr>
                    <th><input type="checkbox" id="checkAll"></th>
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

                </tbody>
                <tfoot>

                </tfoot>
            </table>
        </div>
    </div>
</div> <!-- /container -->


<footer class="footer">
    <div class="container">
        <p class="text-muted">©2020 杭州职业技术学院　软件技术专业</p>
    </div>
</footer>
<%--模态框--%>
<!-- 按钮触发模态框 -->
<%--<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">开始演示模态框</button>--%>
<!-- 模态框（Modal） -->
<div class="modal fade" id="input-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header col-sm-12">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel-input">添加员工信息</h4>
            </div>
            <div class="modal-body col-sm-12">
                <form id="modal-form-input">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName_add_input" name="empName"
                                   placeholder="请输入姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10 radio">
                            <label>
                                <input type="radio" name="empGender-add" id="empGender1_add_input" value="1">男
                            </label>
                            <label>
                                <input type="radio" name="empGender-add" id="empGender2_add_input" value="0">女
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empBirthday_add_input" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empBirthday_add_input" name="empBirthday"
                                   placeholder="请输入生日"
                                   aria-describedby="help-birthday">
                            <span id="help-birthday-input" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empEmail_add_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="empEmail_add_input" name="empEmail"
                                   placeholder="请输入Email"
                                   aria-describedby="help-email">
                            <span id="help-emai-input" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empSalary_add_input" class="col-sm-2 control-label">薪水</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empSalary_add_input" name="empSalary"
                                   placeholder="请输入薪水"
                                   aria-describedby="help-salary">
                            <span id="help-salary-input" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="department_add_input" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10 select">
                            <select class="selectpicker form-control" name="deptId" id="department_add_input"
                                    title="请选择部门">
                            </select>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_save_btn">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--修改模态框--%>
<div class="modal fade" id="edit-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header col-sm-12">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel-edit">修改员工信息</h4>
            </div>
            <div class="modal-body col-sm-12">
                <form id="modal-form-edit">
                    <div class="form-group">
                        <label for="empName_edit_input" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empName_edit_input" name="empName"
                                   placeholder="请输入姓名">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10 radio">
                            <label>
                                <input type="radio" name="empGender" id="empGender1_edit_input" value="1">男
                            </label>
                            <label>
                                <input type="radio" name="empGender" id="empGender2_edit_input" value="0">女
                            </label>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empBirthday_edit_input" class="col-sm-2 control-label">生日</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empBirthday_edit_input" name="empBirthday"
                                   placeholder="请输入生日"
                                   aria-describedby="help-birthday">
                            <span id="help-birthday" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empEmail_edit_input" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="empEmail_edit_input" name="empEmail"
                                   placeholder="请输入Email"
                                   aria-describedby="help-email">
                            <span id="help-email" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="empSalary_edit_input" class="col-sm-2 control-label">薪水</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="empSalary_edit_input" name="empSalary"
                                   placeholder="请输入薪水"
                                   aria-describedby="help-salary">
                            <span id="help-salary" class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="selectpicker_edit_input" class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10 select">
                            <select class="selectpicker form-control" name="deptId" id="selectpicker_edit_input"
                                    title="请选择部门">
                            </select>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_edit_btn" edit-id="" pn="">提交</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="${App_Path}/static/js/jquery.min.js"></script>
<script src="${App_Path}/static/js/bootstrap-select.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="${App_Path}/static/js/bootstrap.min.js"></script>
<script type="text/javascript">
    var currPage = $("#pn").val();
    $(function () {
        to_page(currPage);
    });

    function to_page(pn) {
        /*加载数据*/
        $.ajax({
            url: "${App_Path}/emps",
            data: {"pn": pn},
            type: "GET",
            dataType: "json",
            beforeSend: function () {
                $("#emps-table tbody").empty();
                $("#emps-table tfoot").empty();
                $("#emps-table tbody").append("<tr><td colspan='10'>正在加载数据，请稍候！</td></tr>");
            },
            success: function (result) {
                if (result.code == 100) {
                    if (result.extend.pageInfo.list.length > 0) {
                        //1.解析员工数据并显示
                        build_emps_table(result);
                        //2.解析分页数据并显示
                        build_page_nav(result);
                        currPage = result.extend.pageInfo.pageNum;
                        $("#pn").val(currPage);
                        $("#checkAll").prop("checked", false);
                    } else {
                        $("#emps-table tbody").empty();
                        $("#emps-table tfoot").empty();
                        $("#emps-table tbody").append("<tr><td colspan='10'>没有任何员工信息</td></tr>");
                    }
                }
            }
        })
    }

    /* data-toggle="modal" data-target="#input-modal"*/
    /*数据显示*/
    function build_emps_table(result) {
        $("#emps-table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, emp) {
            var chkId = $("<td></td>").append($("<input>").attr({"type": "checkbox"}).addClass("check_item"));
            var empIdTd = $("<td></td>").append(emp.id);
            var empNameTd = $("<td></td>").append(emp.empName);
            var empGenderTd = $("<td></td>").append(emp.empGender == 1 ? '男' : '女');
            var empBirthdayId = $("<td></td>").append(emp.empBirthday);
            var empEmailId = $("<td></td>").append(emp.empEmail);
            var empSalaryId = $("<td></td>").append(emp.empSalary);
            var createTimeId = $("<td></td>").append(emp.createTime);
            var deptNameId = $("<td></td>").append(emp.department.deptName);
            var changeBtn = $("<button></button>").addClass("btn btn-sm btn-warning edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-wrench").append("修改"));
            var delBtn = $("<button></button>").addClass("btn btn-sm btn-danger delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-remove").append("删除"));
            var changeModalBtn = $("<button  data-toggle='modal' data-target='#edit-modal'></button>").addClass("btn btn-sm btn-success edit_modal_btn").append($("<span></span>").addClass("glyphicon glyphicon-wrench").append("修改"));
            changeBtn.attr({"edit-id": emp.id, "pn": result.extend.pageInfo.pageNum});
            delBtn.attr("delete-id", emp.id);
            changeModalBtn.attr({
                "edit-id": emp.id,
                "pn": result.extend.pageInfo.pageNum,
                "onclick": 'values(' + emp.id + ')'
            });
            $("#emp_edit_btn").attr("pn",result.extend.pageInfo.pageNum);
            var operate = $("<td></td>").append(changeBtn).append("&nbsp;").append(delBtn).append("&nbsp;").append(changeModalBtn);
            $("<tr></tr>").attr("edit-id", emp.id).append(chkId).append(empIdTd).append(empNameTd).append(empGenderTd).append(empBirthdayId)
                .append(empEmailId).append(empSalaryId).append(createTimeId).append(deptNameId).append(operate)
                .appendTo("#emps-table tbody");
        });
    }

    /*翻页*/
    function build_page_nav(result) {

        $("#emps-table tfoot").empty();
        var pageInfoTd = $("<td></td>").addClass("").attr({"colspan": 4}).append("当前第" + result.extend.pageInfo.pageNum + "页，总" + result.extend.pageInfo.pages + "页，总" + result.extend.pageInfo.total + "条记录");
        var pageUI = $("<ul></ul>").addClass("pagination");
        /*首页*/
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页"));
        if (result.extend.pageInfo.isFirstPage) {
            firstPageLi.addClass("disabled");
        } else {
            firstPageLi.click(function () {
                to_page(1);
            });
        }
        pageUI.append(firstPageLi);
        /*前一页*/
        var PreviousPageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (!result.extend.pageInfo.hasPreviousPage) {
            PreviousPageLi.addClass("disabled");
        } else {
            PreviousPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }
        pageUI.append(PreviousPageLi);

        /*12345*/
        $.each(result.extend.pageInfo.navigatepageNums, function (index, num) {
            var pageLi = $("<li></li>").append($("<a></a>").append(num));
            if (result.extend.pageInfo.pageNum === num) {
                pageLi.addClass("active");
            } else {
                pageLi.click(function () {
                    to_page(num);
                });
            }
            pageUI.append(pageLi);
        });

        /*后一页*/
        var NextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        if (!result.extend.pageInfo.hasNextPage) {
            NextPageLi.addClass("disabled");
        } else {
            NextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum + 1);
            });
        }
        pageUI.append(NextPageLi);

        /*末页*/
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页"));
        if (result.extend.pageInfo.isLastPage) {
            lastPageLi.addClass("disabled");
        } else {
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });
        }
        pageUI.append(lastPageLi);

        var ul = $("<td></td>").append(pageUI).attr({"colspan": 6});
        $("<tr></tr>").append(pageInfoTd).append(ul).appendTo("#emps-table tfoot");
    }

    /*单个删除*/
    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if (confirm("确认删除[" + empName + "]吗？")) {
            $.ajax({
                url: "${App_Path}/emp/" + $(this).attr("delete-id"),
                type: "delete",
                dataType: "json",
                success: function (result) {
                    alert(result.msg);
                    if (result.code === 100) {
                        //删除成功，刷新数据
                        to_page(currPage);
                    }
                }
            });
        }
    });


    /*全选*/
    $("#checkAll").click(function () {
        //设置表格中的复选框选择状态与当前状态一直
        //attr获取自定义属性值，prop获取或修改原生dom属性值
        $(".check_item").prop("checked", $(this).prop("checked"));
    });
    $(document).on("click", ".check_item", function () {
        var flag = $(".check_item").length === $(".check_item:checked").length;
        $("#checkAll").prop("checked", flag);
    });


    $("#emp_delete_all_btn").click(function () {
        var empNames = '', empIds = '';
        var btns = $(".delete_btn");
        $.each($(".check_item:checked"), function () {
            empIds += $(this).parents("tr").find(btns).attr("delete-id") + "-";
            empNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
        });
        empIds = empIds.substring(0, empIds.length - 1);
        empNames = empNames.substring(0, empNames.length - 1);
        if (empIds === '') {
            alert("请选择数据！");
        } else {
            if (confirm("确认删除[" + empNames + "]吗？")) {
                $.ajax({
                    url: "${App_Path}/emp/" + empIds,
                    type: "delete",
                    dataType: "json",
                    success: function (result) {
                        alert(result.msg);
                        if (result.code === 100) {
                            $("#checkAll").prop("checked", false);
                            //删除成功，刷新数据
                            to_page(currPage);
                        }
                    }
                });
            }
        }
    });


    /*修改*/
    $(document).on("click", ".edit_btn", function () {
        window.location.href = "${App_Path}/edit/" + $(this).attr("edit-id") + "-" + $(this).attr("pn");
    })
</script>
<%--添加--%>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${App_Path}/depts",
            type: "GET",
            dataType: "json",
            beforeSend: function () {
                $("#input-modal input").empty();
                $("#input-modal select").empty();
                $("#input-modal select").attr({"title": "正在加载数据..."});
            },
            success: function (result) {
                if (result.code == 100) {
                    $("#input-modal select").empty();
                    $("#input-modal select").attr({"title": "请选择部门"});
                    $.each(result.extend.pageInfo.list, function (index, dept) {
                        var optionEle = $("<option></option>").attr({"value": dept.id}).append(dept.deptName);
                        optionEle.appendTo($("#input-modal select"));
                    });
                    $("#input-modal select").selectpicker("refresh");
                    $("#input-modal select").parent().find("button").attr({"title": "请选择部门"});
                    $("#input-modal select").parent().find("div.filter-option-inner-inner").text("请选择部门");
                }
            }
        });
    });

    $("#emp_save_btn").click(function () {
        //验证表单属性

        if (!validate_add_form()) {
            return false;
        }

        //验证重名
        //发送保存员工信息的请求
        $.ajax({
            url: "${App_Path}/emp",
            data: $("#modal-form-input").serialize(),
            type: "POST",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    window.location.href = "${App_Path}/list";
                } else {
                    if (undefined != result.extend.fieldErrors.empName) {
                        show_validate_msg("#empName_add_input", "error", "用户名错误", 2);
                    }
                    if (undefined != result.extend.fieldErrors.empEmail) {
                        show_validate_msg("#empEmail_add_input", "error", "email格式错误", 2);
                    }
                }
            }
        });
        return false;
    });

    function validate_add_form() {
        var empName = $("#empName_add_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_add_input", "error", "用户名必须是2-5位中文或6-16位英文和数字的组合！", 2);
            return false;
        } else {
            show_validate_msg("#empName_add_input", "success", "", 2);
        }

        var flag = false;
        $("[name='empGender-add']").each(function (index, item) {
            if (item.checked == true) flag = true;
        });
        if (!flag) {
            show_validate_msg("[name='empGender']", "error", "请选择性别", 3);
            return false;
        } else {
            show_validate_msg("[name='empGender']", "success", "", 3);
        }

        var empBirthday = $("#empBirthday_add_input").val();
        var regBirthday = /(^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$)/;
        if (!regBirthday.test(empBirthday)) {
            show_validate_msg("#empBirthday_add_input", "error", "生日格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empBirthday_add_input", "success", "", 2);
        }
        var empEmail = $("#empEmail_add_input").val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]|w+)*$/;
        if (!regEmail.test(empEmail)) {
            show_validate_msg("#empEmail_add_input", "error", "email格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empEmail_add_input", "success", "", 2);
        }
        var empSalary = $("#empSalary_add_input").val();
        var regSalary = /(^[0-9]{1,9}$)/;
        if (!regSalary.test(empSalary)) {
            show_validate_msg("#empSalary_add_input", "error", "薪水格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empSalary_add_input", "success", "", 2);
        }
        if ($("[name='deptId']").val() == '') {
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

    $("#empName_add_input").change(function () {
        var empName = this.value;
        $.ajax({
            url: "${App_Path}/checkEmpName",
            data: {"empName": empName},
            type: "Post",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_add_input", "success", "用户名可用", 2);
                } else {
                    show_validate_msg("#empName_add_input", "error", result.extend.fail_msg, 2);
                }
            }
        });
    });
    $(function () {
        var accName = $("#accName").text();
        if (accName !== '' && accName != null) {
            $("#login-a").addClass("hidden");
            $("#accName").removeClass("hidden");
        }
    });
</script>
<%--修改--%>
<script type="text/javascript">
    function values(ID) {
        $('#emp_edit_btn').attr("edit-id", ID);
    }
    $("#edit-modal").on('shown.bs.modal', function () {
        $.ajax({
            url: "${App_Path}/depts",
            type: "GET",
            dataType: "json",
            success: function (result) {
                $("#edit-modal select").empty();
                $.each(result.extend.pageInfo.list, function (index, dept) {
                    optionElement = $("<option></option>").append(dept.deptName).attr({"value": dept.id, "id": index});
                    optionElement.appendTo($("#edit-modal select"));
                });
                getEmp($("#emp_edit_btn").attr("edit-id"));
                $("#edit-modal select").selectpicker("refresh");
            }
        });

        function getEmp(id) {
            $.ajax({
                url: "${App_Path}/emp/" + id,
                type: "GET",
                dataType: "json",
                success: function (result) {
                    if (result.code == 100) {
                        var empData = result.extend.emp;
                        $("#empName_edit_input").val(empData.empName);
                        if (empData.empGender == 1) {
                            $("#empGender1_edit_input").prop("checked", true);
                        } else {
                            $("#empGender2_edit_input").prop("checked", true);
                        }
                        $("#empBirthday_edit_input").val(empData.empBirthday);
                        $("#empEmail_edit_input").val(empData.empEmail);
                        $("#empSalary_edit_input").val(empData.empSalary);
                        $("#selectpicker_edit_input").selectpicker('val', [empData.deptId]);
                        $("#selectpicker_edit_input").selectpicker("refresh");
                    }
                }
            });
        }


    });

    $("#emp_edit_btn").click(function () {
        var pn = $(this).attr("pn");
        if (!validate_edit_form()) {
            return false;
        }
        $.ajax({
            url: "${App_Path}/emp/" + $(this).attr("edit-id"),
            data: $("#modal-form-edit").serialize(),
            type: "PUT",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    window.location.href = "${App_Path}/list?pn=" + pn;
                } else {
                    if (undefined != result.extend.fieldErrors.empName) {
                        show_validate_msg("#empName", "error", "用户名错误", 2);
                    }
                    if (undefined != result.extend.fieldErrors.empEmail) {
                        show_validate_msg("#empEmail", "error", "email格式错误", 2);
                    }
                }
            }
        });
        return false;
    })

    /*表单验证*/
    function validate_edit_form() {
        var empName = $("#empName_edit_input").val();
        var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if (!regName.test(empName)) {
            show_validate_msg("#empName_edit_input", "error", "用户名必须是2-5位中文或6-16位英文和数字的组合！", 2);
            return false;
        } else {
            show_validate_msg("#empName_edit_input", "success", "", 2);
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

        var empBirthday = $("#empBirthday_edit_input").val();
        var regBirthday = /(^(19|20)\d{2}-(1[0-2]|0?[1-9])-(0?[1-9]|[1-2][0-9]|3[0-1])$)/;
        if (!regBirthday.test(empBirthday)) {
            show_validate_msg("#empBirthday_edit_input", "error", "生日格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empBirthday_edit_input", "success", "", 2);
        }
        var empEmail = $("#empEmail_edit_input").val();
        var regEmail = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]|w+)*$/;
        if (!regEmail.test(empEmail)) {
            show_validate_msg("#empEmail_edit_input", "error", "email格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empEmail_edit_input", "success", "", 2);
        }
        var empSalary = $("#empSalary_edit_input").val();
        var regSalary = /(^[0-9]{1,9}$)/;
        if (!regSalary.test(empSalary)) {
            show_validate_msg("#empSalary_edit_input", "error", "薪水格式不正确", 2);
            return false;
        } else {
            show_validate_msg("#empSalary_edit_input", "success", "", 2);
        }
        if ($("#selectpicker_edit_input").val() == '') {
            show_validate_msg("#selectpicker_edit_input", "error", "请选择部门", 3);
            return false;
        } else {
            show_validate_msg("#selectpicker_edit_input", "success", "", 3);
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

    /*动态验证*/
    $("#empName_edit_input").change(function () {
        var empName = this.value;
        $.ajax({
            url: "${App_Path}/checkEmpName",
            data: {"empName": empName},
            type: "Post",
            dataType: "json",
            success: function (result) {
                if (result.code == 100) {
                    show_validate_msg("#empName_edit_input", "success", "用户名可用", 2);
                } else {
                    show_validate_msg("#empName_edit_input", "error", result.extend.fail_msg, 2);
                }
            }
        });
    });
</script>
</body>
</html>