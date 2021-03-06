<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$(function(){
	$('#messagesDropdown').on("click",function(){
		$.ajax({
			url : 'fiveMessage',
			type : 'post',
			datatype : 'json',
			contentType: 'application/json;charset=utf-8',
			success:function(result){
				$('#divParent').empty();
				$.each(result, function(index, item){
					$('<div>').addClass('font_weight-bold')
					  .append($('<div data-toggle="modal" data-target="#contentModals" onclick="messageUpdate('+item.messageSeq+')">').addClass('text-truncate').html(item.messageTitle))
					  .append($('<div data-toggle="modal" data-target="#contentModals" onclick="messageUpdate('+item.messageSeq+')">').addClass('small text-gray-500').html('관리자 · '+item.messageDate))
					  .append($('<input type="hidden" value="'+item.messageSeq+'" id="messageSeq">'))
					  .appendTo($('#divParent'));
				})
			}
		})
	});
})

$(function(){
	$.ajax({
		url :'getOrderCount',
		datatype :'json',
		success:function(result){
			$('#getOrderCount').html(result);
			$('#getOrderCounts').html(result);
		}
			
	})
})
</script>
<body id="page-top">
	
  <!-- Page Wrapper -->
  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav sidebar" id="accordionSidebar">

      <!-- Sidebar - Brand -->
      <a class="sidebar-brand d-flex align-items-center justify-content-center" href="admin">
        <div class="sidebar-brand-icon rotate-n-15">
          <i class="fas fa-coffee"></i>
        </div>
        <div class="sidebar-brand-text mx-3" style ="color=#646464">Cafe Of Degue</div>
      </a>

      <!-- Divider -->
      <hr class="sidebar-divider my-0">

      <!-- Nav Item - Dashboard -->
      <li class="nav-item active">
        <a class="nav-link" href="admin">
          <i class="fas fa-home"></i>
          <span>Home</span></a>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        Cafe Management
      </div>

      <!-- Nav Item - Pages Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
          <i class="fa fa-credit-card"></i>
          <span>정산</span>
        </a>
        <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">카페 정산</h6>
            <a class="collapse-item" href="workerCalculateView">직원출퇴근조회</a>
            <a class="collapse-item" href="calculateView">매출정산</a>
          </div>
        </div>
      </li>

      <!-- Nav Item - Utilities Collapse Menu -->
      <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities">
          <i class="fas fa-fw fa-wrench"></i>
          <span>카페관리</span>
        </a>
        <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
          <div class="bg-white py-2 collapse-inner rounded">
            <h6 class="collapse-header">관리</h6>
            <a class="collapse-item" href="adminMenuForm">메뉴관리</a>
            <a class="collapse-item" href="seatForm">좌석관리</a>
            <a class="collapse-item" href="inventoryList">재고관리</a>
            <a class="collapse-item" href="adminWorkerForm">직원관리</a>
            <a class="collapse-item" href="adminReviewList">리뷰조회</a>
            <a class="collapse-item" href="adminNoticeList">공지사항관리</a>
            <a class="collapse-item" href="cafeUpdateForm">카페수정</a>
             <a class="collapse-item" href="cafe?adminId=${sessionScope.adminId }" target="_blank">내 카페보기</a>
          </div>
        </div>
      </li>

      <!-- Divider -->
      <hr class="sidebar-divider">

      <!-- Heading -->
      <div class="sidebar-heading">
        cafe 
      </div>

      <!-- Nav Item - Charts -->
      <li class="nav-item">
        <a class="nav-link" href="adminSalesForm">
          <i class="fas fa-fw fa-chart-area"></i>
          <span>정산</span></a>
      </li>
      <!-- Divider -->
      <hr class="sidebar-divider d-none d-md-block">

      <!-- Sidebar Toggler (Sidebar) -->
      <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
    </ul>
    <!-- End of Sidebar -->
    
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <!-- Main Content -->
      <div id="content">
        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top">
          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn  d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" id="messageDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-secondary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

             <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter" id="getOrderCount"></span>
                 <script>
                $('#getOrderCount').load("getOrderCount")
                </script>
              </a>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="adminMessage" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter" id="messageCount"></span>
                <script>
                $('#messageCount').load("getMessageCount")
                </script>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  	메세지 목록
                </h6>
                <div id="divParent">
                
                </div>
                            
                <a class="dropdown-item text-center small text-gray-500" href="adminMessage">메세지 더 보기</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><b>${sessionScope.adminId}</b> 님</span>
                <img class="img-profile rounded-circle" src="https://source.unsplash.com/QAB-WJcbgJk/60x60">
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <!-- <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div> -->
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        
        <div class="modal fade" id="contentModals" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">메세지</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<h2><span id="getMessageTitle"> </span></h2> <br>
				<span id="getMessageContent"></span>
				<%-- ${messageTitle } <br>
				${getMessageContent}fff --%>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<script>
var messageSeq ;
function messageUpdate(seq){
messageSeq = seq;
}

//모달창 메세지 받기
$('#contentModals').on('show.bs.modal', function (e) {
	console.log(e.target); 
	$.ajax({
		url : 'getMessage',  
		method:'post',
		data : {messageSeq:messageSeq},
		dataType :'json',
		success:function(data){
				$('#getMessageTitle').html(data.messageTitle);
				$('#getMessageContent').html(data.messageContent);
				$('#messageCount').load("getMessageCount");
		}
	});
});
</script>