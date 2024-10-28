<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>校园运动会管理系统</title>
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css"> 
</head>
<body>

 
    <form action="<%=path %>/loginAct" method="post" onSubmit="return tijiao(this)" id="loginForm" name="loginForm">
    <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>校园运动会管理系统登录</h2>
       <span id="error2" style="color:red">${msg}</span>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
          <input type="text" name="username" lay-verify="username" id="username"  placeholder="用户名" class="layui-input">
        <span id="error" style="color:red">${msg1}</span>
        </div>
       
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="pwd" lay-verify="pwd" id="pwd" placeholder="密码" class="layui-input">
         <span id="error1" style="color:red">${msg2}</span>
        </div>
     	<div class="layui-form-item" style="align:center;">
           
          <div class="layui-form-item">
            <!-- <input type="radio" name="type" value="1" title="学生" > -->
             <input type="radio" name="type" value="2" title="裁判员" checked>
            <input type="radio" name="type" value="3" title="管理员">
          </div>
        </div>
        <div class="layui-form-item">
         <!--  <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit">注 册</button> -->
         <button type="submit" id="denglu" class="layui-btn layui-btn-fluid">登录</button>
         
        </div>
        
            <div class="layui-form-item">
         <!--  <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit">注 册</button> -->
         <button type="button" onclick="location.href='webIndex'" class="layui-btn layui-btn-normal layui-btn-fluid">返回首页</button>
         
        </div>
        
       
       
      </div>
    </div>
    
   

  </div>
		
	


<script src="<%=path %>/layui/layui.js"></script>
<script>

layui.use([ 'form','jquery','layer' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑

	 
	
	  
	 $('#denglu').click(function(){  
		  var $1 = $.trim($('#username').val());
		  var $2 = $.trim($("#pwd").val());
		     if($1 == ''){  
		         layer.msg('用户名不能为空',function() {time:2000}); 
		         return false;  
		     }
		     if($2 == ''){  
		         layer.msg('密码不能为空',function() {time:2000}); 
		         return false;  
		     }
	})
	 
   

});
</script>
</body>
</html>