<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
<script>
function logoutCheck(){
	var value = confirm("정말 로그아웃 하시겠습니까?");
	if(value){
		logout.submit();
	}else{
		return;
	}
}
</script>
<form name="logout" action="memberLogout" method="post"></form>
   <h1>
      <a href="home"><i class="fas fa-coffee"></i>    C O D</a>
   </h1>
   <nav class="links">
      <ul><c:if test="${empty sessionScope.loginEmail }">
         <li><a href="memberThemeList">테마별</a></li>
         <li><a href="memberAreaList">지역별</a></li>
         </c:if>      
      	<c:if test="${not empty sessionScope.loginEmail }">
         <li><a href="themeList">테마별</a></li>
         <li><a href="areaList">지역별</a></li>
         </c:if>
         <c:if test="${empty sessionScope.loginEmail }">
         <li><a href="memberLoginForm">로그인</a></li>
         <li><a href="memberInsertForm">회원가입</a></li>
         </c:if>         
         <c:if test="${not empty sessionScope.loginEmail }">
         <li><a href="bookmarks">즐겨찾기</a></li>
         <li><a href="memberMyPage">MyPage</a></li>
         <li><a onclick="logoutCheck()"> 로그아웃</a></li>
         </c:if>
      </ul>
   </nav>
   <nav class="main">
      <ul>
         <li class="search"><a class="fa-search" href="#search">Search</a>
            <form id="search" method="get" action="#">
               <input type="text" name="query" placeholder="Search" />
            </form></li>
         <li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
      </ul>
   </nav>
</header>

<!-- Menu -->
<section id="menu">
   <!-- Search -->
   <section>
      <form class="search" method="get" action="#">
         <input type="text" name="query" placeholder="Search" />
      </form>
   </section>

   <!-- Links -->
   <section>
      <ul class="links">
         <li><a href="themeList">
               <h3>테마별</h3>
               <p>원하는 테마별로 카페를 검색해 보세요</p>
         </a></li>
         <li><a href="areaList">
               <h3>지역별</h3>
               <p>원하는 위치의 카페를 검색해 보세요 </p>
         </a></li>
         <li><a href="bookmarks">
               <h3>즐겨찾기</h3>
               <p>맘에 드는 카페를 등록해 보세요</p>
         </a></li>
         <li><a href="memberMyPage">
               <h3>MyPage</h3>
         </a></li>
      </ul>
   </section>

   <!-- Actions -->
   <section>
      <ul class="actions stacked">
         <li><a href="memberLoginForm" class="button large fit">Log In</a></li>
      </ul>
   </section>

</section>