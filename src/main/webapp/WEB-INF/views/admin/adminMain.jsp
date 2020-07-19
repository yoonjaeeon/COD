<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row">
	<!-- 메인왼쪽 -->
	<div class="col-lg-6">
		<!-- 알바생 출석체크  -->
		<div class="card mb-4">
			<div class="card-header">
				<h6 class="m-0 font-weight-bold">* 출 퇴근 *</h6>
			</div>
			<div class="card-body">
				<div class="row workericon" align="center">
					<c:forEach begin="0" end="6">
						<div class="col-sm-4" style="padding: 0.3em">
							<i class="fas fa-user fa-2x"></i> <br> 하준원
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
		<!-- 테이블 on off -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold">* 테이블 ON/OFF *</h6>
			</div>
			<div class="card-body">
				<div class="row cafetables" align="center">
					<c:forEach begin="0" end="6">
						<div class="col-sm-3" style="padding: 0.3em">
							<i class="fas fa-cog fa-2x"></i> <br> T1
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 메인오른쪽 -->
	<div class="col-lg-6">

		<!-- 공지사항등록 -->
		<div class="card shadow mb-4">
			<div
				class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
				<h6 class="m-0 font-weight-bold">* 공지사항 *</h6>
				<div class="dropdown no-arrow">
					<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					 <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
						<div class="dropdown-header">공지사항 관리</div>
						<!-- 목록p 링크걸기 -->
						<a class="dropdown-item" href="#"> 목록 보기 </a>
					</div>
				</div>
			</div>
			<!-- 공지사항등록 -->
			<div class="card-body" align="center">
				<form class="adminNoticeF" action="insertAdminNotice">
					<input type="text" placeholder="공지사항 제목" id="adminNoticeTitle" name="adminNoticeTitle" style="width: 100%"><br> <br>
					<textarea placeholder="공지사항을 입력해주세요" id="adminNoticeContent"	name="adminNoticeContent" style="width: 100%; height: 100px"> </textarea><br><br>
					<input type="submit" value="등록" class="btn btn-outline-info" style="margin-right: 2em">
					<input type="reset"	value="지우기" class="btn btn-outline-info">
				</form>
			</div>
		</div>
		<!-- Collapsable Card Example -->
		<div class="card shadow mb-4">
			<!-- Card Header - Accordion -->
			<a href="#collapseCardExample" class="d-block card-header py-3"
				data-toggle="collapse" role="button" aria-expanded="true"
				aria-controls="collapseCardExample">
				<h6 class="m-0 font-weight-bold text-primary"> <i class="far fa-bell"></i> * 주문현황 * <span class="badge badge-danger badge-counter">7</span></h6>
			</a>
			<!-- Card Content - Collapse -->
			<div class="collapse show" id="collapseCardExample">
				<div class="card-body">
					<div class="order">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>NO</th>
									<th>T번호</th>
									<th>주문내역</th>
									<th>완료</th>
									<th>거절</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach begin="0" end="3">
									<!-- 상세정보 볼 수 있는 modal,,,?뭐든 작업하기 -->
									<a href="#">
									<tr>
										<td>N</td>
										<td>T-N</td>
										<td>아메리카노 1, 라떼2</td>
										<!-- onclick 메소드 필요 함 -->
										<td><i class="fas fa-heart"></i></td>
										<td><i class="fas fa-times"></i></td>
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
</div>