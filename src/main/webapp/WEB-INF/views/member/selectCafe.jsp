<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="padding2" align="center">
	<h3>인기리스트</h3>
	<hr>
	<div class="main_slicks">
		<c:forEach items="${sCafe }" var="list">
			<div>
				<article class="mini-post">
					<header class="row">
						<div class="col-sm-10">
							<h3>
								<a href="cafe?adminId=${list.adminId}">${list.cafeName }</a>
							</h3>
							<h4>${list.cafeHashtag }</h4>
						</div>
						<%-- <div class="col-sm-2">
							<div class="heart" data-class="${list.bookmarks}">
								<c:if test="${list.bookmarks == 1 }">
									<i class="far fa-heart" data-placement="top" title="즐겨찾기 "
										data-toggle="tooltip" style="color: red" data-id='${list.adminId}'
										id="bookmarkDelete${list.bookmarkSeq}"></i>
								</c:if>
								<c:if test="${list.bookmarks == 0}">
									<i class="far fa-heart" data-placement="top" title="즐겨찾기 "
										data-toggle="tooltip" data-id='${list.adminId}'></i>
								</c:if>
							</div>
							
								<c:if test="${empty list.bookmarks}">
									<i class="far fa-heart" data-placement="top" title="로그인이 필요한 기능 "
										data-toggle="tooltip" ></i>
								</c:if>
							<h4>${list.stars }</h4>
						</div> --%>
					</header>
					<a href="cafe?adminId=${list.adminId}" class="image"> <img
						class="slick" src="resources/upload/${list.cafeThumbnail}" alt="">
					</a>
				</article>
			</div>
		</c:forEach>
	</div>
</div>