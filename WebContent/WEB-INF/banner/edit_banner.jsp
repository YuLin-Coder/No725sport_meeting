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
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card" >
          <div class="layui-card-header">修改banner</div>
          <div class="layui-card-body" pad15>
             <form action="<%=path%>/updateBannerAct"   method="post" >
            <input type="hidden" name="id" id="id" value="${banner.id }" />
          
         
          <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-inline">
                  <input type="text" name="title" id="title" value="${banner.title }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
                
              
              <%--   <div class="layui-form-item">
                <label class="layui-form-label">轮播图</label>
                <div class="layui-input-inline">
                    <br><div id="imgDiv" style="display:block; width: 40px; height: 50px;">
                    <img src="upload/${banner.photo}" width="100px" height="100px" >
                    </div>
                    <br><br><br><br>
                   <div class="layui-input-inline">
                        <input type="file" id="photo" name="photo" onchange="fileChange()"  style="margin-left:100px;">          
                </div>
              </div> --%>
              
                <div class="layui-form-item">
				    <label class="layui-form-label">轮播图</label>
				    <div class="layui-input-inline uploadHeadImage">
				        <div class="layui-upload-drag" id="headImg">
				          <img class="layui-upload-img headImage" src="upload/${banner.photo}" id="demo1" style="width:100px;height:100%">
				            <p id="demoText"></p>
				            <p>点击上传图片</p>
				        </div>
				    </div>
				   <!--  <div class="layui-input-inline">
				        <div class="layui-upload-list">
				            <img class="layui-upload-img headImage" src="" id="demo1">
				            <p id="demoText"></p>
				        </div>
				    </div> -->
				    <input type="hidden" name="photo" id="photo"  />
				</div>
                  
                  <div class="layui-form-item">
                <label class="layui-form-label">跳转网址</label>
                <div class="layui-input-inline">
                  <input type="text" name="url" id="url" value="${banner.title }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                  <textarea type="text" name="note" id="note"  value="${banner.note } "  lay-verify="required" lay-verType="tips" class="layui-textarea">${banner.note } </textarea>
                </div>
              </div>
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="update">确认修改</button>
                                      <button class="layui-btn layui-btn-primary" type="button"  onclick="location.href='bannerPage'">返回</button>  
                </div>
              </div>
              </div>
              </form>
            </div>
            
            
          </div>
        </div>
      </div>
    </div>
		

<script src="<%=path %>/layui/layui.js"></script>
<script>
	
		
	layui.use([ 'form',"upload",  'jquery','layer',"element" ], function() {
		var form = layui.form,
		 layer = layui.layer,
		 $= layui.jquery;
		 upload = layui.upload,
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
		 $('#update').click(function(){  
			  
			
			
				
		  	  
		})  
	    
		   

	  });
	  

   


</script>
</body>
</html>