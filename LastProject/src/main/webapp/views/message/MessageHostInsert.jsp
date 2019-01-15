 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>쪽지 작성</title>

<script>
	
	function insertMessage(frm) {
		frm.action = "../../insertHostMessage.do";
		frm.submit();
	}

z

</script>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>쪽지 보내기</title>
	<link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title" style="text-align : center;">쪽지 보내기${message_receiver }</h4>
							<form method="POST" class="my-login-validation" id="form">
								<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">	
								<input id="message_sender" name="message_sender" type="hidden" class="form-control" value="${member.m_id }">	
								<input id="message_receiver" name="message_receiver" type="hidden" class="form-control" value="${message_receiver }">	
								<div class="form-group">
									<label for="message_title" style="text-align : center;">제목</label>
									<textarea rows="1" cols="10" id="message_title" name="message_title" class="form-control"></textarea>
								</div>
								
								<div class="form-group">
									<label for="message_content" style="text-align : center">내용</label>
									<textarea rows="5" cols="10" id="message_content" name="message_content"  class="form-control"></textarea>
								</div>
								
								
								<div class="form-group m-0">
									<button type="button" class="btn btn-primary btn-block" onclick="insertMessage(this.form)">
										쪽지 보내기
									</button>
								</div>
								
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2018 &mdash; 국봉쓰
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
</html>