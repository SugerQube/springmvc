<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
  <title>首页</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/manager/user" method="post">
  <table border="1" width="500" align="center">
    <tr>
      <td colspan="3">登录:账号与身份不匹配或者账号密码错误</td>
    </tr>
    <tr>
      <td>userName:</td>
      <td colspan="2"><input type="text" name="userName"/></td>
    </tr>
    <tr>
      <td>password:</td>
      <td colspan="2"><input type="password" name="password"/></td>
    </tr>
    <tr>
      <td></td>
      <td colspan="2"><input type="submit" value="登录"/></td>
    </tr>
    <tbody>
    <tr>
      <td><input id="department" type="radio" name="Department" value="管理员" checked="checked">
        管理员</td>
      <td><input id="teacher" type="radio" name="Department" value="老师">
        教师</td>
      <td><input id="student" type="radio" name="Department" value="学生">
        学生</td>
    </tr>
    </tbody>
  </table>
</form>
</body>
</html>
