<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

</script>
<div class="container">
	<div class="row">
		<div class="col-5">
		<input type="date" id="date" class="form-control" name="startTime" >	
		</div>
		<div class="col-5">
		<input type="date" id="date" class="form-control" name="endTime" >
		</div>
		<div class="col-2">
		<button> 조회 </button>
		</div>
	</div>
	<br>
	<table id ="ctbl" class="table table-hover">
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
			
		</tbody>
	</table>
</div>