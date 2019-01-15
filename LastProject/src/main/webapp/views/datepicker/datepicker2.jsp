<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="public/theme/css/t-datepicker.min.css">
<link rel="stylesheet" href="public/theme/css/themes/t-datepicker-bluegrey.css">
<!-- blue, bluegrey, cyan, green, lime, main, orange, purple, teal, yellow -->

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="public/theme/js/t-datepicker.min.js"></script>

<script type="text/javascript">
	/* datepicker 전체 생성 */
	$(document).ready(function(){
		$('.t-datepicker').tDatePicker({});
	});
	
	/* datepicker가 많을때 하나만 생성 */
	$(document).ready(function(){
		$('.t-datepicker').tDatePicker({
			// Global options
		});
		$('.class_a').tDatePicker({
			// Options for .class_a
		});
		$('.class_b').tDatePicker({
			// Options for .class_b
		});
	});
	
	/* picker만 생성 */
	$(document).ready(function(){
		$('.t-datepicker').tDatePicker({
			autoClose: false,
			limitNextMonth: 12,
			numCalendar : 2,
			dateRangesHover: true
		});  
	});
	
	
</script>
</head>
<body>

	<div class="t-datepicker">
		<div class="t-check-in"></div>
		<div class="t-check-out"></div>
	</div>
	
	
	<div class="t-datepicker">
		<div class="t-check-in t-picker-only"></div>
	</div>

</body>
</html>