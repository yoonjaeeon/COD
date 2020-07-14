<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>공지 등록 </h2>
				<br>
				<br>
					<input type="text" class="form-control" placeholder="제목" id="master_notice_title" name="master_notice_title" /> <br>
					<br>
					<textarea placeholder="내용" rows="10" name="master_notice_content" id="master_notice_content"></textarea>
					<br /> <br> <input type="file" id="master_notice_file" name="master_notice_file" /><br>
					<br>				
						<input type="submit" value="저장" />
						<input type="reset" value="지우기" />
				</form>
</body>
</html>