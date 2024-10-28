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

 <div class="layui-col-md12">
       <div class="layui-card">
          <div class="layui-card-header">比赛项目列表</div>
          <div class="layui-card-body">
    
           <form action="<%=path %>/findBySportMap" method="post">
         
            <input type="text" placeholder="根据比赛名称查询" name="name" style="height:26px;" />
         
           <input type="submit" class="layui-btn layui-btn-primary layui-btn-sm" value="查询" />
           
           </form> 
     
          
            <table class="layui-table">
              <colgroup>
                <col width="200">
                <col width="200">
                 <col width="200">
               
              </colgroup>
              <thead>
               <tr>
			       <th>比赛项目编号</th>
			       <th>比赛名称</th>
			       <th> 比赛详情</th>
			       <th>比赛地点</th>
			       <th>裁判员</th>
			       <th>比赛项目封面</th>
			       <th>年份</th>
			       <th>开始时间</th>
			       <th>结束时间</th>
			       <th>比赛日期</th>
			       <th>参赛人数</th>
    			</tr> 
              </thead>
              <tbody>
                <c:forEach items="${pageInfo.list}" var="p" >
				    <tr>
				       <td class="pid" style="display:none">${p.id }</td>
				       <td>${p.sno }</td>
				      <td>${p.name }</td>
				        <td>${p.detail }</td>
				        <td>${p.spot }</td>
				        <td>${p.referee.name }</td>
				        <td><img src="upload/${p.photo}"/></td>
				        <td>${p.year }</td>
					     <td>${p.startTime }</td>
					     <td>${p.endTime }</td>
				       <td>${p.createDate }</td>
				       <td>${p.amount }</td>
				    		
				    </tr>
   				</c:forEach>
              </tbody>
            </table>
 
  <div class="footpage">
            	 
 	 <ul style="display:flex; flex-direction:row;">

  
       <li><a class="layui-btn layui-btn-normal layui-btn-xs" href="${pageContext.request.contextPath}/adminToSportPage?currentPage=1">首页</a></li>
					<li><c:if test="${pageInfo.hasPreviousPage }">
						<a class="layui-btn layui-btn-danger layui-btn-xs" href="${pageContext.request.contextPath}/adminToSportPage?currentPage=${pageInfo.pageNum-1}"> 
							<span>上一页</span>
						</a>
					</c:if></li>    
        <li>       
        <c:if test="${pageInfo.hasNextPage }">
	  <a class="layui-btn layui-btn-danger layui-btn-xs " href="${pageContext.request.contextPath}/adminToSportPage?currentPage=${pageInfo.pageNum+1}"> 下一页</a>
		</c:if></li>
        <li><a  class="layui-btn layui-btn-normal layui-btn-xs" href="adminToSportPage?currentPage=${pageInfo.pages}">末页</a></li>
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
	    	
			 var uid=$(this).parents("tr").find(".pid").text();
			
		  layer.confirm('确认删除本条记录吗?', { btn: ['是','否'],btn1: function(){
	          $.ajax({
	                   url:"deleteProductAct",
	                    type: "POST",
	                    data:{'id':uid},
	                    success:function (data) {
	                 	layer.msg('删除成功',{
	                        offset:['50%'],
	                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
	                  },function(){
	                	  window.location.href="${pageContext.request.contextPath}/adminToSportPage";//相当于刷新界面   
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