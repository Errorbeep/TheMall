<%--
  ~ Copyright (c) 2021. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 2021/6/24
  Time: 4:18 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        function del(id) {

            var flag = window.confirm("确认删除吗");

            if (flag) {
                //确认删除
                location.href = "${pageContext.request.contextPath}/UserDelByIdServlet?id="
                    + id;
            }
        }

        function change() {
            //1.得到id为main的这个checkbox
            var main = document.getElementById("main");

            var flag = main.checked;

            //2.得到所有name=ck的checkbox
            var cks = document.getElementsByName("ck");

            //3.将cks中所有的checkbox的checked值设置为flag
            for ( var i = 0; i < cks.length; i++) {
                cks[i].checked = flag;
            }
        }

        function sendDel(){
            var flag = window.confirm("确认删除吗");

            if (flag) {
                //确认删除
                document.getElementById("f").submit();//表单提交
            }

            var cks = document.getElementsByName("ck");

        }

        function sel() {
            var msg = document.getElementById("msg").value;
            if(msg==null||msg=="")
                alert("请输入你要查询的内容！！！");
            document.getElementById("s").submit();

        }
    </script>
</head>

<body>

<c:if test="${empty users}">
    无用户信息<br>
</c:if>


<c:if test="${not empty users}">
    <form action="${pageContext.request.contextPath}/UserDelSelectServlet" method="post" id="f">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">所有用户</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                    <tr align="center">
                        <th><input type="checkbox" id="main" onclick="change();"></th>
                        <th>编号</th>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>邮箱</th>
                        <th>角色</th>
                        <th>状态</th>
                        <th>激活码</th>
                        <th>上次登陆时间</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${users}" var="u">
                    <tr>
                        <td><input type="checkbox" value="${u.id}" name="ck"></td>
                        <td>${u.id }</td>
                        <td>${u.username}</td>
                        <td>${u.password }</td>
                        <td>${u.email }</td>
                        <td>${u.role }</td>
                        <td>
                            <c:if test="${u.state == 2}">
                                已锁定
                            </c:if>
                            <c:if test="${u.state == 1}">
                                已激活
                            </c:if>
                            <c:if test="${u.state == 0}">
                                未激活
                            </c:if>
                        </td>
                        <td>${u.activecode }</td>
                        <td>${u.updatetime }</td>
                        <td width="60px"><a
                            <c:if test="${u.state == 1}">
                                <a href="${pageContext.request.contextPath}/UserUpdateStateServlet?id=${u.id}&newState=2" >锁定</a>
                            </c:if>
                            <c:if test="${u.state == 2}">
                                <a href="${pageContext.request.contextPath}/UserUpdateStateServlet?id=${u.id}&newState=1" >激活</a>
                            </c:if>
                            <a href="javascript:void(0)" onclick="del('${u.id}')">删除</a>
                        </td>
                    </tr>

                    </c:forEach>
                    <tr>
                        <td colspan="10"><a href="javascript:void(0)" onclick="sendDel();">删除选中</a></td>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</c:if>

</body>
</html>
