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
          <div class="layui-card-header">修改用户</div>
          
        
          <div class="layui-card-body" pad15>
             <form action="<%=path%>/updateUserAct"   method="post" >     
                <input type="hidden" name="id" id="id" value="${user.id }" />   
                <div class="layui-form-item">
                <label class="layui-form-label">学号：</label>
                <div class="layui-input-inline">
                  <input type="text" name="stuno" id="stuno" value="${user.stuno }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>              
              <div class="layui-form-item">
                <label class="layui-form-label">用户姓名：</label>
                <div class="layui-input-inline">
                  <input type="text" name="realname" id="realname" value="${user.realname }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
                       <div class="layui-form-item">
				    <label class="layui-form-label">照片</label>
				    <div class="layui-input-inline uploadHeadImage">
				        <div class="layui-upload-drag" id="headImg">
				          <img class="layui-upload-img headImage" src="upload/${user.tx}" id="demo1" style="width:100px;height:100%">
				            <p id="demoText"></p>
				            <p>点击上传照片</p>
				        </div>
				    </div>
				   <!--  <div class="layui-input-inline">
				        <div class="layui-upload-list">
				            <img class="layui-upload-img headImage" src="" id="demo1">
				            <p id="demoText"></p>
				        </div>
				    </div> -->
				    <input type="hidden" name="tx" id="tx"  />
				</div>
                  
              
               <div class="layui-form-item">
                <label class="layui-form-label">手机号：</label>
                <div class="layui-input-inline">
                  <input type="text" name="phone" id="phone" value="${user.phone }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
                
               <div class="layui-form-item">
                <label class="layui-form-label">密码：</label>
                <div class="layui-input-inline">
                  <input type="text" name="pwd" id="pwd" value="${user.pwd }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">昵称：</label>
                <div class="layui-input-inline">
                  <input type="text" name="nickname" id="nickname" value="${user.nickname }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
              
                <div class="layui-form-item">
                <label class="layui-form-label">班级：</label>
                <div class="layui-input-inline">
                  <input type="text" name="bj" id="bj" value="${user.bj }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
                <div class="layui-form" lay-filter="">
                            <div class="layui-form-item">
                <label class="layui-form-label">性别:</label>
                <div class="layui-input-inline">
				 <select  class="form-control"  name="sex" >
			 	
			 		  <option value="男" <c:if test="${user.sex=='男' }">selected</c:if>>男</option>
			          <option value="女" <c:if test="${user.sex=='女' }">selected</c:if>>女</option>
			        
                         </select>
                </div>
              </div>
              
                             
               <div class="layui-form-item">
                <label class="layui-form-label">年级：</label>
                <div class="layui-input-inline">
	                <select name="grade" class="form-control">
	                <c:if test="${user.grade eq '大一' }">大一</c:if>
	                <c:if test="${user.grade eq '大二' }">大二</c:if>
	                <c:if test="${user.grade eq '大三' }">大三</c:if>
	                <c:if test="${user.grade eq '大四' }">大四</c:if>
	                	<option>大一</option>
	                	<option>大二</option>
	                	<option>大三</option>
	                	<option>大四</option>
	                </select>
                </div>
              </div>
                <div class="layui-form-item">
                <label class="layui-form-label">专业：</label>
                <div class="layui-input-inline">
                  <input type="text" name="major" id="major" value="${user.major }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="add">确认修改</button>
                 
                
            <button class="layui-btn layui-btn-primary" type="button"  onclick="location.href='UserPageAct'">返回</button>
                 
                 
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

	

layui.use([ 'form','jquery','upload','layer','element' ], function() {
	var form = layui.form,
	 layer = layui.layer,
	 element = layui.element,
	 $= layui.jquery,
	 upload = layui.upload;
	 form.render();//这句一定要加，占坑
	    var uploadInst = upload.render({
	    	
	        elem: '#headImg'
	        , url: '${pageContext.request.contextPath}/addPhotoAct'
	        ,method: 'post'
	        , size: 5000
	        
	        , before: function (obj) {
	            //预读本地文件示例，不支持ie8
	            obj.preview(function (index, file, result) {
	                $('#demo1').attr('src', result); //图片链接（base64）
	            });
	        }
	        , done: function (res) {
	            //如果上传失败
	            if (res.code > 0) {
	                return layer.msg('上传失败');
	            }
	            //上传成功
	            //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..
	            /*   console.log(res.data.src);*/
	            /* window.parent.uploadHeadImage(res.data.src); */
	            console.log(res.data.src);
	            $("#tx").val(res.data.src);
	            var demoText = $('#demoText');
	            demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');
	        }
	        , error: function (res) {
                //演示失败状态，并实现重传
                var demoText = $('#demoText');
                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
                demoText.find('.demo-reload').on('click', function () {
                    uploadInst.upload();
                });
            }
	       
	    });
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