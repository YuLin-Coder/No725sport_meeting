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

 
    <form action="<%=path %>/webRegister" method="post" onSubmit="return tijiao(this)" id="loginForm" name="loginForm">
    <div class="layadmin-user-login layadmin-user-display-show" id="LAY-user-login" style="display: none;">
    <div class="layadmin-user-login-main">
      <div class="layadmin-user-login-box layadmin-user-login-header">
        <h2>学生注册</h2>
       <span id="error2" style="color:red">${msg}</span>
      </div>
      <div class="layadmin-user-login-box layadmin-user-login-body layui-form">
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
          <input type="text" name=stuno lay-verify="stuno" id="stuno"  placeholder="学号" class="layui-input">
        </div>
       
       <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
          <input type="text" name=realname lay-verify="realname" id="realname"  placeholder="姓名" class="layui-input">
        </div>
        
            <div class="layui-form" lay-filter="">
                            <div class="layui-form-item">
                <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
                <div class="layui-input-inline">
				 <select  class="form-control"  name="sex" >
			 	
			 		  <option value="男" selected>男</option>
			          <option value="女" >女</option>
			        
                         </select>
                </div>
              </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
          <input type="text" name="nickname" lay-verify=""nickname"" id="nickname"  placeholder="昵称" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-username" for="LAY-user-login-cellphone"></label>
          <input type="text" name="phone" lay-verify="phone" id="phone"  placeholder="手机号" class="layui-input">
        </div>
        <div class="layui-form-item">
          <label class="layadmin-user-login-icon layui-icon layui-icon-password" for="LAY-user-login-password"></label>
          <input type="password" name="pwd" lay-verify="pwd" id="pwd" placeholder="密码" class="layui-input">
        </div>
     	<div class="layui-form-item" style="align:center;">
           
        </div>
        <div class="layui-form-item">
         <button class="layui-btn layui-btn-fluid" lay-submit lay-filter="LAY-user-reg-submit" id="denglu">确 定注 册</button><br/><br/>
          <a href="toWebLogin"class="layui-btn layui-btn-fluid" lay-filter="LAY-user-reg-submit">返回登 录</a><br/><br/>
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
		  var $1 = $.trim($('#stuno').val());
		  var $2 = $.trim($("#pwd").val());
		     if($1 == ''){  
		         layer.msg('学号不能为空',function() {time:2000}); 
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