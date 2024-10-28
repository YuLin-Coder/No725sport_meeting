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
<meta charset="utf-8">
<title>校园运动会管理系统</title>
<meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<link rel="stylesheet" type="text/css" href="<%=path %>/static/layui/css/layui.css"> 
<link rel="stylesheet" href="<%=path %>/static/layui/css/modules/layer/default/layer.css"/>
<link rel="stylesheet" href="<%=path %>/static/css/global.css"/>

<script src="<%=path %>/static/js/jquery/jquery-2.1.4.min.js" type="text/javascript"></script>
<script src="<%=path %>/static/layui/layui.js" type="text/javascript"></script>
<script src="<%=path %>/static/js/index/index.js" type="text/javascript"></script>
<script src="<%=path %>/static/js/index/freezeheader.js" type="text/javascript"></script>
<script src="<%=path %>/static/layui/lay/modules/layer.js" type="text/javascript"></script>
<script src="<%=path %>/static/js/index/sliders.js" type="text/javascript"></script>
<script src="<%=path %>/static/js/index/html5.js" type="text/javascript"></script>
<script src="<%=path %>/static/js/index/article_details.js" type="text/javascript"></script>
</head>
<body>
<div class="layui-header header">
    	<div class="main">
    <ul class="layui-nav layui-nav-left" lay-filter="filter">
   
      <li class="layui-nav-item layui-this nav-left">
        <a href="webIndex">首页</a>
      </li>
      <li class="layui-nav-item">
        <a href="webNews">新闻列表</a>
      </li>
      <li class="layui-nav-item">
        <a href="webSport">比赛项目列表</a>
      </li>
    <!--   <li class="layui-nav-item">
        <a href="time_line.html">相册</a>
      </li> -->
    </ul>
    <ul class="layui-nav layui-layout-right layui-nav-right" lay-filter="filter">

      <li class="layui-nav-item">
        <a href="toWebSetInfo">我的主页<span class="layui-badge-dot"></span></a>
      </li>
      <c:if test="${user eq null }">
      		 <li class="layui-nav-item">
		        <a href="toWebLogin"><img src="<%=path %>/static/images/head.jpg" class="layui-nav-img">登录</a>
		       
		      </li>
		        <li class="layui-nav-item">	        
		           <a href="toWebRegister">注册</a>
		      </li>
      </c:if>
        <c:if test="${user ne null }">
      <li class="layui-nav-item">
        <a href="javascript:;"><img src="upload/${user.tx }" class="layui-nav-img">${user.nickname}</a>
        <dl class="layui-nav-child">
          	<dd><a href="toWebSetInfo">修改信息</a></dd>
            <dd><a href="webLoginOut">退了</a></dd>
        </dl>
      </li>
        </c:if>
    </ul>
  </div>
    </div>

    <div class="layui-container container" style="padding-top:70px;">
   
    	<div class="main fly-user-main layui-clear">
  <ul class="layui-nav layui-nav-tree layui-inline" lay-filter="user">
    <li class="layui-nav-item">
      <a href="toWebSetInfo">
        <i class="layui-icon">&#xe609;</i>
        我的主页
      </a>
    </li>
   <!--  
    <li class="layui-nav-item ">
      <a href="toWebSetInfo">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li> -->
    <li class="layui-nav-item layui-this">
      <a href="toMyWebComment">
        <i class="layui-icon">&#xe611;</i>
        我的评论
      </a>
    </li>
    <li class="layui-nav-item ">
      <a href="toMyWebSport">
        <i class="layui-icon">&#xe611;</i>
        	我的比赛项目
      </a>
    </li>
  </ul>

  
  <div class="fly-panel fly-panel-user">
    <div class="layui-tab layui-tab-brief" lay-filter="user" id="LAY_msg" style="margin-top: 15px;">
	   <!--  <button class="layui-btn layui-btn-danger" id="LAY_delallmsg">清空全部消息</button> -->
	   <!--  <div  id="LAY_minemsg" style="margin-top: 10px;"> -->
        <!--<div class="fly-none">您暂时没有最新消息</div>-->
        <ul class="mine-msg">
         <%--  <c:forEach items="${comments}" var="c">
          <li data-id="123">
            <blockquote class="layui-elem-quote">
            	${c.content }
            </blockquote>
            <p><span>${c.createTime }</span> <i class="pid" style="display:none">${c.id }</i><a href="javascript:;" class="layui-delete layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></p>
          </li>
          </c:forEach> --%>
        </ul>
        <table class="layui-table"> 
        <tr><th>评论内容</th><th>评论时间</th><th>操作</th></tr>
          <c:forEach items="${comments}" var="c">
          
        <tr><td class="pid" style="display:none">${c.id }</td><td>${c.content }</td><td>${c.createTime }</td><td><a href="javascript:;" class="layui-delete layui-btn layui-btn-small layui-btn-danger fly-delete">删除</a></td></tr>
        </c:forEach>
        </table>
     <!--  </div> -->
	  </div>
	</div>

  </div>
</div>
    </div>
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
    
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
	                   url:"deleteWebComment",
	                    type: "POST",
	                    data:{'id':uid},
	                    success:function (data) {
	                 	layer.msg('删除成功',{
	                        offset:['50%'],
	                        time: 1000 //2秒关闭（如果不配置，默认是3秒）
	                  },function(){
	                	  window.location.href="${pageContext.request.contextPath}/toMyWebComment";//相当于刷新界面   
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