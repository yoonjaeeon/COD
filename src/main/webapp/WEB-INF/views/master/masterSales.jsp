<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">
     
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '이름');
          data.addColumn('number', '광고매출');
         
          var chartdata = [];
          $.ajax({
        	  url: "masterSales",
        	  async : false,      //동기식, 아작스 실행하고 데이터 값이 와야 실행(동기)
        	  success : function(result) {
        	  	for(i=0; i<result.length; i++) {
        	  		chartdata.push([result[i].name, parseInt(result[i].sum)]);
        	  	}
        	  }
          });
          data.addRows(chartdata);//아작스로 데이터 가져온거
          // Set chart options

          var options = {
          title: '광고수익',
          curveType: 'function',
          legend: { position: 'bottom' }
        };
        
          var chart = new google.visualization.LineChart(document.getElementById('columnchart_material'));
          chart.draw(data, options);
        

      }
      
     function selectHandler(e) {
		  var row = chart.getSelecttion()[0]["row"]
		  var column = chart.getSelecttion()[0]["column"]
		  console.log(chart.getSelecttion()); 
	}
      
  	function month() {
    	$('#columnchart_material').empty();
    	 google.charts.load('current', {'packages':['corechart','bar']}); //모든 차트 다 다운 받고싶을떄
         google.charts.setOnLoadCallback(drawsChart);
  	}	
  	
    function drawsChart(){	
  	  var data = new google.visualization.DataTable();
  	  data.addColumn('string', '몇월');
       data.addColumn('number', '건수');
        
        var chartdata=[];
        $.ajax({
      	  url: "monthMasterSales",  
      	  async : false,      //동기식, 아작스 실행하고 데이터 값이 와야 실행(동기)
      	  success : function(result) {
      	  	for(i=0; i<result.length; i++) {
      	  		chartdata.push([result[i].month+'월', parseInt(result[i].cnt)]);
      	  	}
      	  }
        });
        data.addRows(chartdata);//아작스로 데이터 가져온거
        var options = {'title':'광고건수',
                'width':900,
                'height':700,
                is3D: true,
                vAxis: { format:'0,000', gridlines: {count:10}} , //gridlines: 선이 생김
                colors: ['#e6693e', '#f6c7b6', '#ec8f6e', '#f3b49f', '#f6c7b6']};


		var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material'));
		chart.draw(data, options);
		
		
		
		      
    }
  	
    </script>
  </head>
  <body>
   <button type="button" onclick="drawsChart()" class="btn btn-secondary col-2" id="month">월별</button>
   <button type="button" onclick="drawChart()" class="btn btn-secondary col-2" id="drawChart">매출</button> 
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>