<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<header id="header">
   <h1>
      <a href="home"><i class="fas fa-coffee"></i>    C O D</a>
   </h1>
   <nav class="links">
      <ul>
         <li><a href="ThemaList">테마별</a></li>
         <li><a href="AreaList">지역별</a></li>
         <li><a href="bookmarks">즐겨찾기</a></li>
         <li><a href="memberLoginForm">로그인</a></li>
         <li><a href="memberInsertForm">회원가입</a></li>
         <li><a href="MemberMyPage">MyPage</a></li>
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
         <li><a href="ThemaList">
               <h3>테마별</h3>
               <p>원하는 테마별로 카페를 검색해 보세요</p>
         </a></li>
         <li><a href="AreaList">
               <h3>지역별</h3>
               <p>원하는 위치의 카페를 검색해 보세요 </p>
         </a></li>
         <li><a href="bookmarks">
               <h3>즐겨찾기</h3>
               <p>맘에 드는 카페를 등록해 보세요</p>
         </a></li>
         <li><a href="MemberMyPage">
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