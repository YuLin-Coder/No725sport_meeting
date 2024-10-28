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

 
  <div class="layui-fluid">
    <div class="layui-row layui-col-space15">
      <div class="layui-col-md12">
        <div class="layui-card" >
          <div class="layui-card-header">修改成绩</div>
          <div class="layui-card-body" pad15>
             <form action="<%=path%>/updateScoreAct"   method="post" >
            <input type="hidden" name="id" id="id" value="${score.id }" />
          
         <input type="hidden" name="baomingId" id="baomingId" value="${score.baomingId }" />
          <div class="layui-form" lay-filter="">
              <div class="layui-form-item">
                <label class="layui-form-label">名次</label>
                <div class="layui-input-inline">
                  <input type="number" name="mingci" id="mingci" value="${score.mingci }"  lay-verify="required" lay-verType="tips" class="layui-input">
                </div>
              </div>
                
              
              <div class="layui-form-item">
                <label class="layui-form-label">备注</label>
                <div class="layui-input-inline">
                  <textarea type="text" name="note" id="note"  value="${score.note } "  lay-verify="required" lay-verType="tips" class="layui-textarea">${score.note } </textarea>
                </div>
              </div>
              <br>
              <div class="layui-form-item">
                <div class="layui-input-block">
                
            <button class="layui-btn" type="submit" id="update">确认修改</button>
                 
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
	
		

   


</script>
</body>
</html>