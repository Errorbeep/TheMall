<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单个商品详细信息</title>
<link rel="stylesheet" type="text/css" href="home/CSS/main.css">
</head>
<body>
<section class="w">
<div class="product-img">
    <div class="handle">
        <div class="thumb">
        </div>
    </div>
    <div class="view">
        <img src="home${pro.imgurl }">
    </div>
</div>
<div class="product-details">
    <h1>${pro.name}</h1>
    <p class="re"><span>产品编号：</span><span>RE202012101843${pro.id}</span></p>
    <p class="price" data-price="3649">
        <span>价格</span>
        <span class="price">${pro.price }</span>
    </p>
    <ul class="details">
        <li><span>颜色</span><a class="u-check n-check">${pro.color }</a></li>
        <li><span>选择版本</span><a class="u-check n-check">官方标配</a></li>
        <li><span>详情</span><a class="u-check n-check">${pro.description}</a></li>
        <li><span>销售地区</span><a class="u-check n-check">中国</a></li>
        <li><span>购买数量：</span>
            <div class="count-box">
                    <input class="min" name="" type="button" value="-"/>
                    <input class="text-box" id="num" name="" type="text" value="1"/>
                    <input class="add" name="" type="button" value="+"/>
                </div>
        </li>
    </ul>
    <c:if test="${not empty user}">
        <div class="action">
            <a class="buy"	href="fastbuy.jsp">立即购买</a>

            <a class="addCar" onclick="addProductToCart('${pro.id}')"><i></i>加入购物车</a>
        </div>
    </c:if>
    <c:if test="${empty user}">
        <div class="action">
            <a class="buy"	href="index.jsp">返回登录</a>
        </div>
    </c:if>
</div>
</section>

<script type="text/javascript">
	function addProductToCart(id){
	    var num = document.getElementById("num").value;
		location.href="${pageContext.request.contextPath}/AddProductToCartServlet?id=" + id + "&num=" + num;
	}
</script>
<script type="text/javascript" src="home/JS/jquery.min.js"></script>
<script type="text/javascript" src="home/JS/jquery-ui.js"></script>
<script type="text/javascript" src="home/JS/bootstrap.min.js"></script>
<script type="text/javascript" src="home/JS/bg-canvas.js"></script>
<script type="text/javascript" src="home/JS/main.js"></script>

</body>
</html>
