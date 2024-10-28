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
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css">  
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.3.1.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/ajaxfileupload.js"></script>
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card" >
          <div class="layui-card-header">添加用户</div>
          <div class="layui-card-body" pad15>
             <form action="<%=path%>/addUserAct"   method="post" >                      
              <div class="layui-form-item">
                <label class="layui-form-label">用户姓名：</label>
                <div class="layui-input-inline">
                  <input type="text" name="realname" id="realname" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">手机号：</label>
                <div class="layui-input-inline">
                  <input type="text" name="phone" id="phone" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
             
              
                
               <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                  <input type="text" name="pwd" id="pwd" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">昵称：</label>
                <div class="layui-input-inline">
                  <input type="text" name="nickname" id="nickname" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              
                <div class="layui-form-item">
                <label class="layui-form-label">详细地址</label>
                <div class="layui-input-inline">
                  <textarea type="text" name="address" id="address"  value=" "  lay-verify="required" lay-verType="tips" class="layui-textarea"></textarea>
                </div>
              </div>
                             
              <div class="layui-form-item">
                <label class="layui-form-label">邮&emsp;&emsp;编：</label>
                <div class="layui-input-inline">
                  <input type="text" name="postcode" id="postcode" value="" placeholder="请输入邮编"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="add">确认添加</button>
                 
                </div>
              </div>
              </div>
              </form>
            </div>
            
            
          </div>
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
	
	 $('#add').click(function(){  
		  var $1 = $.trim($('#realname').val());
		  var $2 = $.trim($("#phone").val());
		  var $3 = $.trim($("#pwd").val());		
		  var $4 = $.trim($("#nickname").val());
		  var $5 = $.trim($("#address").val());
		  var $6 = $.trim($("#postcode").val());
		  if($1==""){
			  layer.msg('真实姓名不许为空',function() {time:2000}); 
				$("#realname").css("border","1px solid red");
				return false;  				
	  		}else{
	  			$("#realname").css("border","");
				return true;
	  		}		  
		  if($2==""){
			  layer.msg('手机号不许为空',function() {time:2000}); 
				$("#phone").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#phone").css("border","");
				return true;
	  		}
		  		  
		  if($3==""){
			  layer.msg('密码不许为空',function() {time:2000}); 
				$("#pwd").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#pwd").css("border","");
				return true;
	  		}
		  
		  
		  if($4==""){
			  layer.msg('昵称不许为空',function() {time:2000}); 
				$("#nickname").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#nickname").css("border","");
				return true;
	  		}
		  
		  
		  if($5==""){
			  layer.msg('详细地址不许为空',function() {time:2000}); 
				$("#address").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#address").css("border","");
				return true;
	  		}
		  
		  if($6==""){
			  layer.msg('邮编不许为空',function() {time:2000}); 
				$("#postcode").css("border","1px solid red");
				return false;  
				
	  		}else{
	  			$("#postcode").css("border","");
				return true;
	  		}
		  
		  
		
		
		  
		
		  
		
		
			
	  	  
	})  
	    
		
		   

	  });
	  

   


</script>
</body>
</html>