<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
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
</style>
</head>
<body>

<div class="col-lg-6 col-md-12 col-sm-12" align="center">
	<div class="image fit">
	<img src="../resources/upload/${review.gdsThumbImg}" style="width: 100%; height: 300px" />
	</div>
</div>
<div class="row" align="center"> 
	<div class="col-6">
	<p>${review.reviewContent}</p>
	</div>
	<div class="col-6">
	<h6>
	<fmt:parseDate value="${review.reviewTime}" pattern="yyyy-MM-dd HH:mm:ss" var="rt" />
	<fmt:formatDate value="${rt}" pattern="yyyy-MM-dd" /></h6>
	<h6>${review.stars}</h6>
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
$("div.main_slick").slick({
	infinite : true,
	speed : 400,
	slidesToShow : 1,
	adaptiveHeight : true,
	dot : true
});
</script>

</body>
</html>