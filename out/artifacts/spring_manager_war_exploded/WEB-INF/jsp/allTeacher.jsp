<%--
  Created by IntelliJ IDEA.
  User: 21510
  Date: 2021/12/8
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有老师</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>老师列表 —— 显示所有老师</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="#">新增</a>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>编号</th>
                    <th>密码</th>
                    <th>姓名</th>
                    <th>部门</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="Teacher" items="${list}">
                    <tr>
                        <td>${Teacher.id}</td>
                        <td>${Teacher.pwd}</td>
                        <td>${Teacher.name}</td>
                        <td>${Teacher.department}</td>
                        <td>
                            <a href="#">更改</a> |
                            <a href="#">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<footer>
    <a href="${pageContext.request.contextPath}/manager/admin?mod=student">切换到学生列表</a>
</footer>
</body>
</html>
