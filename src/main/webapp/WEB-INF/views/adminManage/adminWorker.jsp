<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content row">
	<div class="col-xl-6" align="center" style="padding: 3em">
		<form id="workerform" class="form-horizontal">
			<h4>직원 등록 및 수정</h4>
			<hr>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="이름" name="name">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="시급/월급"name="pay">
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="생일"	name="birthday">
			</div>
			<div class="form-group">
				<label>직급</label> <select class="form-control" name="role">
					<option value="1">정직원</option>
					<option value="2">알　바</option>
				</select>
			</div>
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
		<h4>사용자 목록</h4>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">이름</th>
					<th class="text-center">시급</th>
					<th class="text-center">생일</th>
					<th class="text-center">상태</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</div>