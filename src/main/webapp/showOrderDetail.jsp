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
  Time: 9:13 PM
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
</head>

<body>


<c:if test="${not empty detail}">
    <form action="${pageContext.request.contextPath}/UserDelSelectServlet" method="post" id="f">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">所有订单</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                    <tr align="center">
                        <th>编号</th>
                        <th>商品ID</th>
                        <th>商品名</th>
                        <th>购买数量</th>
                        <th>应付金额</th>
                        <th>收货地址</th>
                        <th>付款状态</th>
                        <th>用户ID</th>
                        <th>用户名</th>
                        <th>下单时间</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${detail}" var="d">
                    <tr>
                        <td>${d.itemId }</td>
                        <td>${d.productId}</td>
                        <td>${d.productName }</td>
                        <td>${d.num }</td>
                        <td>${d.payment }</td>
                        <td>${d.address }</td>
                        <td>
                            <c:if test="${d.payState == 0}">
                                未付款
                            </c:if>
                            <c:if test="${d.payState == 1}">
                                已付款
                            </c:if>
                        </td>
                        <td>${d.userId }</td>
                        <td>${d.userName }</td>
                        <td>${d.orderTime }</td>
                    </tr>

                    </c:forEach>
                </table>
            </div>
        </div>
    </form>
</c:if>

</body>
</html>
