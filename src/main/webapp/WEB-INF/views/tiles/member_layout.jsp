<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Cafe Of Deagu</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/member/assets/css/main.css" />
<!-- slick -->
<link rel="stylesheet" type="text/css" href="resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="resources/slick/slick-theme.css" />
<script src="resources/slick/jquery-1.12.4.min.js"></script>
<script src="resources/slick/slick.min.js"></script>

</head>
<body class="single is-preload">

	<!-- Wrapper -->
	<div >
		<!-- Header -->
		<tiles:insertAttribute name="header" />

		<!-- Main -->
		<div id="main">
			<!-- Post -->
			<article class="post">
				<tiles:insertAttribute name="content" />
			</article>
		</div>

		<!-- Footer -->
		<section id="footer">
			<ul class="icons">
				<li><a href="#" class="icon brands fa-twitter"><span
						class="label">Twitter</span></a></li>
				<li><a href="#" class="icon brands fa-facebook-f"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon brands fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon solid fa-rss"><span
						class="label">RSS</span></a></li>
				<li><a href="#" class="icon solid fa-envelope"><span
						class="label">Email</span></a></li>
			</ul>
			<p class="copyright">
				&copy; Untitled. Design: <a href="http://html5up.net">HTML5 UP</a>.
				Images: <a href="http://unsplash.com">Cafe Of Deagu</a>.
			</p>
		</section>
	</div>
	<!-- Scripts -->
	<script src="resources/member/assets/js/jquery.min.js"></script>
	<script src="resources/member/assets/js/browser.min.js"></script>
	<script src="resources/member/assets/js/breakpoints.min.js"></script>
	<script src="resources/member/assets/js/util.js"></script>
	<script src="resources/member/assets/js/main.js"></script>
</html>