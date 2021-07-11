<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 2020/12/18
  Time: 9:49 下午
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>The Mall</title>

    <!-- Bootstrap -->
    <link href="home/CSS/bootstrap.min.css" rel="stylesheet">

    <link href="home/CSS/main.css" rel="stylesheet">
</head>
<body>

<jsp:include page="head.jsp" />

<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        <li data-target="#carousel-example-generic" data-slide-to="4"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="home/img/mbp.jpg" alt="..." onclick="phone('电脑')">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="home/img/huaweibk.jpg" alt="..." onclick="phone('智能设备')">
            <div class="carousel-caption">

            </div>
        </div>
        <div class="item">
            <img src="home/img/iphone12_2.png" alt="..." onclick="phone('手机')">
            <div class="carousel-caption">
            </div>
        </div>

        <div class="item">
            <img src="home/img/mitv.jpg" alt="..." onclick="phone('娱乐影音')">
            <div class="carousel-caption">
            </div>
        </div>

        <div class="item">
            <img src="home/img/airpods.jpg" alt="..." onclick="phone('手机')">
            <div class="carousel-caption">
            </div>
        </div>

    </div>

    <!-- Controls -->
    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


<section class="sec1">
    <h1>属于你的精彩应有尽有！</h1>
    <a><img width="680px" src="home/img/apple_products.jpg" onclick="findProductById('19')" ></a>
    <a><img src="home/img/iphone12samll.jpg" onclick="findProductById('2')"></a>
    <a><img src="home/img/Y9000X_2021.png" onclick="findProductById('22')"></a>
    <a><img src="home/img/rotatewatch.png"  onclick="findProductById('14')"></a>
</section>

<section class="sec2">
    <h3>手机</h3>
    <a href="javascript:void(0)" onclick="phone('手机')">手机</a>
    <div>
        <c:set var="s" value="100" />
        <c:forEach items="${pro1}" var="p" varStatus="vs" begin="0" end="4" step="1">
            <c:if test="${fn:substring(p.c3code,0,2)=='51' && p.state == 1}">
                <div class="product">
                    <img src="home${p.imgurl}" onclick="findProductById('${p.id}')">
                    <span class="brand">${p.name}</span>
                    <span class="title">${p.description}</span>
                    <span class="price">${p.price}</span>
                    <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>
<section class="sec2">
    <h3>智能设备</h3>
    <a href="javascript:void(0)" onclick="phone('智能设备')">智能设备</a>
    <div>
        <c:forEach items="${pro2}" var="p" varStatus="vs" begin="0" end="4" step="1">
            <c:if test="${fn:substring(p.c3code,0,2)=='52' && p.state == 1}">
                <div class="product">
                    <img src="home${p.imgurl}" onclick="findProductById('${p.id}')">
                    <span class="brand">${p.name}</span>
                    <span class="title">${p.description}</span>
                    <span class="price">${p.price}</span>
                    <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>
<section class="sec2">
    <h3>电脑</h3>
    <a href="javascript:void(0)" onclick="phone('电脑')">电脑</a>
    <div>
        <c:forEach items="${pro3}" var="p" varStatus="vs" begin="0" end="4" step="1">
            <c:if test="${fn:substring(p.c3code,0,2)=='53' && p.state == 1}">
                <div class="product">
                    <img src="home${p.imgurl}" onclick="findProductById('${p.id}')">
                    <span class="brand">${p.name}</span>
                    <span class="title">${p.description}</span>
                    <span class="price">${p.price}</span>
                    <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
                </div>
            </c:if>
        </c:forEach>
    </div>
</section>
<section class="sec3">
    <h3>娱乐影音</h3>
    <a href="javascript:void(0)" onclick="phone('娱乐影音')">娱乐影音</a>
    <div class="wrap">
        <div class="slide">
            <ul>
                <c:forEach items="${pro4}" var="p" varStatus="vs" begin="0" end="4" step="1">
                    <c:if test="${fn:substring(p.c3code,0,2)=='54' && p.state == 1}">
                        <li>
                            <div class="product">
                                <img src="home${p.imgurl}" onclick="findProductById('${p.id}')">
                                <span class="brand">${p.name}</span>
                                <span class="title">${p.description}</span>
                                <span class="price">${p.price}</span>
                                <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>

            </ul>
            <ul>
                <c:forEach items="${pro4}" var="p" varStatus="vs" begin="0" end="4" step="1">
                    <c:if test="${fn:substring(p.c3code,0,2)=='54' && p.state == 1}">
                        <li>
                            <div class="product">
                                <img src="home${p.imgurl}" onclick="findProductById('${p.id}')">
                                <span class="brand">${p.name}</span>
                                <span class="title">${p.description}</span>
                                <span class="price">${p.price}</span>
                                <a href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}"><em class="fast-buy"></em></a>
                            </div>
                        </li>
                    </c:if>
                </c:forEach>

            </ul>

        </div>
        <span class="wrap-left"></span>
        <span class="wrap-right"></span>
    </div>
</section>






<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
<script src="home/JS/jquery.min.js"></script>
<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
<script src="home/JS/bootstrap.min.js"></script>

<script src="home/JS/main.js"></script>

<script>
    function findProductById(id){
        location.href="http://localhost:8081/TheMall/ProductFindByIdServlet?id="+id;
    }
    function change() {
        document.getElementById("cimg").src = "${pageContext.request.contextPath}/checkImg?time="
            + new Date().getTime();
    }
    function phone(obj) {
        location.href="${pageContext.request.contextPath}/FindCategoryServlet?name="+encodeURIComponent(encodeURIComponent(obj));
    }
    function tocart() {
        location.href="http://localhost:8081/TheMall/showcart.jsp";
    }
</script>
</body>
</html>
