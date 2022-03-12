<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人信息</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .colo{color: gray;}
    </style>
</head>
<body>
<div class="container">

    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="page-header">
                <h1>
                    <small>个人信息</small>
                </h1>
            </div>
        </div>
    </div>

    <form action="${pageContext.request.contextPath}/manager/submit1" method="post">
        学号：<input name="id" value="${oneStudent.id}" readonly class="colo"/><br/>
        密码：<input type="text" name="pwd" value="${oneStudent.pwd}"/><br/>
        姓名：<input type="text" name="name" value="${oneStudent.name}"/><br/>
        工时：<input type="text" name="time" value="${oneStudent.time}"/><br/>
        电话：<input type="text" name="phone" value="${oneStudent.phone}"/><br/>

        <c:choose>
            <c:when test="${oneStudent.department.equals('宣传')}">
                部门：<select name="department">
                <option value = ""></option>
                <option value ="宣传" selected>宣传</option>
                <option value="体育">体育</option>
                </select>
            </c:when>
            <c:when test="${oneStudent.department.equals('体育')}">
                部门：<select name="department">
                <option value = ""></option>
                <option value ="宣传">宣传</option>
                <option value="体育" selected>体育</option>
                </select>
            </c:when>
            <c:otherwise>
                部门：<select name="department">
                <option value = "" selected></option>
                <option value ="宣传">宣传</option>
                <option value="体育">体育</option>
                </select>
            </c:otherwise>
        </c:choose>
        <br/>
        银行卡：<input type="text" name="card" value="${oneStudent.card}"/><br/>
        审核情况：<input type="text" name="approve" value="${oneStudent.approve}" readonly class="colo"/><br/>
        应得薪酬：<input type="text" value="${oneStudent.time*3.14159}克黄金" readonly class="colo" disabled/><br/>
        <input type="hidden" name="money" value="${oneStudent.money}">
        <input type="submit" value="提交"/>
    </form>

</div>