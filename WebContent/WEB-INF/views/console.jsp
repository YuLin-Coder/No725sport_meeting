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
  <title>管理系统</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all">
  <link rel="stylesheet" href="layui/css/admin.css" media="all"> 
</head>
<body>
  
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      
      <div class="layui-col-md4">
        <div class="layui-card">
          <div class="layui-card-header">欢迎来到校运动会后台管理系统</div>
        </div>
       
      
      </div>
      
    </div>
  </div>

 
</body>
<script src="layui/layui.all.js"></script>
<script>

layui.use('element', function(){
  var element = layui.element;
  
});
</html>

    