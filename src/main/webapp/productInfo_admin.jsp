<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function cancel() {
		window.location="ProductFindAllServlet";
	}
	function modify() {
		var options=$("#threelevel option:selected").val();
		document.getElementById("c3code").value=options;
		document.getElementById("modif").submit();
	}
	function select_onelevel(){
		var ss = document.getElementById("onelevel");
		var onelevelcode = ss.value;
		console.log("onelevelcode----> " + onelevelcode);
		if(!onelevelcode)return; // 声明变量就要判断是否为null
		$.ajax({
			type:"post",//请求方式get/post
			url:"LinkageServlet",//请求对应的地址
			data:{"levelcode":onelevelcode},//往服务器传递的参数，
			success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
				var jdata = data.trim(); // 去前后空格
				if(jdata=="fail"){
					alert("查询失败!");
				}else{
					var json = eval(jdata);//将json字符串对象转化成json
					var sel = document.getElementById('twolevel');
					if(json=='null'){
						sel.options.length = 1;
					}else{
						sel.options.length = 0;

						for(var i=0; i<json.length; i++) {
							sel.add(new Option(json[i].name,json[i].code));
						}
						showthree(json[0].code);
					}
				}
			}
		});
	};
	function selsct_twolevel(){
		var sa = document.getElementById("twolevel");
		var twolevelcode = sa.value;
		if(!twolevelcode)return; // 声明变量就要判断是否为null
		showthree(twolevelcode);
	}
	function showthree(code) {
		$.ajax({
			type:"post",//请求方式get/post
			url:"LinkageServlet",//请求对应的地址
			data:{"levelcode":code},//往服务器传递的参数，
			success:function(data){//服务器交互成功调用的回调函数，data就是服务器端传递出来的数据
				var jdata = data.trim(); // 去前后空格
				if(jdata=="fail"){
					alert("查询失败!");
				}else{
					var json = eval(jdata);//将json字符串对象转化成json
					var sel = document.getElementById('threelevel');
					if(json=='null'){
						sel.options.length = 1;
					}else{
						sel.options.length = 0;
						for(var i=0; i<json.length; i++) {
							sel.add(new Option(json[i].name,json[i].code));
						}
					}
				}
			}
		});
	}
</script>
<div class="card card-info">
	<div class="card-header">
		<h3 class="card-title">Horizontal Form</h3>
	</div>
	<!-- /.card-header -->
	<!-- form start -->
	<form action="${pageContext.request.contextPath}/ProductUpdateServlet" method="post" encType="multipart/form-data" id="modif" class="form-horizontal">
		<input type="hidden" name="id" value="${pro.id}">

		<div class="card-body">
			<div class="form-group row">
				<label for="inputEmail3" class="col-sm-2 col-form-label">商品名称</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputEmail3" placeholder="名称" name="name" value="${pro.name}"><br>
				</div>
			</div>
			<div class="form-group row">
				<label for="inputPassword3" class="col-sm-2 col-form-label">商品价格:</label>
				<input type="hidden" name="c3code" id="c3code">
				<br>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputPassword3" placeholder="Password" name="price" value="${pro.price}">
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
					<select class="form-control" id="twolevel" onchange="selsct_twolevel()">
						<option value="">-请选择-</option>
					</select>
				</div>
				<div class="col-sm-2">
					三级分类：
					<select class="form-control" id="threelevel">
						<option value="">-请选择-</option>
					</select>
				</div>
			</div>

			<div class="form-group row">
				商品数量:<input type="text" name="pnum" value="${pro.pnum}"><br>
			</div>

			<div class="form-group row">
				商品图片:<input type="file" name="f" value="${pro.imgurl }"><br>
			</div>

			<div class="form-group row">
				商品颜色：<input type="text" name="color" value="${pro.color}"><br>
			</div>

			<div class="form-group row">
				商品描述:<textarea rows="10" cols="20" name="description">${pro.description }</textarea><br>
			</div>
			<div class="form-group row">
				商品状态:<input type="text" name="state" value="${pro.state}"><br>
			</div>
		</div>
		<!-- /.card-body -->
		<div class="card-footer">
			<input type="button" class="btn btn-info" value="修改" onclick="modify()">
			<input type="button" class="btn btn-default float-right" value="取消" onclick="cancel()">
		</div>
		<!-- /.card-footer -->
	</form>
</div>
