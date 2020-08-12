<%@ page language="java" contentType="text/html; charset=UTF-8" 
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 
<script language="javascript">
 
    var connectedDate = new Date();
     
    function showClock(){
        var currentDate = new Date();
        var divClock = document.getElementById("divClock");
         
        var result = Math.ceil((currentDate - connectedDate)/1000);
         
        divClock.innerText = "이 페이지에 접속 후"+result;
        divClock.innerText +="초가 지났습니다.";
         
        setTimeout(showClock,1000);
    }
</script>
<body onload="showClock()">
    <div id="divClock" class="clock"></div>
</body>
</html>



