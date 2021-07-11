<%--
  Created by IntelliJ IDEA.
  User: me
  Date: 2021/6/24
  Time: 10:49 AM
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
                location.href = "${pageContext.request.contextPath}/ProductDelByIdServlet?id="
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

<c:if test="${empty pro}">
    无商品信息<br>
    <a href="${pageContext.request.contextPath}/CategoryServlet">添加</a>
</c:if>


<c:if test="${not empty pro}">
    <div align="center">
        <form action="${pageContext.request.contextPath}/ProductSimpleServlet" method="post" id="s">
            <select name="field">
                <option disabled="disabled">请选择条件</option>
                <option value="name">按商品名称查询</option>
                <option value="description">按商品描述查询</option>
            </select>
            <input type="text" name="msg" id="msg">
            <input type="button" value="查询" onclick="sel()">
        </form>
    </div>
    <br>
    <form action="${pageContext.request.contextPath}/ProductDelSelectServlet" method="post" id="f">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">回收站中的商品</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
                <table id="example1" class="table table-bordered table-striped">
                    <thead>
                    <tr align="center">
                        <th><input type="checkbox" id="main" onclick="change();"></th>
                        <th>商品编号</th>
                        <th>商品名称</th>
                        <th>商品价格</th>
                        <th>商品数量</th>
                        <th>商品分类</th>
                        <th>商品颜色</th>
                        <th>商品图片</th>
                        <th>商品描述</th>
                        <th>商品状态</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach items="${sessionScope.pro}" var="p">
                    <c:if test="${p.state == 0}">
                    <tr>
                        <td><input type="checkbox" value="${p.id}" name="ck"></td>
                        <td>${p.id }</td>
                        <td>${p.name}</td>
                        <td>${p.price }</td>
                        <td>${p.pnum }</td>
                        <td>${p.c3code }</td>
                        <td>${p.color }</td>
                        <td height="160" width="200"><img alt="图片不存在或已删除" src="home${p.imgurl}" width="200" height="160"></td>
                        <td>${p.description }</td>
                        <td width="50px">
                            <c:if test="${p.state == 0}">
                                回收中
                            </c:if>
                        </td>
                        <td width="60px"><a
                                href="${pageContext.request.contextPath}/ProductFindByIdServlet?id=${p.id}">编辑</a>
                            <br>
                            <a href="${pageContext.request.contextPath}/PruductUpdateStateServlet?id=${p.id}&newState=2" >恢复</a>
                            <a href="javascript:void(0)" onclick="del('${p.id}')">删除</a>
                        </td>
                    </tr>

                    </c:if>
                    </c:forEach>
                    <tr>
                        <td colspan="10"><a href="javascript:void(0)" onclick="sendDel();">删除选中</a></td>
                        <td><a href="${pageContext.request.contextPath}/CategoryServlet">添加</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</c:if>

</body>
</html>
