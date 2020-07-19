<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div align="center">
	<h1>즐겨찾는 카페 리스트</h1>
</div>


<div id="listpage">
	<section class="posts">
		<c:forEach begin="0" end="3" items="${getBookmarks}" var="bookmark">
			<article>
				<a href="#" class="image fit"><img
					src="resources/images/main1.jpg" alt=""></a>
				<header>
					<h2>${bookmark.adminId }</h2>
					<h4>${bookmark.cafeThumbnail }</h4>
				</header>
				<i class='far fa-heart' style='font-size: 24px;'></i>
				<h2>4.3</h2>
			</article>
		</c:forEach>
	</section>
</div>