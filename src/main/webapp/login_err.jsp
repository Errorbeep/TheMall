<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 2020/12/31
  Time: 1:40 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Login_Err</title>
</head>
<body>
<img class="erro-img" src="${pageContext.request.contextPath}/home/img/Terrorism.png"
<br />
<h2>${requestScope.login_err}</h2>

</body>
<style>
.erro-img {
    width: 200px;
    height: 200px;
    margin: 100px 580px;
}

h2 {
    display: block;
    width: 200px;
    margin: 10px auto;
}
</style>
</html>
