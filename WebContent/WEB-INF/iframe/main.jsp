<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();//获得当前的项目根目录路径赋值给path
pageContext.setAttribute("path", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>科研成功检索系统</title>
<link rel="stylesheet" href="<%=path %>/static/css/bootstrap.css">
<link href="<%=path %>/static/css/css_slider.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="<%=path %>/static/css/style.css" type="text/css" media="all" />
<link href="<%=path %>/static/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<div class="main-top" id="home">
<!-- 网站的导航栏 -->
<jsp:include page="header.jsp"></jsp:include>

<div style="height:400px;">这是主体</div>
<!-- 网站的底部栏目 -->
<jsp:include page="footer.jsp"></jsp:include>
</div>
</body>
</html>