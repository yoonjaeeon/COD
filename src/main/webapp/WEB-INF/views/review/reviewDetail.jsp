<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<style type="text/css">
body {
    margin:2em;
}
.image {
	border: 0;
	display: inline-block;
	position: relative;
}

.image img {
	display: block;
}
.image.fit {
	display: block;
	margin: 0 0 2em 0;
	width: 100%;
}

.image.fit img {
	width: 100%;
}

.image.featured {
	display: block;
	margin: 0 0 3em 0;
	width: 100%;
}

.image.featured img {
	width: 100%;
	height: 200px;
}
.post {
	padding: 3em 3em 1em 3em;
	background: #ffffff;
	border: solid 1px rgba(160, 160, 160, 0.3);
	margin: 0 0 3em 0;
	position: relative;
}
::-webkit-scrollbar { display: none; }

</style>
</head>
<body>

<div class="col-lg-6 col-md-12 col-sm-12" align="center">
	<div class="image fit">
	<img src="../resources/upload/${review.gdsThumbImg}" style="width: 100%; height: 300px" />
	</div>
</div>
<div class="row post" align="center"> 
	<div class="col-6">
	<textarea id="reviews" class="form-control" style="border: none; width: 100%; height: 100px">${review.reviewContent}</textarea>
	</div>
	<div class="col-6">
	<h6>
	<fmt:parseDate value="${review.reviewTime}" pattern="yyyy-MM-dd HH:mm:ss" var="rt" />
	<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd" /></h6>
	<h6><i class='fas fa-star'></i> ★ ${review.stars}</h6>
	</div>
	<div class="col-12" align="center">
	<br><br>
		
	</div>
	
</div>
<div class="row">
	<c:forEach items="${photo}" var="p" >
		<div class="col-6">
			<div class="image featured"	style="width:100%;  overflow: hidden">
				<img src="../resources/upload/${p.photoName}" class="image fit">
			</div>
		</div>
	</c:forEach>
</div>

<script>
var str = document.getElementById("textarea").value;
str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
document.getElementById("textarea").value = str;
</script>
</body>
</html>