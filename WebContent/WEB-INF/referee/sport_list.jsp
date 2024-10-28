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
          <div class="layui-card-header">项目列表</div>
          <div class="layui-card-body">
     <a href="refereeToSportPage"  class="layui-btn layui-btn layui-btn-primary" target="mainFrame"><i class="layui-icon">返回列表</i></a> 
       
          
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
                <c:forEach items="${list}" var="p" >
    				 <tr>
				       <td class="pid" style="display:none">${p.id }</td>
				       <td>${p.sno }</td>
				      <td>${p.name }</td>
				        <td>${p.detail }</td>
				        <td>${p.spot }</td>
				        <td>${p.refereeId }</td>
				        <td><img src="upload/${p.photo}"/></td>
				        <td>${p.year }</td>
					     <td>${p.detail }</td>
					     <td>${p.startTime }</td>
					     <td>${p.endTime }</td>
				       <td>${p.createDate }</td>
				       <td>${p.amount }</td>
				    		
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