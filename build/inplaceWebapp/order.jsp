<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" type="text/css" href="home/CSS/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="home/CSS/main.css">
</head>
<body>

<jsp:include page="head.jsp" />

 <section class="order">
        <div class="head">订单</div>
        <div class="title">
            <ul>
                <li>商品名称</li>
                <li>单价</li>
                <li>数量</li>
                <li>总价</li>
            </ul>
            </ul>
        </div>
        
  	<c:set value="0" var="money"></c:set>
	<ul class="order-content">		
	<c:forEach items="${cart}" var="c">
            <ul>
            <li>
                <img src="home${c.key.imgurl}">
            </li>
            <li><div class="order-details">${c.key.description}</div></li>
            <li><span class="price">${c.key.price }</span></li>
            <li><span class="order-count">${c.value}</span></li>
        </ul>
      	<c:set value="${money+c.key.price*c.value}" var="money"></c:set>
	</c:forEach>
	
            <div class="order-sum">${money}</div>
        </ul>
        <div class="order-foot">
            <ul>
                <li><div class="order-adress">
                    <input aria-label="送货地址" placeholder="送货地址" type="text" id="receiverInfoText">
                </div></li>
                <!-- <li><a class="sum-btn"	href="${pageContext.request.contextPath}/AddOrderServlet">生成订单</a></li> -->
                <li><button id="btn-sub" class="sum-btn">提交订单</button></li>

            </ul>
        </div>
    </section>
<aside class="aside-tool">
</aside>
<footer>
</footer>

	<script type="text/javascript">
	function phone(obj) {
		location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
	}
    document.getElementById("btn-sub").onclick = function () {
        window.location.href="${pageContext.request.contextPath}/AddOrderServlet?money=${money}&user_id=${sessionScope.user.id}&receiverinfo=" +
            document.getElementById("receiverInfoText").value;
    }
	</script>
    <script type="text/javascript" src="home/JS/jquery.min.js"></script>
    <script type="text/javascript" src="home/JS/jquery-ui.js"></script>
    <script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="home/JS/bg-canvas.js"></script>
    <script type="text/javascript" src="home/JS/main.js"></script>
</body>
</html>