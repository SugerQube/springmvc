<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>勤工俭学管理</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .colo {
            color: gray;
        }
    </style>
</head>
<body>
<a href="${pageContext.request.contextPath}"></a>
<c:if test="${(oneTeacher.department.equals('体育'))||(oneTeacher.department.equals('宣传'))}">
    <div class="container">

        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header"><h1>
                    <small>勤工俭学管理</small>
                </h1></div>
            </div>
        </div>
        <h3>职位:${oneTeacher.department}</h3>
        <a>编号:${oneTeacher.id}</a>
        <a>姓名:${oneTeacher.name}</a>

        <div class="container">

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1>
                            <small>等待审核通过的学生</small>
                        </h1>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>部门</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="Student" items="${list}">
                            <c:if test="${Student.department.equals(oneTeacher.department)&&Student.approve.equals('等待部门审核通过')}">
                                <tr>
                                    <td>${Student.id}</td>
                                    <td>${Student.name}</td>
                                    <td>${Student.phone}</td>
                                    <td>${Student.department}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manager/pass1?id=${Student.id}&tid=${oneTeacher.id}">通过</a>
                                        <a href="${pageContext.request.contextPath}/manager/no?id=${Student.id}&tid=${oneTeacher.id}">拒绝</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="container">

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1>
                            <small>日常工时申报</small>
                        </h1>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>工时</th>
                            <th>操作</th>
                            <th>辞退</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="Student" items="${list}">
                            <c:if test="${Student.department.equals(oneTeacher.department)&&Student.money.equals('等待提交')&&Student.approve.equals('在职')}">
                                <tr>
                                    <td>${Student.id}</td>
                                    <td>${Student.name}</td>
                                    <td>${Student.phone}</td>
                                    <td>${Student.time}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manager/money1?id=${Student.id}&tid=${oneTeacher.id}">提交</a>
                                    </td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manager/no?id=${Student.id}&tid=${oneTeacher.id}">辞退</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${(oneTeacher.department.equals('教务'))}">
    <div class="container">

        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header"><h1>
                    <small>勤工俭学管理</small>
                </h1></div>
            </div>
        </div>
        <h3>职位:${oneTeacher.department}</h3>
        <a>编号:${oneTeacher.id}</a>
        <a>姓名:${oneTeacher.name}</a>

        <div class="container">

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1>
                            <small>等待审核通过的学生</small>
                        </h1>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>部门</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="Student" items="${list}">
                            <c:if test="${Student.approve.equals('等待教务审核通过')}">
                                <tr>
                                    <td>${Student.id}</td>
                                    <td>${Student.name}</td>
                                    <td>${Student.phone}</td>
                                    <td>${Student.department}</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manager/pass2?id=${Student.id}&tid=${oneTeacher.id}">通过</a>
                                        <a href="${pageContext.request.contextPath}/manager/no?id=${Student.id}&tid=${oneTeacher.id}">拒绝</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="container">

                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="page-header">
                            <h1>
                                <small>辞退学生</small>
                            </h1>
                        </div>
                    </div>
                </div>

                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>手机号</th>
                                <th>部门</th>
                                <th>工时</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="Student" items="${list}">
                                <c:if test="${Student.approve.equals('在职')}">
                                    <tr>
                                        <td>${Student.id}</td>
                                        <td>${Student.name}</td>
                                        <td>${Student.phone}</td>
                                        <td>${Student.department}</td>
                                        <td>${Student.time}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/manager/no?id=${Student.id}&tid=${oneTeacher.id}">辞退</a>
                                        </td>
                                     </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${(oneTeacher.department.equals('财务'))}">
    <div class="container">

        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="page-header"><h1>
                    <small>勤工俭学管理</small>
                </h1></div>
            </div>
        </div>
        <h3>职位:${oneTeacher.department}</h3>
        <a>编号:${oneTeacher.id}</a>
        <a>姓名:${oneTeacher.name}</a>

        <div class="container">

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <div class="page-header">
                        <h1>
                            <small>等待发放薪酬的学生</small>
                        </h1>
                    </div>
                </div>
            </div>

            <div class="row clearfix">
                <div class="col-md-12 column">
                    <table class="table table-hover table-striped">
                        <thead>
                        <tr>
                            <th>学号</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>部门</th>
                            <th>银行卡号</th>
                            <th>工时</th>
                            <th>应得薪酬</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:forEach var="Student" items="${list}">
                            <c:if test="${Student.money.equals('等待发放')}">
                                <tr>
                                    <td>${Student.id}</td>
                                    <td>${Student.name}</td>
                                    <td>${Student.phone}</td>
                                    <td>${Student.department}</td>
                                    <td>${Student.card}</td>
                                    <td>${Student.time}</td>
                                    <td>${Student.time*3.14}克黄金</td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/manager/money2?id=${Student.id}&tid=${oneTeacher.id}">发放</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="container">

                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <div class="page-header">
                            <h1>
                                <small>辞退学生</small>
                            </h1>
                        </div>
                    </div>
                </div>

                <div class="row clearfix">
                    <div class="col-md-12 column">
                        <table class="table table-hover table-striped">
                            <thead>
                            <tr>
                                <th>学号</th>
                                <th>姓名</th>
                                <th>手机号</th>
                                <th>部门</th>
                                <th>工时</th>
                                <th>操作</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="Student" items="${list}">
                                <c:if test="${Student.approve.equals('在职')}">
                                    <tr>
                                        <td>${Student.id}</td>
                                        <td>${Student.name}</td>
                                        <td>${Student.phone}</td>
                                        <td>${Student.department}</td>
                                        <td>${Student.time}</td>
                                        <td>
                                            <a href="${pageContext.request.contextPath}/manager/no?id=${Student.id}&tid=${oneTeacher.id}">辞退</a>
                                        </td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
</body>
</html>