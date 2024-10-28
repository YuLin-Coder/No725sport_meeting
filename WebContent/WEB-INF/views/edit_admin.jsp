
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
<title>美妆商品管理</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css">  
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card">
          <div class="layui-card-header">查看我的信息</div>
          <div class="layui-card-body" pad15>
             <form action="<%=path %>/updateAdminAct" method="post" >
         <input type="hidden" name="id" id="id" value="${admin.id }" />
            
             <div class="layui-form" lay-filter="">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" value="${admin.username}" name="username" id="username" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
          <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">昵&emsp;称</label>
                <div class="layui-input-inline">
                  <input type="text" name="nickname"  value="${admin.nickname}" id="nickname" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
          
              <div class="layui-form-item">
                <label class="layui-form-label">密&emsp;码</label>
                <div class="layui-input-inline">
                  <input type="password" name="pwd"  value="${admin.pwd}" id="pwd"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
             
             
             
    
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
               <!--   <button class="layui-btn" lay-filter="update" lay-submit="">确认修改</button>          -->
     <button class="layui-btn" type="submit" id="update">确认修改</button>
           
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
	 
	   
		  $('#update').click(function(){  
			  var $1 = $.trim($('#username').val());
			  var $2 = $.trim($("#nickname").val());
			  var $3 = $.trim($("#pwd").val());
			 
			  if($1==""){
					layer.msg('用户名不允许为空',function() {time:2000}); 
					$("#username").css("border","1px solid red");
					return false;  
					
		  		}else{
		  			$("#username").css("border","");
					return true;
		  		}
			  
			  if($2==""){
					layer.msg('昵称不允许为空',function() {time:2000}); 
					$("#nickname").css("border","1px solid red");
					return false;  
					
		  		}else{
		  			$("#nickname").css("border","");
					return true;
		  		}
			  
			  if($3==""){
					layer.msg('密码不允许为空',function() {time:2000}); 
					$("#pwd").css("border","1px solid red");
					return false;  
					
		  		}else{
		  			$("#pwd").css("border","");
					return true;
		  		}
			
				
		  	 
		}) 
		   
		   

	  });
	  

	 
   


</script>
</body>
</html>