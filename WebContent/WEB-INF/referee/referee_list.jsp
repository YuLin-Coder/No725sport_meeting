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
<title>校园运动会系统</title>
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/layui.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="<%=path %>/layui/css/login.css"> 
</head>
<body>

 <div class="layui-col-md12">
       <div class="layui-card">
          <div class="layui-card-header">裁判员列表</div>
          <div class="layui-card-body">
             <a href="RefereePageAct"  class="layui-btn layui-btn layui-btn-primary" target="mainFrame"><i class="layui-icon">返回列表</i></a> 
    
       
          
            <table class="layui-table">
              <colgroup>
                <col width="200">
                <col width="200">
                 <col width="200">
               
              </colgroup>
              <thead>
               <tr>
			       <th>姓名</th>
			       <th>手机号</th>
			       <th>照片</th>
			         <th>登录密码</th>
			         <th>备注</th>
			        <th>操作</th>
    			</tr> 
              </thead>
              <tbody>
                <c:forEach items="${list}" var="p" >
				    <tr>
				       <td class="pid" style="display:none">${p.id }</td>
				       <td>${p.name }</td>
				        <td>${p.phone }</td>
				        <td><img src="upload/${p.photo}"/></td>
				      	<td>${p.pwd }</td>
				      	<td>${p.note }</td>
				    	<td>      
             				<a href="<%=path %>/toUpdateScoreAct?id=${p.id}" class="layui-btn layui-btn-sm layui-btn-normal " target="mainFrame"><i class="layui-icon">&#xe642;</i></a>
             				 <a href="javascript:(void)"  class="layui-btn layui-btn-sm layui-btn-danger layui-delete" target="mainFrame"><i class="layui-icon">&#xe640;</i></a> 
    		 			</td>
				    </tr>
   				</c:forEach>
              </tbody>
            </table>

  
          
          </div>
        </div>
      </div>


<script src="layui/layui.js"></script>
 <script>
 
  layui.use(['layer','form','jquery'], function () {//调用layui组件
		var form = layui.form;
   		var layer=layui.layer;
	    $=layui.jquery;  
	    form.render();
	   
	    $(".layui-delete").on('click',function(){
	    	
			 var uid=$(this).parents("tr").find(".pid").text();
			
		  layer.confirm('确认删除本条记录吗?', { btn: ['是','否'],btn1: function(){
	          $.ajax({
	                   url:"deleteRefereeAct",
	                    type: "POST",
	                    data:{'id':uid},
	                    success:function (data) {
	                 	layer.msg('删除成功',{
	                        offset:['50%'],
	                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
	                  },function(){
	                	  window.location.href="${pageContext.request.contextPath}/RefereePageAct";//相当于刷新界面   
	                  }); 

	                    }
	                  });
	          },
	          btn2: function(index){
	                  layer.close(index);
	          }
	      })
		
	 	 }); 
	    
	    
	    
	 
	  
  });

  </script>      
</body>
</html>