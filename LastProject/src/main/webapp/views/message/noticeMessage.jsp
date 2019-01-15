<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>쪽지 실시간 알림</title>

<script type="text/javascript">
	function noticeMessage() {
		var noticeMessage = $("#noticeMessage").serialize();
		var receive_receiver =$("#receive_receiver").val();
		alert(noticeMessage);
		//$("#noticeMessageCount").append("${member.m_id}");
		$("#noticeMessageCount").append(receive_receiver);
	 	
	 	/*  $.ajax({
			async : true,
			type : "GET",
			dataType : "json",
			data : noticeMessage,
			url : "../../noticeMessageJson.do",
			success : function(data) {
				if (data.cnt > 0) {
					$("#noticeMessageCount").append(data.cnt);
					
					setInteval(function() {
						noticeMessage()
					}, 5000);
		 
				}
			}
			
			
		});    */
	}

</script>	
	
</head>
<body onload="noticeMessage(this.form)">
<form id="noticeMessage" method="GET">
	<input type="hidden" id="receive_receiver" name="receive_receiver" value="${member.m_id }" />
	<p id="noticeMessageCount"></p>
</form>	
	
</body>
</html>