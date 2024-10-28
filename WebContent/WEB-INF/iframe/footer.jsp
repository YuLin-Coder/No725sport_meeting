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
<link href="${path}/static/css/css_slider.css" type="text/css" rel="stylesheet" media="all">
<link rel="stylesheet" href="${path}/static/css/bootstrap.css">
<link rel="stylesheet" href="${path}/static/css/style.css" type="text/css" media="all" />
<link href="${path}/static/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
<footer class="py-5">
		<div class="container pt-xl-5 pt-lg-3">
			<!-- newsletter -->
			<div class="newsletter_right_w3w3pvt-lau pb-md-5 pb-3" id="newsletter">
				<h2 class="tittle text-wh mb-5 font-weight-bold">Subscribe Newsletter</h2>
				<div class="n-right-w3ls pt-3">
					<form action="#" method="post">
						<div class="row">
							<div class="col-md-4 form-group">
								<input class="form-control" type="text" name="Name" placeholder="Name" required="">
							</div>
							<div class="col-md-4 form-group px-md-0">
								<input class="form-control" type="email" name="Email" placeholder="Email Address" required="">
							</div>
							<div class="col-md-4 form-group mt-md-0 mt-3">
								<button class="form-control btn text-uppercase" type="submit">Subscribe</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!-- //newsletter -->
			<!-- footer bottom -->
			<div class="row pt-xl-5 pt-lg-3">
				<!-- button -->
				<div class="col-lg-5 col-md-7 w3l-footer mt-lg-3 text-md-left text-center">
					<ul class="list-unstyled footer-nav-wthree">
						<li class="mr-4">
							<a href="index.html" class="active">Home</a>
						</li>
						<li class="mr-4">
							<a class="" href="about.html">About Us</a>
						</li>
						<li class="mr-4">
							<a class="" href="gallery.html">Gallery</a>
						</li>
						<li>
							<a class="" href="contact.html">Contact Us</a>
						</li>
					</ul>
				</div>
				<!-- //button -->
				<!-- social icons -->
				<div class="col-lg-7 col-md-5 w3social-icons text-md-right text-center mt-md-0 mt-3">
					<ul>
						<li>
							<a href="#" class="rounded-circle">
								<i class="fa fa-facebook-f"></i>
							</a>
						</li>
						<li class="px-2">
							<a href="#" class="rounded-circle">
								<i class="fa fa-google-plus"></i>
							</a>
						</li>
						<li>
							<a href="#" class="rounded-circle">
								<i class="fa fa-twitter"></i>
							</a>
						</li>
					</ul>
				</div>
				<!-- //social icons -->
			</div>
			<!-- //footer bottom -->
			<!-- copyright -->
			<div class="row pt-lg-4 pt-3 text-md-left text-center">
				<p class="col-xl-7 col-lg-8 copy-right-grids mt-lg-1">Copyright &copy; 2019江苏海事职业技术学院老德钊版权所有</p>
				<div class="col-xl-5 col-lg-4 text-center mt-lg-0 mt-4">
					<a href="#home" class="move-top"></a>
				</div>
			</div>
			<!-- //copyright -->
		</div>
	</footer>
		
	
</body>
</html>