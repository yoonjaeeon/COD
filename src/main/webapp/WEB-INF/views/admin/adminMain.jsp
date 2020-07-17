<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="row">
		<!-- 메인왼쪽 -->
		<div class="col-lg-6">
			<!-- Default Card Example -->
			<div class="card mb-4">
				<div class="card-header" align="center">
					<h6 class="m-0 font-weight-bold">* 출 퇴근 *</h6>
				</div>
				<div class="card-body">
					<div>
					<i class="fas fa-user fa-2x"></i>
					직원1
					</div>
					<button>직원1</button>
					<button>직원2</button>
					<button>직원3</button>
				</div>
			</div>
			<!-- Basic Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold">* 테이블 ON/OFF *</h6>
				</div>
				<div class="card-body">
					<button>T1</button>
					<button>T2</button>
					<button>T3</button>
				</div>
			</div>

		</div>
		<!-- 메인오른쪽 -->
		<div class="col-lg-6">

			<!-- Dropdown Card Example -->
			<div class="card shadow mb-4">
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold">공지사항</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
						<i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header"> 공지사항 관리 </div>
							<a class="dropdown-item" href="#"> 목록 보기 </a> 
						</div>
					</div>
				</div>
				<!-- 공지사항등록 -->
				<div class="card-body">
				<form class="adminNoticeF" action="insertAdminNotice">
			      <input type="text" placeholder="공지사항 제목" id="adminNoticeTitle" name="adminNoticeTitle"><br>
			      <textarea placeholder="공지사항을 입력해주세요" id="adminNoticeContent" name="adminNoticeContent"> 
			      </textarea><br>
			      <input type="submit" value="등록">
			   </form>
			</div>

			<!-- Collapsable Card Example -->
			<div class="card shadow mb-4">
				<!-- Card Header - Accordion -->
				<a href="#collapseCardExample" class="d-block card-header py-3"
					data-toggle="collapse" role="button" aria-expanded="true"
					aria-controls="collapseCardExample">
					<h6 class="m-0 font-weight-bold text-primary"> 주문현황 </h6>
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
										<th>수락</th>
										<th>거절</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>T-3</td>
										<td>아메리카노 1</td>
										<td><button>o</button></td>
										<td><button>x</button></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>