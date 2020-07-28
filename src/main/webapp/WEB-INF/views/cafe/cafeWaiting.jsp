<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <title>마커에 클릭 이벤트 등록하기</title>
    
</head>
<body>
 
<script>
$.ajax({
	 url:"http://www.juso.go.kr/addrlink/addrCoordApiJsonp.do"
	 ,type:"post"
	 ,data:$("#form").serialize() // 요청변수 설정
	 ,dataType:"jsonp" // 크로스도메인으로 인한 jsonp 이용
	 ,crossDomain:true
	 ,success:function(xmlStr){ // xmlStr : 좌표 검색 결과 XML 데이터
	 if(navigator.appName.indexOf("Microsoft") > -1){
	 // IE 환경에서 JSONP의 returnXml 결과 데이터 처리
	 var xmlData= newActiveXObject("Microsoft.XMLDOM");
	 xmlData.loadXML(xmlStr.returnXml)
	 }else{
	 // IE 이외 환경에서 처리
	 var xmlData= xmlStr.returnXml;
	 }
	 $("#list").html("");
	 var errCode= $(xmlData).find("errorCode").text();
	var errDesc= $(xmlData).find("errorMessage").text();
	 if(errCode != "0"){
	 alert(errCode+"="+errDesc);
	 }else{
	 if(xmlStr!= null){
	 makeList(xmlData); // XML 데이터 HTML 형태로 저장
	 }
	 }
	 }
	 ,error: function(xhr,status, error){
	 alert("에러발생"); // AJAX 호출 에러
	 }
	});
	
</script>
</body>
</html>