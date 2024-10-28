
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
             <form action="<%=path %>/updateRefereeInfoAct" method="post" >
         <input type="hidden" name="id" id="id" value="${rf.id }" />
            
             <div class="layui-form" lay-filter="">
            <div class="layui-form-item">
                <label class="layui-form-label">用户名</label>
                <div class="layui-input-inline">
                  <input type="text" value="${rf.name}" name="name" id="name"   lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
          <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">电&emsp;话</label>
                <div class="layui-input-inline">
                  <input type="text" name="phone"  value="${rf.phone}" id="phone"   lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">照&emsp;片</label>
                <div class="layui-input-inline uploadHeadImage">
			        <div class="layui-upload-drag" id="headImg">
			          <img class="layui-upload-img headImage" src="upload/${rf.photo}" id="demo1" style="width:100px;height:100%">
			            <p id="demoText"></p>
			            <p>点击上传图片</p>
			        </div>
			    </div>
			    <input type="hidden" name="photo" id="photo"  value="${rf.photo}"/>
              <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">个人说明</label>
                <div class="layui-input-inline">
               <%--    <input type="text" name="note"  value="${rf.note}" id="note"   lay-verify="" lay-verType="tips" class="layui-input"> --%>
                  <textarea rows="" cols=""  name="note"   id="note" >${rf.note}</textarea>
                </div>
              </div>
          
              <div class="layui-form-item">
                <label class="layui-form-label">密&emsp;码</label>
                <div class="layui-input-inline">
                  <input type="password" name="pwd"  value="${rf.pwd}" id="pwd"  value=" "  lay-verify="required" lay-verType="tips" class="layui-input">
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

layui.use(['form',"upload",  'jquery','layer',"element"], function() {
	var form = layui.form,
	 layer = layui.layer,
	 upload = layui.upload,
	 $= layui.jquery;
	 form.render();//这句一定要加，占坑
	 
	//拖拽上传
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
	            $("#photo").val(res.data.src);
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
		  /* $('#update').click(function(){  
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
			
				
		  	 
		})  */
		   
		   

	  });
	  

	 
   


</script>
</body>
</html>