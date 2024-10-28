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
<script type="text/javascript">

</script>
<!--
-->
</head>
<body>

 <div class="layui-header header">
    <div class="main">
    <ul class="layui-nav layui-nav-left" lay-filter="filter">
     
      <li class="layui-nav-item  nav-left">
        <a href="webIndex">首页</a>
      </li>
      <li class="layui-nav-item layui-this">
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
</div> --%>
<div class="layui-container container">

    <div class="layui-row layui-col">
        <div class="layui-col-md8">
            <div>
              <span class="layui-breadcrumb">
          <a href="webIndex">首页</a>
          <a><cite>文章</cite></a>
        </span>
                <hr class="layui-bg-red">
                <c:forEach items="${xinwens}" var="c">
	                <div class="article-list" style="padding-top:10px;">
	                    <figure><img lay-src="<%=path %>/static/images/01.jpg"></figure>
	                    <ul>
	                        <h3>
	                            <a href="webNewsDetail?id=${c.id}">${c.title }</a>
	                        </h3>
	
	                       
	
	                        <p class="autor">
	                            <span class="lm f_l"><a href="#">新闻通知</a></span>
	                            <span class="dtime f_l">${c.createTime }</span>
	                    </ul>
	                </div>
				</c:forEach>
            </div>
            <!--分页-->
        </div>
        
    </div>
</div>
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
</body>
</html>
