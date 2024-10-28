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
<div class="layui-container container">
  <div class="layui-row layui-col-space20">
    <div class="layui-col-md8">
      <div>
          <span class="layui-breadcrumb">
              <a href="webIndex">首页</a>
              <a href="webNews">新闻通知</a>
              <a><cite>${xinwen.title }</cite></a>
              <input type="hidden" id="id" value="${xinwen.id }">
    	</span>
        <hr class="layui-bg-red">
        <div class="content" id="photos">
        	<h2 class="c_titile">【${xinwen.title }】</h2>
            <p class="box_c"><span class="d_time">发布时间：${xinwen.createTime }</span><span>编辑：${xinwen.cname }</span></p>
        <div class="detail-body">
           
          <p>
          	${xinwen.content }
          </p>
        </div>
        
        <fieldset class="layui-elem-field layui-field-title" style="margin: 0px 0px; text-align: center;">
          <legend>评论</legend>
        </fieldset>
	<div class="detail-box">
        <a name="comment"></a>
        <ul class="jieda" id="jieda">
        
          <c:forEach items="${comments}" var="c">
          <li data-id="${c.id }">
            <a name="${c.id }"></a>
            <div class="detail-about detail-about-reply">
              <a class="jie-user" href="">
                <img src="upload/${c.tx }" alt="">
                <cite>
                  <i>${c.cname}</i>
                </cite>
              </a>
              <div class="detail-hits">
                <span> ${c.createTime}</span>
              </div>
            </div>
            <div class="detail-body jieda-body">
              <p>${c.content}</p>
            </div>
            <!-- <div class="jieda-reply">
              <div class="jieda-admin">
                <span type="del">删除</span>
              </div>
            </div> -->
          </li>
          </c:forEach>
        </ul>
      	 <div class="layui-form layui-form-pane">
            <div class="layui-form-item layui-form-text">
              <div class="layui-input-block">
                <textarea id="reply" name="reply" lay-verify="reply" class="layui-textarea fly-editor"></textarea>
              </div>
            </div>
            <div class="layui-form-item">
              <input type="button" class="layui-btn" onclick="getReply();" lay-filter="*" lay-submit value="提交回复"/>
            </div>
        </div>
      </div>
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
    <script type="text/javascript">
	    function getReply(){
	    	layui.use(['layedit','layer','form'], function(){
	    		var layedit = layui.layedit
	    			,layer = layui.layer
	    			,form = layui.form;
	    			
	    		//自定义验证规则
	    		  form.verify({
	    			reply: function(value){
	    				var reply = layedit.getContent(editIndex);  //获取编辑器的内容
	    				if(reply.length <= 0){
	    					return '文章内容不能为空';
	    				}
	    				console.log(reply);
	    				var id = $("#id").val();
	    				$.ajax({
	    					  type: 'POST',
	    					  url: '${pageContext.request.contextPath}/addWebComment',
	    					  data: {"content":reply,"newsId":id},
	    					  /* dataType: "json", */
	    					  success:function(req){
	    						  alert(req);
	    						        //请求成功时处理
	    						        if(req=='ok'){
	    						        window.location.href='${pageContext.request.contextPath}/webNewsDetail?id='+id;
	    						        }else{
	    						        	layer.alert("请先登录");
	    						        }
	    					 },
	    					  error:function(req){
	    					         //请求出错处理
	    							console.log(req);
	    						      }
	    					});
	    			}
	    		  });
	    	});
	    }
    </script>
</body>
</html>
