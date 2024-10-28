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
<header>
			<div class="container-fluid">
				<div class="header d-md-flex justify-content-between align-items-center py-sm-4 py-3 px-xl-5 px-lg-3 px-2">
					<!-- logo -->
					<div id="logo">
						<h1><a class="" href="index.html">科研成功检索网站</a></h1>
					</div>
					<!-- //logo -->
					<!-- nav -->
					<div class="nav_w3ls">
						<nav>
							<label for="drop" class="toggle toogle-2">Menu</label>
							<input type="checkbox" id="drop" />
							<ul class="menu">
								<li class="active"><a href="index.html">主页</a></li>
								<li class="mx-lg-4 mx-md-3 my-md-0 my-2"><a href="about.html">联系我们</a></li>
								<li><a href="<%=path %>/toViewsMainIframe">后台管理</a></li>
								<li class="mx-lg-4 mx-md-3 my-md-0 my-2">
									<!-- First Tier Drop Down -->
									<label for="drop-2" class="toggle"> <span class="fa fa-angle-down" aria-hidden="true"></span>
									</label>
									<a href="#">Menu<span class="fa fa-angle-down" aria-hidden="true"></span></a>
									<input type="checkbox" id="drop-2" />
									<ul>
										<li><a href="http://sc.chinaz.com/moban/" target="_blank" class="drop-text">模板之家</a></li>
										<li><a href="about.html" class="drop-text">Farmers</a></li>
										<li><a href="#testi" class="drop-text">s</a></li>
										<li><a href="#newsletter" class="drop-text">Newsletter</a></li>
									</ul>
								</li>
								<li><a href="contact.html">登陆</a></li>
							</ul>
						</nav>
					</div>
					<!-- //nav -->
				</div>
			</div>
		</header>
</body>
</html>