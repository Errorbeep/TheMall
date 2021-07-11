<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function cancel() {
		window.location="${pageContext.request.contextPath}/ProductFindAllServlet";
	}
	function add() {
		// var options=$("#threelevel option:selected").val();
		const code = document.getElementById("c3code").value;
		console.log(code)
		document.getElementById("add").submit();
	}
</script>

<div class="card card-info">
	<div class="card-header">
		<h3 class="card-title">添加新的商品</h3>
	</div>
	<!-- /.card-header -->
	<!-- form start -->
	<div class="card-body">
		<form action="${pageContext.request.contextPath}/ProductAddServlet" class="form-horizontal"
			  method="post" encType="multipart/form-data" id="add">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">商品名称</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3" placeholder="名称" name="name" ><br>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">商品价格:</label>
				<input type="hidden" name="c3code" id="c3code">
				<br>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputPassword3" placeholder="价格" name="price" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">商品类别:</label>

				<div class="col-sm-2">
					一级分类：
					<select class="form-control" id ="onelevel" onchange="select_onelevel()">
						<option value="">-请选择-</option>
						<c:forEach var="index" begin="0" end="${sessionScope.onelevel.size()-1}">
							<option value="${sessionScope.onelevel.get(index).code}">${sessionScope.onelevel.get(index).name}</option>
						</c:forEach>
					</select>
				</div>

				<div class="col-sm-2">
					二级分类：
					<select class="form-control" id="twolevel" onchange="add_twolevel()">
						<option value="">-请选择-</option>
					</select>
				</div>
			</div>
				<div class="form-group row">
					商品数量:<input type="text" name="pnum" ><br>
				</div>

				<div class="form-group row">
					商品图片:<input type="file" name="f" ><br>
				</div>

				<div class="form-group row">
					商品颜色：<input type="text" name="color" ><br>
				</div>

				<div class="form-group row">
					商品描述:<textarea rows="10" cols="20" name="description"></textarea><br>
				</div>
				<!-- /.card-body -->
				<div class="card-footer">
					<input type="button" class="btn btn-info" value="添加" onclick="add()">
					<input type="button" class="btn btn-default float-right" value="取消" onclick="cancel()">
				</div>
				<!-- /.card-footer -->
		</form>
	</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/home/JS/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/home/JS/onload.js"></script>
