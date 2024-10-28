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
    
 <!--    <li class="layui-nav-item layui-this">
      <a href="toWebSetInfo">
        <i class="layui-icon">&#xe620;</i>
        基本设置
      </a>
    </li> -->
    <li class="layui-nav-item">
      <a href="toMyWebComment">
        <i class="layui-icon">&#xe611;</i>
        我的评论
      </a>
    </li>
     <li class="layui-nav-item ">
      <a href="toMyWebSport">
        <i class="layui-icon">&#xe612;</i>
        	我的比赛项目
      </a>
    </li>
  </ul>

  
  <div class="fly-panel fly-panel-user">
    <div class="layui-tab layui-tab-brief" lay-filter="user">
      <ul class="layui-tab-title" id="LAY_mine">
        <li class="layui-this" lay-id="info">我的资料</li>
        <li lay-id="avatar">头像</li>
        <li lay-id="pass">密码</li>
      </ul>
      <div class="layui-tab-content" style="padding: 20px 0;">
        <div class="layui-form layui-form-pane layui-tab-item layui-show">
          <form class="layui-form" method="post" action="<%=path%>/updateWebUserInfo">
           <input type="hidden" id="id" name="id" value="${user.id}">
            <div class="layui-form-item">
              <label for="L_email" class="layui-form-label">电话</label>
              <div class="layui-input-inline">
                <input type="text" name="phone" lay-verify="phone"  value="${user.phone }"autocomplete="off" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">昵称</label>
              <div class="layui-input-inline">
                <input type="text" name="nickname" lay-verify="required" autocomplete="off" value="${user.nickname }" class="layui-input">
              </div>
              </div>
               <div class="layui-form-item">
              <label for="L_username" class="layui-form-label">真实姓名</label>
              <div class="layui-input-inline">
                <input type="text" name="realname" lay-verify="required" autocomplete="off" value="${user.realname }" class="layui-input">
              </div>
              </div>
              <div class="layui-form-item">
              <div class="layui-inline">
                <div class="layui-input-inline">
                  <input type="radio" name="sex" value="0" checked title="男" <c:if test="${user.sex eq '0'}">checked</c:if>>
                  <input type="radio" name="sex" value="1" title="女" <c:if test="${user.sex eq '1'}">checked</c:if>>
                </div>
              </div>
            </div>
            <div class="layui-form-item">
              <label for="L_city" class="layui-form-label">班级</label>
              <div class="layui-input-inline">
                <input type="text" id="bj" name="bj" lay-verify="required" autocomplete="off" value="${user.bj }" class="layui-input">
              </div>
            </div>
             <div class="layui-form-item">
              <label for="L_city" class="layui-form-label">年级</label>
              <div class="layui-input-inline">
                <select name="grade" class="form-control">
                <c:if test="${user.grade eq '一年级' }">一年级</c:if>
                <c:if test="${user.grade eq '二年级' }">二年级</c:if>
                <c:if test="${user.grade eq '三年级' }">三年级</c:if>
                <c:if test="${user.grade eq '四年级' }">四年级</c:if>
                	<option>一年级</option>
                	<option>二年级</option>
                	<option>三年级</option>
                	<option>四年级</option>
                </select>
              </div>
            </div>
             <div class="layui-form-item">
              <label for="L_city" class="layui-form-label">专业</label>
              <div class="layui-input-inline">
                <input type="text" id="major" name="major" lay-verify="required" autocomplete="off" value="${user.major }" class="layui-input">
              </div>
            </div>
            <div class="layui-form-item">
              <button class="layui-btn" lay-filter="*" lay-submit>确认修改</button>
            </div>
            </form>
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
           <form class="layui-form" method="post" action="<%=path%>/updateWebUserTX"   >
	            <div class="layui-form-item">
	               <div class="layui-input-inline uploadHeadImage">
				        <div class="layui-upload-drag" id="headImg">
				          <img class="layui-upload-img headImage" src="upload/${user.tx}" id="demo1" style="width:100px;height:100%">
				            <p id="demoText"></p>
				            <p>点击上传图片</p>
				        </div>
				    </div>
				    <input type="hidden" id="photo" name="tx" value="${user.tx}">
				    <input type="hidden" id="id" name="id" value="${user.id}">
	            </div>
            	<div class="layui-form-item">
	                <button class="layui-btn" lay-filter="*" lay-submit>确认上传</button>
	              </div>
            </form>
            
          </div>
          
          <div class="layui-form layui-form-pane layui-tab-item">
            <form class="layui-form" method="post" action="<%=path%>/updateWebUserPwd">
             <input type="hidden" id="id" name="id" value="${user.id}">
             <!--  <div class="layui-form-item">
                <label for="L_nowpass" class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="L_nowpass" name="nowpass" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
              </div> -->
              <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                  <input type="password" id="pwd" name="pwd" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
              </div>
              <div class="layui-form-item">
                <button class="layui-btn" lay-filter="*" lay-submit>确认修改</button>
              </div>
            </form>
          </div>
          
        </div>

      </div>
    </div>
  </div>
</div>
    </div>
  <jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
    
    <script>
	
		
	layui.use([ 'form',"upload",  'jquery','layer',"element" ], function() {
		var form = layui.form,
		 layer = layui.layer,
		 $= layui.jquery;
		 upload = layui.upload,
		 form.render();//这句一定要加，占坑
		 //拖拽上传
		    var uploadInst = upload.render({
		    	
		        elem: '#headImg'
		        , url: '${pageContext.request.contextPath}/addPhotoAct'
		        ,method: 'post'
		        , size: 5000
		        
		        , before: function (obj) {
		            //预读本地文件示例，不支持ie8
		            obj.preview(function (index, file, result) {
		                $('#demo1').attr('src', result); //图片链接（base64）
		            });
		        }
		        , done: function (res) {
		            //如果上传失败
		            if (res.code > 0) {
		                return layer.msg('上传失败');
		            }
		            //上传成功
		            //打印后台传回的地址: 把地址放入一个隐藏的input中, 和表单一起提交到后台, 此处略..
		            /*   console.log(res.data.src);*/
		            /* window.parent.uploadHeadImage(res.data.src); */
		            console.log(res.data.src);
		            $("#photo").val(res.data.src);
		            var demoText = $('#demoText');
		            demoText.html('<span style="color: #8f8f8f;">上传成功!!!</span>');
		        }
		        , error: function (res) {
	                //演示失败状态，并实现重传
	                var demoText = $('#demoText');
	                demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-mini demo-reload">重试</a>');
	                demoText.find('.demo-reload').on('click', function () {
	                    uploadInst.upload();
	                });
	            }
		       
		    });
		 $('#update').click(function(){  
			  
			
			
				
		  	  
		})  
	    
		   

	  });
	  

   


</script>
    </body>
</html>