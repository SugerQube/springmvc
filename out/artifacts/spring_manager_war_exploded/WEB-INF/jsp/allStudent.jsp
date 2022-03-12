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
    <title>所有学生</title>
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
                    <small>学生列表 —— 显示所有学生</small>
                </h1>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-4 column">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/manager/toAddStudent">新增</a>
        </div>
    </div>

    <div class="row clearfix">
        <div class="col-md-12 column">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>学号</th>
                    <th>密码</th>
                    <th>姓名</th>
                    <th>手机号</th>
                    <th>操作</th>
                </tr>
                </thead>

                <tbody>
                <c:forEach var="Student" items="${list}">
                    <tr>
                        <td>${Student.id}</td>
                        <td>${Student.pwd}</td>
                        <td>${Student.name}</td>
                        <td>${Student.phone}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/manager/toUpdateStudent?id=${Student.id}">更改</a> |
                            <a href="${pageContext.request.contextPath}/manager/delStudent?id=${Student.id}">删除</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<footer>
    <a href="${pageContext.request.contextPath}/manager/admin?mod=teacher">切换到老师列表</a>
</footer>
</body>
</html>
