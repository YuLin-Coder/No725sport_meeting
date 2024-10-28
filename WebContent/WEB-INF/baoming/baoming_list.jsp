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
     <a href="baomingPage"  class="layui-btn layui-btn layui-btn-primary" target="mainFrame"><i class="layui-icon">返回列表</i></a> 
       
          
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
			       <th>审核状态</th>
			       <th>报名时间</th>
			         <th>备注</th>
    			</tr> 
              </thead>
              <tbody>
                <c:forEach items="${list}" var="p" >
    				 <tr>
				        <td class="pid" style="display:none">${p.id }</td>
				       <td>${p.cname }</td>
				        <td>${p.sname }</td>
				        <td>${p.status }</td>
				      	<td>${p.createTime }</td>
				      	<td>${p.note }</td>
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
	   
	
	    
	    
	 
	  
  });

  </script>      
</body>
</html>