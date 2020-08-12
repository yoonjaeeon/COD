<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

    	   var chartdata=[];
           $.ajax({
         	  url: "monthAdminSales",
         	  async : false,      //동기식, 아작스 실행하고 데이터 값이 와야 실행(동기)
         	  success : function(result) {
         	  	for(i=0; i<result.length; i++) {
         	  		chartdata.push([result[i].TIME+'월', parseInt(result[i].PRICE)]);
         	  	}
         	  }
           });
           data.addRows(chartdata);//아작스로 데이터 가져온거
        

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>