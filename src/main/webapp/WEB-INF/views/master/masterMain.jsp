<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function adminListForm() {
		location.href="adminListForm";
			
	}
	function advertisementForm() {
		location.href="advertisementForm";
			
	}
	function masterMessage() {
		location.href="masterMessage";
	
	}
	function themeList() {
		location.href="themeList";
	}
	function masterSalesForm() {
		location.href="masterSalesForm";
	}
	
	
	
</script>
<div class="container-fluid">
	<!-- Page Heading -->
	<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">마스터 페이지</h1>
		<a href="#"
			class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
			class="fas fa-download fa-sm text-white-50"></i> PDF.file </a>
	</div>
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">관리자님 접속 확인.</h6>
		</div>
		<div class="card-body">
			<p><a href="#" onclick="">마스터 ${sessionScope.adminId }  님 환영합니다.</a></p>
			<p class="mb-0"></p>
			
		</div>
	</div>
	<br />
	<br />

	<div class="card mb-2 py-1 border-left-primary">
		<div class="card-body">
			<h5 class="center">데이터 자료</h5>
		</div>
	</div>
	<!-- Content Row -->
	<div class="row">
		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">전체 회원수</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"> * ${map.member } 명</div>
						</div>
						<div class="col-auto">						
							<i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">미처리 승인 
								</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								* ${map.cafe1 } 건  </div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300" onclick="adminListForm()"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">승인된 관리자 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">* ${map.cafe2}  건</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300" onclick="adminListForm()" ></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">광고 의뢰 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">* ${map.ad}  건</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300" onclick="advertisementForm()" ></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-primary shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">메세지</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800"> * ${map.mess } 건</div>
						</div>
						<div class="col-auto">						
							<i class="fas fa-clipboard-list fa-2x text-gray-300" onclick="masterMessage()"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Earnings (Monthly) Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-success shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div
								class="text-xs font-weight-bold text-success text-uppercase mb-1">가맹점수 
								</div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">
								* ${map.cafe } 점 </div>
						</div>
						<div class="col-auto">
							<i class="fas fa-clipboard-list fa-2x text-gray-300" onclick="themeList()"></i>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">가맹 카페 직원수  </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">* ${map.work}  명</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300" onclick="adminListForm()" ></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Pending Requests Card Example -->
		<div class="col-xl-3 col-md-6 mb-4">
			<div class="card border-left-warning shadow h-100 py-2">
				<div class="card-body">
					<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">월별 통계 </div>
							<div class="h5 mb-0 font-weight-bold text-gray-800">* ${map.A1}  100억</div>
						</div>
						<div class="col-auto">
							<i class="fas fa-comments fa-2x text-gray-300" onclick="masterSalesForm()" ></i>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>



	<!-- Content Row -->

	<div class="card shadow mb-4">
		<!-- Card Header - Accordion -->
		<a href="#collapseCardExample" class="d-block card-header py-3"
			data-toggle="collapse" role="button" aria-expanded="true"
			aria-controls="collapseCardExample">
			<h6 class="m-0 font-weight-bold text-primary">Collapsable Card
				Example</h6>
		</a>
		<!-- Card Content - Collapse -->
		<div class="collapse show" id="collapseCardExample" style="">
			<div class="card-body">
			광고주 관리 <br>
			광고 월별 관리  <br>
			
			</div>
		</div>
	</div>
	<!-- Content Row -->

	<div class="row">
		<!-- Area Chart -->
		<div class="col-xl-8 col-lg-7">
			<div class="card shadow mb-4">
				<!-- Card Header - Dropdown -->
				<div
					class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">월별 접속자 통계</h6>
					<div class="dropdown no-arrow">
						<a class="dropdown-toggle" href="#" role="button"
							id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i
							class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
						</a>
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
							aria-labelledby="dropdownMenuLink">
							<div class="dropdown-header">iiiiiiii</div>
							<a class="dropdown-item" href="#">Action</a> <a
								class="dropdown-item" href="#">Another action</a>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="#">Something else here</a>
						</div>
					</div>
				</div>
				<!-- Card Body -->
				<div class="card-body">
					<div class="chart-area">
						<div class="chartjs-size-monitor">
							<div class="chartjs-size-monitor-expand">
								<div class=""></div>
							</div>
							<div class="chartjs-size-monitor-shrink">
								<div class=""></div>
							</div>
						</div>
						<canvas id="myAreaChart"
							style="display: block; height: 320px; width: 557px;" width="1114"
							height="640" class="chartjs-render-monitor"></canvas>
					</div>
				</div>
			</div>
		</div>

		<div id="listpage">

			<section class="posts">
				<article>
					
				</article>

			</section>
		</div>
	</div>

<div id="listpage">

			<section class="posts">
				<article>
					
				</article>

			</section>
		</div>
	</div>

	<!-- Content Row -->
	<div class="row">

		<!-- Content Column -->
		<div class="col-lg-6 mb-4">

			<!-- Project Card Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h4 class="m-0 font-weight-bold text-primary">C.O.D [ 7 ]월 그래프
					</h4>
				</div>
				<div class="card-body">
					<h4 class="small font-weight-bold">
						접속자 <span class="float-right">20%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-danger" role="progressbar"
							style="width: 20%" aria-valuenow="20" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						회원탈퇴 <span class="float-right">40%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-warning" role="progressbar"
							style="width: 40%" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						카페 업체 등록건 <span class="float-right">60%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar" role="progressbar" style="width: 60%"
							aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						결제 건수 <span class="float-right">80%</span>
					</h4>
					<div class="progress mb-4">
						<div class="progress-bar bg-info" role="progressbar"
							style="width: 80%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
					<h4 class="small font-weight-bold">
						광고비 매출액 <span class="float-right">99%</span>
					</h4>
					<div class="progress">
						<div class="progress-bar bg-success" role="progressbar"
							style="width: 99%" aria-valuenow="100" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			</div>
			
			<!-- Illustrations -->
			<div >
			<section>
				<article>
					<aside>
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">그래프 분석</h6>
							</div>
							<div class="card-body">
								<div class="text-center">
									<img class="img-fluid px-3 px-sm-4 mt-3 mb-4"
										style="width: 25rem;" src="img/undraw_posting_photo.svg"
										alt=" ">
								</div>
								
								
								<p>
									여기는 분석된 매출 결과를 표시하는 창입니다 <a target="_blank" rel="nofollow"
										href="https://undraw.co/"></a>
								</p>
								<a target="_blank" rel="nofollow" href="https://undraw.co/">광고주
									리스트 페이지 →</a>
							</div>
						</div>
					</aside>
				</article>
			</section>



			<!-- Approach -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">무제 입니다</h6>
				</div>
				<div class="card-body">
					<p>여기는 광고주</p>
					<p class="mb-0">언ㅇ네엔.</p>
				</div>
			</div>

		</div>
	</div>

</div>

<!-- Page level plugins -->
<script src="resources/admin/vendor/chart.js/Chart.min.js"></script>

<!-- Page level custom scripts -->
<script src="resources/admin/js/demo/chart-area-demo.js"></script>
<script src="resources/admin/js/demo/chart-pie-demo.js"></script>