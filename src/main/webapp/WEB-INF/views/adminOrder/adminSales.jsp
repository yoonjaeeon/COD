<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '부서');
		data.addColumn('number', '단위(만원)');
		var chartdata = [];
		$.ajax({
			url : "getChartData",
				async : false, //동기식으로 처리한다. 
			success : function(result){
				for(i=0; i<result.length; i++){
					chartdata.push([result[i].name, parseInt(result[i].cnt)]);
				}
			}
		});
		data.addRows(chartdata);

		// Set chart options
		var options = {
			'title' : '매출현황',
			'width' : 400,
			'height' : 300,
			is3D : true,
			legend : {
				position : 'bottom'
			},
			vAxis : {
				format : '#,###%'
			},
			colors : [ 'black', 'green', 'blue', 'yellow', 'black' ]
		};
		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document
				.getElementById('chart_div'));
		chart.draw(data, options);

		google.visualization.events.addListener(chart, 'select', selectHandler);

		function selectHandler(e) {
			alert('A table row was selected');
			var row = chart.getSelection()[0].row
			var column = chart.getSelection()[0].column
			console.log(data[0].row);

		}
	}
</script>
</head>
<div>
<h1>매출 페이지</h1>
<input type="date"> ~ <input type="date"> <button>선택</button><br>
월별 매출 내역 
<select>
<%-- <c:forEach var="" items=""></c:forEach> --%>
<option selected>월 선택</option><br>
</select><br>
연별 매출 내역
<select>
<%-- <c:forEach></c:forEach> --%>
<option selected>년 선택</option>
</select><br>
<button>일별</button><button>주별</button><button>월별</button>
 <div id="chart_div" style="width: 800px; height: 500px;"></div>
 <div class="col-xl-8 col-lg-7">
              <div class="card shadow mb-4">
                <!-- Card Header - Dropdown -->
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                  <h6 class="m-0 font-weight-bold text-primary">Earnings Overview</h6>
                  <div class="dropdown no-arrow">
                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
                      <div class="dropdown-header">Dropdown Header:</div>
                      <a class="dropdown-item" href="#">Action</a>
                      <a class="dropdown-item" href="#">Another action</a>
                      <div class="dropdown-divider"></div>
                      <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                  </div>
                </div>
                <!-- Card Body -->
                <div class="card-body">
                  <div class="chart-area"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
                    <canvas id="myAreaChart" style="display: block; width: 507px; height: 320px;" width="507" height="320" class="chartjs-render-monitor"></canvas>
                  </div>
                </div>
              </div>
            </div>



</div>