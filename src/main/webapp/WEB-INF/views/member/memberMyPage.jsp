<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="align-center">
	<header class="align-center">
		<br> <br>
		<h2>* My Page *</h2>

		<article>

			<h2>${nickName }님</h2>
			<h2><i class="fa fa-won"></i> ${milege } 1000 <b>P</b></h2>
			<div></div>
	</header>
</div>
</br>
==
<div id="listpage">
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
						<h3 class="m-0 font-weight-bold ">
							 * 최근 결제 내역  * 
						</h3>
					</a>
					<!-- Card Content - Collapse -->
					<div class="collapse show" id="collapseCardExample">
						<div class="card-body">
							<div class="order">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>카페명 </th>
											<th>결제금액 </th>
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
				<h2>#분위기좋은 #동촌유원지</h2>
			</header>
			<div>
				<div class="card shadow mb-4">
					<!-- Card Header - Accordion -->
					<a href="#collapseCardExample" class="d-block card-header py-3"
						data-toggle="collapse" role="button" aria-expanded="true"
						aria-controls="collapseCardExample">
						<h3 class="m-0 font-weight-bold ">
							 * 최근 내가 작성한 리뷰   * 
						</h3>
					</a>
					<!-- Card Content - Collapse -->
					<div class="collapse show" id="collapseCardExample">
						<div class="card-body">
							<div class="order">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>카페명 </th>
											<th>카페주 </th>
											<th>등록날짜</th>											
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
				<h2>#분위기좋은 #동촌유원지</h2>
			</header>
			<div>3page</div>
		</article>
		<article>
			<header>
				<h2>#분위기좋은 #동촌유원지</h2>
			</header>
			<div>4page</div>
		</article>
	</section>
</div>


