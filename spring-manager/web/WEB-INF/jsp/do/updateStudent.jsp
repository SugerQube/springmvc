<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改信息</title>
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
                    <small>修改信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/manager/updateStudent" method="post">
        学号  <input name="id" value="${student.id}" readonly/>
        密码：<input type="text" name="pwd" value="${student.pwd}"/>
        姓名：<input type="text" name="name" value="${student.name}"/>
        <input type="hidden" name="time" value="${student.time}"/>
        手机号：<input type="text" name="phone" value="${student.phone}"/>
        <input type="hidden" name="department" value="${student.time}"/>
        <input type="hidden" name="card" value="${student.card}"/>
        <input type="hidden" name="approve" value="${student.approve}"/>
        <input type="hidden" name="money" value="${student.money}"/>
        <input type="submit" value="提交"/>
    </form>

</div>