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
             <form action="<%=path%>/updateSportAct"   method="post" >
            <input type="hidden" name="id" id="id" value="${sport.id }" />
          
         
          <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
	              <label class="layui-form-label">比赛项目编号</label>
	              <div class="layui-input-inline">
	                <input type="text" name="sno" id="sno" value="${sport.sno }"  lay-verify="required" lay-verType="tips" class="layui-input">
	              </div>
	            </div>
              
              <div class="layui-form-item">
	              <label class="layui-form-label">比赛名称</label>
	              <div class="layui-input-inline">
	                <input type="text" name="name" id="name"  value="${sport.name }"  lay-verify="required" lay-verType="tips" class="layui-input">
	              </div>
	            </div>
	            
	            <div class="layui-form-item">
	              <label class="layui-form-label">比赛详情</label>
	              <div class="layui-input-inline">
	                <input type="text" name="detail" id="detail" value="${sport.detail }" lay-verify="required" lay-verType="tips" class="layui-input">
	              </div>
	            </div>
	            
	             <div class="layui-form-item">
	              <label class="layui-form-label"> 比赛地点</label>
	              <div class="layui-input-inline">
	                <input type="text" name="spot" id="spot" value="${sport.spot }"  lay-verify="required" lay-verType="tips" class="layui-input">
	              </div>
	            </div>
	            
	            <div class="layui-form-item">
		             <label class="layui-form-label">教练员：</label>
	                <div class="layui-input-inline">
	                  
	                 <select name="refereeId" class="form-control">
	                           <c:forEach items="${referees}" var="c">
	                          	 	<c:if test="${sport.refereeId eq c.id }">
	                          	 		<option value="${c.id }" >${c.name}</option>    
	                          	 	</c:if>
	                               <option value="${c.id }" >${c.name}</option>    
	                           </c:forEach>  
	                  </select>         
	                </div>
	            </div>
	            
                <div class="layui-form-item">
				    <label class="layui-form-label">比赛项目封面图片</label>
				    <div class="layui-input-inline uploadHeadImage">
				        <div class="layui-upload-drag" id="headImg">
				          <img class="layui-upload-img headImage" src=" upload/${sport.photo } " id="demo1" style="width:100px;height:100%">
				            <p id="demoText"></p>
				            <p>点击上传图片</p>
				        </div>
				    </div>
				    <input type="hidden" name="photo" id="photo" value="${sport.photo }" />
				</div>
                  
                <div class="layui-form-item">
	                <label class="layui-form-label">年份</label>
	                <div class="layui-input-inline">
	                  <input type="text" name="year" id="year" value="${sport.year }"  placeholder="yyyy"   lay-verify="required" lay-verType="tips" class="layui-input">
	                </div>
              </div>
              <div class="layui-form-item">
                <label class="layui-form-label">开始时间</label>
                <div class="layui-input-inline">
                  <input type="text" name="startTime" id="startTime"  value="${sport.startTime }" placeholder="yyyy-MM-dd HH:mm:ss"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">结束时间</label>
                <div class="layui-input-inline">
               <input type="text" name="endTime" id="endTime"  value="${sport.endTime}" placeholder="yyyy-MM-dd HH:mm:ss" lay-verify="required" lay-verType="tips" class="layui-input">
               <%--  
                  <textarea type="datetime" name="endTime" id="endTime"  value="${sport.endTime }"  lay-verify="required" lay-verType="tips" class="layui-textarea"></textarea> --%>
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">比赛日期</label>
                <div class="layui-input-inline">
                  <input type="text" name="createDate" id="createDate" placeholder="yyyy-MM-dd"  value="${sport.createDate}"  lay-verify="required" lay-verType="tips" class="layui-input">
        <%--           <textarea type="datetime" name="createDate" id="createDate"  value="${sport.createDate }" lay-verify="required" lay-verType="tips" class="layui-textarea"></textarea> --%>
                </div>
              </div>
              
               <div class="layui-form-item">
                <label class="layui-form-label">参赛人数</label>
                <div class="layui-input-inline">
                  <input type="num" name="amount" id="amount"  value="${sport.amount }" lay-verify="required" lay-verType="tips" class="layui-textarea">
                </div>
              </div>
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="update">确认修改</button>
                 <button class="layui-btn layui-btn-primary" type="button"  onclick="location.href='adminToSportPage'">返回</button>  
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
	
		
	layui.use([ 'form',"upload",  'jquery','layer',"element" ,"laydate"], function() {
		var form = layui.form,
		 layer = layui.layer,
		 $= layui.jquery;
		 upload = layui.upload,
		 laydate = layui.laydate,
		 form.render();//这句一定要加，占坑

		   laydate.render({

	            elem: '#year' //指定元素
	            	,type: 'year'
	          });
	      
	     laydate.render({

	            elem: '#createDate' //指定元素
	          });
	     laydate.render({

	            elem: '#startTime' //指定元素
	            	 ,type: 'datetime'
	          });
	     laydate.render({
	        
	            elem: '#endTime' //指定元素
	            	 ,type: 'datetime'
	          });
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