<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>美妆管理系统后台</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
  <link rel="stylesheet" href="layui/css/admin.css" media="all"> 
</head>
<body>
  
  <div class="layui-fluid">
    <h4>修改成功</h4>
    <a href="findMyInfoAct?id=${admin.id }" class="layui-btn layui-btn-primary">返回查看</a>
  </div>

 
</body>
<script src="layui/layui.all.js"></script>
<script>

layui.use('element', function(){
  var element = layui.element;
  
});
</html>

    