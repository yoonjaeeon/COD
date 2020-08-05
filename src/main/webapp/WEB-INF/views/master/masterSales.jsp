<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script type="text/javascript">
     
      google.charts.load('current', {'packages':['corechart','bar']}); //모든 차트 다 다운 받고싶을떄
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

          var options = {'title':'광고수익',
                         'width':800,
                         'height':600,
                         is3D: true,
                         vAxis: { format:'0,000', gridlines: {count:10}} , //gridlines: 선이 생김
                         colors: ['#e6693e', '#f6c7b6', '#ec8f6e', '#f3b49f', '#f6c7b6']};

        //var chart = new google.charts.Bar(document.getElementById('columnchart_material')); {'packages':['corechart','bar']} 써야 나옴
		
        //var date = new google.visualization.DataTable(jsonData);
        
        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material'));
        chart.draw(data, options);
        
        google.visualization.events.addListener(chart, 'select', selectHandler);

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
      	  		chartdata.push([result[i].month, parseInt(result[i].cnt)]);
      	  	}
      	  }
        });
        data.addRows(chartdata);//아작스로 데이터 가져온거
        var options = {'title':'광고건수',
                'width':800,
                'height':600,
                is3D: true,
                vAxis: { format:'0,000', gridlines: {count:10}} , //gridlines: 선이 생김
                colors: ['#e6693e', '#f6c7b6', '#ec8f6e', '#f3b49f', '#f6c7b6']};


		var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material'));
		chart.draw(data, options);
		
		google.visualization.events.addListener(chart, 'select', selectHandler);
		
		      
    }
  	
    </script>
  </head>
  <body>
   <div><button type="button" onclick="month()" class="col-2" id="month">월별</button> </div>
    <div><button type="button" onclick="drawChart()" class="col-2" id="drawChart">매출</button> </div>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>