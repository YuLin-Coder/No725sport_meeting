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
<script src="<%=path %>/js/jquery-3.3.1.js"></script>
<script src="<%=path %>/layui/layui.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/static/ueditor1/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=path %>/static/ueditor1/ueditor.all.min.js"> </script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="<%=path %>/static/ueditor/lang/zh-cn/zh-cn.js"></script>
    <style type="text/css">
        .udietor{
            width:100%;
        }
    </style>
</head>
<body>

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card" >
          <div class="layui-card-header">发布新闻公告</div>
          <div class="layui-card-body" pad15>
             <div  >
          
         
          <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">标题</label>
                <div class="layui-input-inline">
                  <input type="text" name="title" id="title" value=""  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
                
                   <div class="layui-form-item">
				    <label class="layui-form-label">封面</label>
				    <div class="layui-input-inline uploadHeadImage">
				        <div class="layui-upload-drag" id="headImg">
				          <img class="layui-upload-img headImage" src="upload/upload.png" id="demo1" style="width:200px;height:100%">
				            <p id="demoText"></p>
				            <p>点击上传图片</p>
				        </div>
				    </div>
				
				    <input type="hidden" name="photo" id="photo"  />
				</div>
              
             <div class="udietor">
			    <script id="editor" type="text/plain" style="width:1024px;height:500px;"></script>
			</div>
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="update" onclick="submit()">确认添加</button>
                         <button class="layui-btn layui-btn-primary" type="button"  onclick="location.href='newsPage'">返回</button>    
                </div>
              </div>
              </div>
              </div>
            </div>
            
            
          </div>
        </div>
      </div>
    </div>
		

<script>
//实例化编辑器
//建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
	$(function(){
		var ue = UE.getEditor('editor');
	})
	function submit(){
		var ue = UE.getEditor('editor');
		var ud = UE.getEditor('editor').getContent();
		var title = $("#title").val();
		var photo = $("#photo").val();
		$.ajax({
			  type: 'POST',
			  url: '${pageContext.request.contextPath}/addNewsAct',
			  data: {"content":ud,"title":title,"photo":photo},
			  /* dataType: "json", */
			  success:function(req){
			        //请求成功时处理
			        window.location.href='${pageContext.request.contextPath}/newsPage';
			 },
			  error:function(req){
			         //请求出错处理
					console.log(req);
				      }
			});
	}	
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