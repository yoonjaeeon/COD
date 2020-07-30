<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
   <script type="text/javascript">
	function memberinto() {
		location.href="memberUpdateForm";
			
	}
	function myorderList() {
		location.href="myorderList";
			
	}
	
	
</script>
    
<div class="align-center hovers row">
   <div class="col-lg-5">
      <h1>* My Page *</h1>
      <h2>${member.nickname } 님</h2>
      <h2>
         <i class="fab fa-product-hunt" style='font-size: 24px'></i> ${ member.mileage} 원
      </h2>
   </div>
   <div class="col-lg-7">
      <div class="main_feature text-center margin1">
         <div class="row">
            <div class="col-sm-2">
               <a href="memberReviewList">
                  <div class="single_feature">
                     <div class="single_feature_icon">
                        <i class="fas fa-comment"></i>
                     </div>
                     
                     <h4>내가 쓴 리뷰</h4>
                  </div>
               </a>
            </div>
            <div class="col-sm-2">
               <div class="single_feature" onclick="myorderList()">
                  <div class="single_feature_icon">
                     <i class="fab fa-fort-awesome"></i>
                  </div>
                  <h4>결제내역</h4>
               </div>
            </div>
            <div class="col-sm-2">
               <div class="single_feature" onclick="memberinto()">
                  <div class="single_feature_icon">
                     <i class="fab fa-fort-awesome"></i>
                  </div>
                  <h4>정보수정</h4>
               </div>
            </div>
            <div class="col-sm-2">
               <div class="single_feature" >
                  <div class="single_feature_icon">
                     <i class="fab fa-fort-awesome"></i>
                  </div>
                  <h4>회원탈퇴</h4>
               </div>
            </div>
            <div class="col-sm-2">
               <div class="single_feature">
                  <div class="single_feature_icon">
                     <i class="fab fa-fort-awesome"></i>
                  </div>
                  <a href="insertFormReview"><h4>리뷰작성주소</h4></a>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<br />
<div id="listpage">
   <hr>
   <section class="posts">
      <article>
         <header>
            <h2>나의 결제내역리스트</h2>
         </header>
         <div>
            <div class="card shadow mb-4">
               <!-- Card Header - Accordion -->
               <a href="#collapseCardExample" class="d-block card-header py-3"
                  data-toggle="collapse" role="button" aria-expanded="true"
                  aria-controls="collapseCardExample">
                  <h3 class="m-0 font-weight-bold ">* 최근 결제 내역 *</h3>
               </a>
               <!-- Card Content - Collapse -->
               <div class="collapse show" id="collapseCardExample">
                  <div class="card-body">
                     <div class="order">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>카페명</th>
                                 <th>결제금액</th>
                                 <th>결제날짜</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach begin="0" end="3">
                                 <!-- 상세정보 볼 수 있는 modal,,,?뭐든 작업하기 -->
                                 <a href="#">
                                    <tr>
                                       <td>예담카페</td>
                                       <td>12,000</td>
                                       <td>2020/07/20</td>
                                       <!-- onclick 메소드 필요 함 -->
                                    </tr>
                                 </a>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </article>
      <article>
         <header>
            <h2>#여가단 뭐넣으면 좋을까??</h2>
         </header>
         <div>
            <div class="card shadow mb-4">
               <!-- Card Header - Accordion -->
               <a href="#collapseCardExample" class="d-block card-header py-3"
                  data-toggle="collapse" role="button" aria-expanded="true"
                  aria-controls="collapseCardExample">
                  <h3 class="m-0 font-weight-bold ">* 최근 내가 작성한 리뷰 *</h3>
               </a>
               <!-- Card Content - Collapse -->
               <div class="collapse show" id="collapseCardExample">
                  <div class="card-body">
                     <div class="order">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>카페명</th>
                                 <th>카페주소</th>
                                 <th>등록날짜</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach begin="0" end="3">
                                 <!-- 상세정보 볼 수 있는 modal,,,?뭐든 작업하기 -->
                                 <a href="#">
                                    <tr>
                                       <td>예담카페</td>
                                       <td>대구 중구 국채보상 13-4</td>
                                       <td>2020/07/19</td>
                                       <!-- onclick 메소드 필요 함 -->

                                    </tr>
                                 </a>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </article>
      <article>
         <header>
            <h2>#내가 자주가는  #카페목록</h2>
         </header>
         <div>
            <div class="card shadow mb-4">
               <!-- Card Header - Accordion -->
               <a href="#collapseCardExample" class="d-block card-header py-3"
                  data-toggle="collapse" role="button" aria-expanded="true"
                  aria-controls="collapseCardExample">
                  <h3 class="m-0 font-weight-bold ">* 최근 결제 내역 *</h3>
               </a>
               <!-- Card Content - Collapse -->
               <div class="collapse show" id="collapseCardExample">
                  <div class="card-body">
                     <div class="order">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>카페명</th>
                                 <th>결제금액</th>
                                 <th>결제날짜</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach begin="0" end="3">
                                 <!-- 상세정보 볼 수 있는 modal,,,?뭐든 작업하기 -->
                                 <a href="#">
                                    <tr>
                                       <td>예담카페</td>
                                       <td>12,000</td>
                                       <td>2020/07/20</td>
                                       <!-- onclick 메소드 필요 함 -->
                                    </tr>
                                 </a>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </article>
      <article>
         <header>
            <h2>#분위기좋은 #카페 추천</h2>
         </header>
         <div>
            <div class="card shadow mb-4">
               <!-- Card Header - Accordion -->
               <a href="#collapseCardExample" class="d-block card-header py-3"
                  data-toggle="collapse" role="button" aria-expanded="true"
                  aria-controls="collapseCardExample">
                  <h3 class="m-0 font-weight-bold ">* 최근 결제 내역 *</h3>
               </a>
               <!-- Card Content - Collapse -->
               <div class="collapse show" id="collapseCardExample">
                  <div class="card-body">
                     <div class="order">
                        <table class="table table-hover">
                           <thead>
                              <tr>
                                 <th>카페명</th>
                                 <th>결제금액</th>
                                 <th>결제날짜</th>
                              </tr>
                           </thead>
                           <tbody>
                              <c:forEach begin="0" end="3">
                                 <!-- 상세정보 볼 수 있는 modal,,,?뭐든 작업하기 -->
                                 <a href="#">
                                    <tr>
                                       <td>예담카페</td>
                                       <td>12,000</td>
                                       <td>2020/07/20</td>
                                       <!-- onclick 메소드 필요 함 -->
                                    </tr>
                                 </a>
                              </c:forEach>
                           </tbody>
                        </table>
                     </div>
                  </div>
               </div>
            </div>

         </div>
      </article>
   </section>
</div>