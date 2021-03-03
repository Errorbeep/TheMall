<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

 <section class="order" >
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
      
 
	<ul class="order-content">		
	
        <ul>
            <li>
                <img src="home${sessionScope.pro.imgurl}">
            </li>
            <li><div class="order-details">${sessionScope.pro.description}</div></li>
            <li><span class="price">${sessionScope.pro.price}</span></li>
            <li><span class="order-count">1</span></li>
        </ul>
      	<c:set value="${sessionScope.pro.price}" var="money" />

            <div class="order-sum">${sessionScope.pro.price}</div>
        </ul>
        <div class="order-foot">
            <ul>
                <li><div class="order-adress">
                    <input aria-label="送货地址" placeholder="送货地址" type="text" id="receiverInfoText">
                </div></li>
                <!-- <li><a class="sum-btn"	href="${pageContext.request.contextPath}/AddOrderServlet?money=${sessionScope.pro.price}&user_id=${sessionScope.user.id}">生成订单</a></li> -->
               <li><button id="btn-sub" class="sum-btn">提交订单</button></li>
            </ul>
        </div>
    </section>
    <aside class="aside-tool">
    <ul>
        <li class="customer">
            <a href="http://wpa.qq.com/msgrd?v=3&uin=476759153&site=qq&menu=yes" target=_blank
               clickid=guanwang_navigation_customer>联系客服</a>
        </li>
        <li class="top"></li>
    </ul>
</aside>
<footer>
</footer>

	<script type="text/javascript">
	function phone(obj) {
		location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
	}
	document.getElementById("btn-sub").onclick = function () {
        window.location.href="${pageContext.request.contextPath}/AddOrderServlet?money=${sessionScope.pro.price}&user_id=${sessionScope.user.id}&receiverinfo=" +
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