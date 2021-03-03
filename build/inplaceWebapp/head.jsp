<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 2020/12/19
  Time: 2:46 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<nav class="navbar navbar-default">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
        <a href="index.jsp" class="navbar-brand"><img width="200px" src="home/img/mall_logo2.png" /> </a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li><a href="index.jsp">首页</a></li>
            <li><a onclick="phone('手机')" href="#">手机</a></li>
            <li><a onclick="phone('电脑')" href="#">电脑</a></li>
            <li><a onclick="phone('智能设备')" href="#">智能设备</a></li>
            <li><a onclick="phone('娱乐影音')" href="#">娱乐影音</a></li>
        </ul>
        <i class="carts" onclick="tocart()"></i>

        <span><c:if test="${not empty user }">
            <h4 class="user">${user.username}</h4>
            <a class="logout" href="${pageContext.request.contextPath}/LoginOutServlet">注销</a>
        </c:if>
			<c:if test="${ empty user }">
                <h4 class="signin" data-toggle="modal" data-target="#log-wrapper">登录</h4>
                <h4 class="signup" data-toggle="modal" data-target="#log-wrapper">注册</h4>
            </c:if>
		</span>
    </div>

</nav>

<!-- 模态框（Modal） -->
<div class="modal fade" id="log-wrapper" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-content modal-dialog">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <div class="log">
            <div id="navs-slider">
                <a id="signin" class="active">登录</a>
                <a id="signup">注册</a>
                <span class="navs-slider-bar"></span>
            </div>
            <form id="sign-form-1" style="display: none" method="post" action="${pageContext.request.contextPath}/LoginServlet">
                <div class="group-inputs">
                    <div class="username input-wrapper">
                        <input aria-label="用户名/邮箱" placeholder="用户名/邮箱" required="" type="text" value=""
                               name="username" id="signup-email_adress">
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="password-1" name="password" aria-label="密码"
                               placeholder="密码">
                        <span id="password_message-1"></span>
                    </div>
                    <div class="captcha input-wrapper" data-type="en">
                        <input id="captcha" name="captcha" placeholder="验证码" required="" data-rule-required="true"
                               data-msg-required="请填写验证码">
                        <img class="captcha-img" data-toggle="tooltip" data-placement="top" title="看不清楚？换一张"
                             alt="验证码" src="${pageContext.request.contextPath}/checkImg" id="cimg" onclick="change()">
                    </div>

                    <div class="sign-btn">
                        <button class="btn btn-primary submit" type="submit">登录</button>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="remember" name="remember" value="option1" />
                        <label class="form-check-label" for="remember">记住用户</label>
                    </div>

                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="checkbox" id="autologin" name="autologin" value="option2" />
                        <label class="form-check-label" for="autologin">自动登录</label>
                    </div>
                </div>
            </form>

            <form id="sign-form-2" action="${pageContext.request.contextPath}/RegistServlet" style="display: none" method="post">
                <div class="group-inputs">
                    <div class="username input-wrapper">
                        <input aria-label="用户名" placeholder="用户名" required="" type="text" value=""
                               name="username">
                        <span id="username_message"></span>
                    </div>
                    <div class="email input-wrapper">
                        <input aria-label="邮箱" placeholder="邮箱" required="" type="text" value=""
                               name="email" id="email_adress">
                        <span id="email_message"></span>
                    </div>
                    <div class="input-wrapper password">
                        <input required="" type="password" id="password" name="password" aria-label="密码"
                               placeholder="密码（不少于6位）">
                        <span id="password_message"></span>
                    </div>
                    <!--
                    <div class="input-wrapper password">
                        <input required="" type="password" id="repassword" name="repassword" aria-label="重复密码"
                               placeholder="重复密码">
                        <span id="repassword_message"></span>
                    </div>
                    -->
                    <div class="captcha input-wrapper" data-type="en">
                        <input id="captcha-1" name="captcha" placeholder="验证码" required="" data-rule-required="true"
                               data-msg-required="请填写验证码">
                        <img class="captcha-img" data-toggle="tooltip" data-placement="top" title="看不清楚？换一张"
                             alt="验证码" src="${pageContext.request.contextPath}/checkImg" id="cimg" onclick="change()">
                        <span id="checkcode_message"></span>
                    </div>
                </div>
                <div class="sign-btn">
                    <button class="btn btn-primary submit" type="submit">注册</button>
                </div>
            </form>
        </div>
    </div><!-- /.modal-content -->
</div>

</body>
</html>
