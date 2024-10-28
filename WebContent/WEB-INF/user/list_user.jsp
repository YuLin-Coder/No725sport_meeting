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
          <div class="layui-card-header">用户信息</div>
          <div class="layui-card-body">
              <a href="UserPageAct"  class="layui-btn layui-btn layui-btn-primary" target="mainFrame"><i class="layui-icon">返回列表</i></a> 
         
          
            <table class="layui-table">
              <colgroup>
                <col width="150">
                <col width="200">
                 <col width="200">
                <col width="200">
                 <col width="200">
                 <col width="200">
                  <col width="200">
                  <col width="150">
                <col>
              </colgroup>
              <thead>
               <tr>			
                <th>学号</th>   		       
			      <th>姓名</th>
			      <th>昵称</th>
			      <th>密码</th>			  
			      <th>联系方式</th>	      
			      <th>性别</th>
			      <th>头像</th>
			      <th>班级</th>
			      <th>年级</th>
			      <th>专业</th>
			      
			      <th>创建日期</th>
			      <th>操作</th> 
			     
    			</tr> 
              </thead>
              <tbody>
                <c:forEach items="${list}" var="user" >
    <tr>
       <td style="display: none" class="uid">${user.id }</td>
       <td>${user.stuno }</td>
        <td>${user.realname }</td>
      <td>${user.nickname }</td>
      <td>${user.pwd}</td>
      <td>${user.phone }</td> 
      <td>${user.sex }</td>
      <td><img src="upload/${user.tx}"></td>
      <td>${user.bj }</td>
        <td>${user.grade }</td>
         <td>${user.major }</td>  
      <td>${user.registe_time}</td>   
      <%--  <td>      
        <a href="<%=path %>/toUpdateUserAct?id=${user.id}" class="layui-btn layui-btn-sm layui-btn-normal " target="mainFrame"><i class="layui-icon">修改</i></a>    		   		
    	<a href="<%=path %>/deleteUserAct?id=${user.id}" class="layui-btn layui-btn-sm layui-btn-danger " target="mainFrame"><i class="layui-icon">删除</i></a>    		   		    		
    		 </td>    --%> 		
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
	   
	
	  
	  
  });

  </script>      
</body>
</html>