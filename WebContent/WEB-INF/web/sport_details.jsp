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

      <li class="layui-nav-item nav-left">
        <a href="webIndex">首页</a>
      </li>
      <li class="layui-nav-item">
        <a href="webNews">新闻列表</a>
      </li>
      <li class="layui-nav-item  layui-this">
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
<div class="layui-container container">
  <div class="layui-row layui-col-space20">
    <div class="layui-col-md8">
      <div>
          <span class="layui-breadcrumb">
              <a href="webIndex">首页</a>
              <a href="webNews">比赛项目</a>
              <a><cite>${sport.name }</cite></a>
              <input type="hidden" id="id" value="${sport.id }">
    	</span>
        <hr class="layui-bg-red">
        <div class="content" id="photos">
        	<h2 class="c_titile">【${sport.name }】</h2>
            <p class="box_c"><span class="d_time">比赛时间：${sport.createDate }</span><span>比赛编号：${sport.sno }</span></p>
        <div class="detail-body">
            <p class="box_c"><span class="d_time">比赛地点：${sport.spot }</span><span>参赛总人数：${sport.amount }</span></p>
          <p>
          	<img src="upload/${sport.photo }"  style="width:100px;"><br/>
          	 ${sport.detail }
          </p>
        </div>
        
        <fieldset class="layui-elem-field layui-field-title" style="margin: 0px 0px; text-align: center;">
          <legend>
          	<div class="layui-form-item">
          		<c:if test="${flag eq 'f' }">
                	<button class="layui-btn" lay-filter="*" lay-submit onclick="cc()">点击报名</button>
                </c:if>
                <c:if test="${flag eq 't' }">
                	<button class="layui-btn" lay-filter="*" lay-submit >已报名</button>
                </c:if>
              </div>
          </legend>
        </fieldset>
      </div>
      </div>
    </div>
  </div>
</div>
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
     <script>
    //图片放大 预览显示
    layer.photos({
      photos: '#photos'
      ,anim: 0 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
    }); 
    </script>
    <script src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
	    function cc(){
	    	var id = $("#id").val();
	    	
	    	$.ajax({
				  type: 'POST',
				  url: '${pageContext.request.contextPath}/addWebBaoming',
				  data: {sportId:id},
				  success:function(result){
					  console.log(result)
					  if(result == 'ok'){
		    			  alert("报名成功！");
		    			  window.location.href='${pageContext.request.contextPath}/webSportsDetail?id='+id;
					  }else if(result == 'many'){
						  alert("报名人数已满！");
					  }else{
						  alert("请先登录！");
					  }
				 },
				  error:function(req){
				         //请求出错处理
						console.log(req);
					      }
				});
	    }
    </script>
</body>
</html>
