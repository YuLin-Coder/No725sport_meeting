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
<title>管理系统</title>
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
          <div class="layui-card-header">修改裁判员</div>
          <div class="layui-card-body" pad15>
             <form action="<%=path%>/updateRefereeAct"   method="post" >
            <input type="hidden" name="id" id="id" value="${record.id }" />
          
        <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                  <input type="text" name="name" id="name" value="${record.name }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
                
              	  <div class="layui-form-item">
						   <label class="layui-form-label">照片：</label>
                            <br><div id="imgDiv" style="display:block; margin-left:100px;width: 40px; height: 50px;"><img src="upload/${record.photo}" width="100px" height="100px" ></div><br><br><br><br>
                           <div class="layui-input-inline">
                        <input type="file" id="pimage" name="pimage" onchange="fileChange()"  style="margin-left:100px;">                          
                             <!--    <span id="imgName" ></span><br> -->
                               
					</div>
					</div>
           <%--   <div class="layui-form-item">
                <label class="layui-form-label">照片</label>
                <div class="layui-input-inline">
                    <br><div id="imgDiv" style="display:block; width: 40px; height: 50px;">
                    <img src="upload/${record.photo}" width="100px" height="100px" >
                    </div>
                    <br><br><br><br>
                   <div class="layui-input-inline">
                        <input type="file" id="photo" name="photo" onchange="fileChange()"  style="margin-left:100px;">          
                </div>
              </div>  --%>
              
              		 <div class="layui-form-item">
                <label class="layui-form-label">手机号</label>
                <div class="layui-input-inline">
                  <input type="text" name="phone" id="phone" value="${record.phone }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
			 <div class="layui-form-item">
                <label class="layui-form-label">密码</label>
                <div class="layui-input-inline">
                  <input type="text" name="pwd" id="pwd" value="${record.pwd }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                  <textarea type="text" name="note" id="note"  value=" "  lay-verify="required" lay-verType="tips" class="layui-textarea">${record.note }</textarea>
                </div>
              </div>
              
          
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="update">确认修改</button>
                         <button class="layui-btn layui-btn-primary" type="button"  onclick="location.href='RefereePageAct'">返回</button>    
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

function fileChange(){//注意：此处不能使用jQuery中的change事件，因此仅触发一次，因此使用标签的：onchange属性

	$.ajaxFileUpload({
		url: '${pageContext.request.contextPath}/addRefereeImg.action',//用于文件上传的服务器端请求地址
		secureuri: false,//一般设置为false
		fileElementId: 'pimage',//文件上传控件的id属性  <input type="file" id="pimage" name="pimage" />
		dataType: 'json',//返回值类型 一般设置为json
		success: function(obj) //服务器成功响应处理函数
		{

			$("#imgDiv").empty();  //清空原有数据
			//创建img 标签对象
			var imgObj = $("<img>");
			//给img标签对象追加属性
			imgObj.attr("src","upload/"+obj.imgurl);
			imgObj.attr("width","100px");
			imgObj.attr("height","100px");
			//将图片img标签追加到imgDiv末尾
			$("#imgDiv").append(imgObj);
			//将图片的名称（从服务端返回的JSON中取得）赋值给文件本框
			//$("#imgName").html(data.imgName);
		},
		error: function (e)//服务器响应失败处理函数
		{
			alert(e.message);
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