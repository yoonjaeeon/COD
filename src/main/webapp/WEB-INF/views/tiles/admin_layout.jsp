<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>COD</title>

<!-- Custom fonts for this template-->
<link href="resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/admin/css/main.css" rel="stylesheet">
<link href="resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
	<script src="resources/admin/vendor/jquery/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
<style>
.adminContent{padding: 10px; 
min-height:500px;}
</style>
</head>
<tiles:insertAttribute name="a_header" />
<div class='adminContent'>
<tiles:insertAttribute name="a_content" />
</div>

<!-- End of Main Content -->

<!-- Footer -->
<footer class="sticky-footer bg-white">
	<div class="icon" align="center">
		<a href="#"><i class="fab fa-facebook"></i></a> 
		<a href="#"><i class="fab fa-twitter"></i></a> <a href="#">
		<i class="fab fa-instagram"></i></a>
		<a href="#"><i class="fas fa-envelope"></i></a>
	</div>
	<div class="container my-auto">
		<div class="copyright text-center my-auto">
			<span> E-um &copy; Cafe Of Dague 2020</span>
		</div>
	</div>
</footer>
<!-- End of Footer -->


<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top"> <i
	class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">로그아웃</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">정말 로그아웃 하시겠습니까?</div>
			<div class="modal-footer">
				<button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
				<a class="btn btn-outline-info" href="adminLogout">로그아웃</a>
			</div>
		</div>
	</div>
</div>
<!-- Core plugin JavaScript-->
<script src="resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="resources/admin/js/sb-admin-2.min.js"></script>

<!-- <!-- Page level plugins
<script src="resources/admin/vendor/chart.js/Chart.min.js"></script>

Page level custom scripts
<script src="resources/admin/js/demo/chart-area-demo.js"></script>
<script src="resources/admin/js/demo/chart-pie-demo.js"></script> -->
</body>
</html>