<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<link href="css/demo.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="/SRC2/jbar/jqbar.css" />
</head>

<body>

<div>
	<div id="bar-1"></div>
	<div id="bar-2"></div>
	<div id="bar-3"></div>
	<div id="bar-4"></div>
	<div id="bar-5"></div>
	<div id="bar-6"></div>
</div>


<br/><br/><br/><br/>
<div class="bars">
	<div id="bar-7"></div>
	<div id="bar-8"></div>
	<div id="bar-9"></div>
	<div id="bar-10"></div>
	<div id="bar-11"></div>
	<div id="bar-12"></div>
</div>

<script src="/SRC2/jbar/js/jquery.min.js" type="text/javascript"></script>
<script src="/SRC2/jbar/js/jqbar.js" type="text/javascript"></script>
<script type="text/javascript">

	$(document).ready(function () {
		$('#bar-1').jqbar({ label: 'ASP.NET', value: 99, barColor: '#D64747' });
		$('#bar-2').jqbar({ label: 'C#', value: 99, barColor: '#FF681F' });
		$('#bar-3').jqbar({ label: 'Javascript', value: 90, barColor: '#ea805c' });
		$('#bar-4').jqbar({ label: 'HTML5', value: 50, barColor: '#88bbc8' });
		$('#bar-5').jqbar({ label: 'CSS3', value: 60, barColor: '#939393' });
		$('#bar-6').jqbar({ label: 'jQuery', value: 70, barColor: '#3a89c9' });
		$('#bar-7').jqbar({ label: 'Wal', value: 90, barColor: '#D64747', orientation: 'v' });
		$('#bar-8').jqbar({ label: 'Ohi', barColor: '#FF681F', value: 70, orientation: 'v' });
		$('#bar-9').jqbar({ label: 'Song', barColor: '#ea805c', value: 50, orientation: 'v' });
		$('#bar-10').jqbar({ label: 'Pisho', barColor: '#88bbc8', value: 90, orientation: 'v' });
		$('#bar-11').jqbar({ label: 'Mara', barColor: '#939393', value: 70, orientation: 'v' });
		$('#bar-12').jqbar({ label: 'Dagha', barColor: '#3a89c9', value: 50, orientation: 'v' });
	});
</script>


</body>
</html>
