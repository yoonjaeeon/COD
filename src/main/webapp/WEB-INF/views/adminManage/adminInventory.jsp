<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content row">
	<div class="col-xl-6" align="center" style="padding: 3em">
		<form id="workerform" class="form-horizontal">
			<h4>재고 관리</h4>
			<hr>
			<div class="form-group">
			재고명
				<input type="text" class="form-control" placeholder="" name="">
			</div>
			<div class="form-group">
			재고 수량
				<input type="text" class="form-control" placeholder=""name="">
			</div>
			<div class="form-group">
			현재 수량
				<input type="text" class="form-control" placeholder=""name="">
			</div>
			<div class="form-group">
			용량
				<input type="text" class="form-control" placeholder=""name="">
			</div>
				<div class="form-group">
			단가
				<input type="text" class="form-control" placeholder=""name="">
			</div>
		<!-- 	<div class="form-group">
				<label>광고비</label> <select class="form-control" name="role">
					<option value="1">정직원</option>
					<option value="2">알　바</option>
				</select>
			</div> -->
			<div class="btn-group">
				<input type="button" class="btn btn-primary" value="등록"
					id="btnInsert" /> <input type="button" class="btn btn-primary"
					value="수정" id="btnUpdate" /> <input type="button"
					class="btn btn-primary" value="초기화" id="btnInit" />
			</div>
		</form>
	</div>
	<hr />
	<div class="col-xl-6" align="center" style="padding: 3em">
		<h4>재고 목록</h4>
		<table class="table text-center">
			<thead>
				<tr>
				    <th class="text-center">재고 번호</th>
					<th class="text-center">재고명</th>
					<th class="text-center">재고 수량</th>
					<th class="text-center">현재 수량</th>
					<th class="text-center">용량</th>
					<th class="text-center">단가</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>