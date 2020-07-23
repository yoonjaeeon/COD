<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<h1>즐겨찾는 카페 리스트</h1>
</div>

<div id="listpage">
	<section class="posts">
		<c:forEach items="${getBookmarks}" var="bookmark">
			<%-- <article>
				<a href="#" class="image fit"><img src="resources/upload/main1.jpg" alt=""></a>
				<header>
					<h2>${bookmark.adminId }</h2>
					<h4>${bookmark.cafeThumbnail }</h4>
				</header>
				<i class='far fa-heart' style='font-size: 24px;'></i>
				<h2>4.3</h2>
			</article> --%>
			
				<article class="mini-post">
				<header class="row">
					<div class="col-sm-10">
						<h3>
							<a href="single.html">${bookmark.cafeName }</a>
						</h3>
						<h4>#해쉬태그</h4>
					</div>
					<div class="col-sm-2">
						<c:if test="${not empty bookmark.email}">
							<i class="far fa-heart" style="color: red"></i>
						</c:if>
						<c:if test="${empty bookmark.email}">
							<i class="far fa-heart"></i>
						</c:if>
						<h4>${theme.stars }</h4>
					</div>
				</header>
				<a href="#" class="image"><img
					src="resources/upload/${bookmark.cafeThumbnail }" alt=""></a>
			</article>
		</c:forEach>
	</section>
</div>