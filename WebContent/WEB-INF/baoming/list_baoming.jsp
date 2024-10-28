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
</head>
<body>

 <div class="layui-col-md12">
       <div class="layui-card">
          <div class="layui-card-header">报名列表</div>
          <div class="layui-card-body">
           <form action="<%=path %>/findByBaomingMap" method="post">
         
            <input type="text" placeholder="根据报名项目查询" name="sname" style="height:26px;" />
         
           <input type="submit" class="layui-btn layui-btn-primary layui-btn-sm" value="查询" />
           <%--  <a href="<%=path %>/toAddBannerAct" class="layui-btn layui-btn-sm layui-btn-normal " target="mainFrame"><i class="layui-icon">新增</i></a>  --%>   	
           
           </form> 
       
          
            <table class="layui-table">
              <colgroup>
                <col width="200">
                <col width="200">
                 <col width="200">
               
              </colgroup>
              <thead>
               <tr>
			       <th>报名人</th>
			       <th>报名项目</th>
			       <th>报名时间</th>
			         <th>审核状态</th>
			         <th>备注</th>
			        <th>操作</th>
    			</tr> 
              </thead>
              <tbody>
                <c:forEach items="${pageInfo.list}" var="p" >
				    <tr>
				       <td class="pid" style="display:none">${p.id }</td>
				       <td>${p.cname }</td>
				        <td>${p.sname }</td>
				      	<td>${p.createTime }</td>
				      		<td>
				      		<c:if test="${p.status eq '0' }">待审核</c:if>
				      		<c:if test="${p.status eq '1' }">审核通过</c:if>
				      		<c:if test="${p.status eq '2' }">审核不通过</c:if>
				      		</td>
				      	<td>${p.note }</td>
				    	<td>      
				    	 <c:if test="${p.status eq '0' }">
             				<a href="javascript:(void)" class="layui-btn layui-btn-sm layui-btn-normal layer-shenhebm" target="mainFrame">审核</a>
    		</c:if>
    						 <a href="javascript:(void)"  class="layui-btn layui-btn-sm layui-btn-danger layui-delete" target="mainFrame"><i class="layui-icon">&#xe640;</i></a> 
    		 			</td>
				    </tr>
   				</c:forEach>
              </tbody>
            </table>
 
  <div class="footpage">
            	 
 	 <ul style="display:flex; flex-direction:row;">

  
       <li><a class="layui-btn layui-btn-normal layui-btn-xs" href="${pageContext.request.contextPath}/UserPageAct?currentPage=1">首页</a></li>
					<li><c:if test="${pageInfo.hasPreviousPage }">
						<a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/UserPageAct?currentPage=${pageInfo.pageNum-1}"> 
							<span>上一页</span>
						</a>
					</c:if></li>    
        <li>       
        <c:if test="${pageInfo.hasNextPage }">
	  <a class="layui-btn layui-btn-danger layui-btn-xs " href="${pageContext.request.contextPath}/UserPageAct?currentPage=${pageInfo.pageNum+1}"> 下一页</a>
		</c:if></li>
        <li><a  class="layui-btn layui-btn-normal layui-btn-xs" href="UserPageAct?currentPage=${pageInfo.pages}">末页</a></li>
      <li style="margin-left:10px;margin-top:6px;">共<i class="blue">${pageInfo.total }</i>条记录，当前显示第<i class="blue">${pageInfo.pageNum }</i>页,&nbsp;
 
 总<i class="
 blue">${pageInfo.pages }</i>页
 </li>
      </ul>
  </div> 
          
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
	    	
			 var pid=$(this).parents("tr").find(".pid").text();
			
		  layer.confirm('确认删除本条记录吗?', { btn: ['是','否'],btn1: function(){
	          $.ajax({
	                   url:"deleteBaomingAct",
	                    type: "POST",
	                    data:{'id':pid},
	                    success:function (data) {
	                 	layer.msg('删除成功',{
	                        offset:['50%'],
	                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
	                  },function(){
	                	  window.location.href="${pageContext.request.contextPath}/baomingPage";//相当于刷新界面   
	                  }); 

	                    }
	                  });
	          },
	          btn2: function(index){
	                  layer.close(index);
	          }
	      })
		
	 	 });  
	    
	    
	    $(".layer-shenhebm").on('click',function(){
	    	
			 var pid=$(this).parents("tr").find(".pid").text();
			
		  layer.confirm('确认审核通过吗?', { btn: ['是','否'],btn1: function(){
	          $.ajax({
	                   url:"shenheBaoming",
	                    type: "POST",
	                    data:{'id':pid},
	                    success:function (data) {
	                 	layer.msg('操作成功',{
	                        offset:['50%'],
	                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
	                  },function(){
	                	  window.location.href="${pageContext.request.contextPath}/baomingPage";//相当于刷新界面   
	                  }); 
	                    }
	                  });
	          },
	          btn2: function(index){
	        	  $.ajax({
	                   url:"shenheBaoming1",
	                    type: "POST",
	                    data:{'id':pid},
	                    success:function (data) {
		                 	layer.msg('操作成功',{
		                        offset:['50%'],
		                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
		                  },function(){
		                	  window.location.href="${pageContext.request.contextPath}/baomingPage";//相当于刷新界面   
		                  }); 
	                    }
	                  });
	          },
	      })
		
	 	 });  
	  
  });

  </script>      
</body>
</html>