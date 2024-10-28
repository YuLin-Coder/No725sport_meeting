<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();//获得当前的项目根目录路径赋值给path
%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        <a href="toWebSetInfo">我的主页<!-- <span class="layui-badge-dot"></span> --></a>
      </li>
      <c:if test="${user eq null }">
      		 <li class="layui-nav-item">
		        <a href="toWebLogin"><%-- <img src="<%=path %>/static/images/head.jpg" class="layui-nav-img"> --%>登录</a>
		      
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