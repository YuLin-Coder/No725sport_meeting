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
$(function(){
	var oLi = document.getElementById("tab").getElementsByTagName("li");
	var oUl = document.getElementById("ms-main").getElementsByTagName("div");
	for(var i = 0; i < oLi.length; i++)
	{
		oLi[i].index = i;
		oLi[i].onmouseover = function ()
		{
			for(var n = 0; n < oLi.length; n++) oLi[n].className="";
			this.className = "cur";
			for(var n = 0; n < oUl.length; n++) oUl[n].style.display = "none";
			oUl[this.index].style.display = "block"
		}	
	}
});
</script>
<!--
-->
</head>
<body>
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>

<div class="layui-container container">
  <div class="layui-row layui-col-space20">
    <div class="layui-col-md8">
      <div class="carousel">
        <div class="layui-carousel" id="images-carousel">
          <div carousel-item>
          
           <c:forEach items="${banners}" var="c">
	            <div>
	              <a href="${c.url }" target="_blank"><img src="upload/${c.photo }" width="100%" height="280px;" /></a>
	            </div>
	            </c:forEach>
          </div>
        </div>
      </div>
      <div class="article-main">
        <h2>
          新闻公告推荐
        </h2>
		 <c:forEach items="${xinwens}" var="c">
	        <div class="article-list">
	          <figure><img lay-src="upload/${c.photo} "></figure>
	          <ul>
	            <h3>
	              <a href="webNewsDetail?id=${c.id}">${c.title}</a>
	            </h3>
	            <p></p>
	            <p class="autor">
	              <span class="lm f_l"><a href="webNewsDetail?id=${c.id}">新闻公告</a></span>
	              <span class="dtime f_l">${c.createTime}</span>
	          </ul>
	        </div>
 		</c:forEach>
      </div>
    </div>
    <div class="layui-col-md4">
        
      <div class="tuwen">
        <h3>比赛项目推荐</h3>
        <ul>
       <c:forEach items="${sports}" var="c">
          <li>比赛项目：<a href="webSportsDetail?id=${c.id }"><img lay-src="upload/${c.photo }"><b>${c.name }</b></a>
            <p><span class="tutime">${c.createDate }</span></p> 
          </li>
         </c:forEach>
        </ul>
      </div>
     <%--  <div class="ad"> <img lay-src="<%=path %>/static/images/03.jpg"> </div> --%>
 <!--      <div class="links">
        <h3><span>[<a href="#">申请友情链接</a>]</span>友情链接</h3>
        <ul>
          <li><a href="#">web开发</a></li>
          <li><a href="#">前端设计</a></li>
          <li><a href="#">Html</a></li>
          <li><a href="#">CSS3</a></li>
          <li><a href="#">Html5+css3</a></li>
          <li><a href="#">百度</a></li>
        </ul>
      </div> -->
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
</body>
</html>
