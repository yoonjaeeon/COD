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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/member/assets/css/main.css" />
<!-- slick -->
<link rel="stylesheet" type="text/css" href="resources/slick/slick.css" />
<link rel="stylesheet" type="text/css"href="resources/slick/slick-theme.css" />

	<!-- Scripts -->
	<script src="resources/member/assets/js/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script src="resources/slick/slick.min.js"></script>
	<script src="resources/member/assets/js/browser.min.js"></script>
	<script src="resources/member/assets/js/breakpoints.min.js"></script>
	<script src="resources/member/assets/js/util.js"></script>
	<script src="resources/member/assets/js/main.js"></script>
<!-- bootstrap -->
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
				E-um &copy; Cafe Of Deagu</a>.
			</p>
		</section>
	</div>

</html>