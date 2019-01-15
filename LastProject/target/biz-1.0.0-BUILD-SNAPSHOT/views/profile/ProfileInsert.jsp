 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>프로필 기입 및 수정</title>

<script>
	function insertProfile(frm) {
		
		 var str = $("#form").serialize();
	 	
		 $.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : str,
			url : "../../insetProfileJson.do",
			success : function(data) {
				if (data.cnt == 0) {
					alert("data.cnt : " + data.cnt); 
					 frm.action = "../../insertProfile.do";
					frm.submit();
			 	} else {
					alert("data.cnt : " + data.cnt);
					frm.action = "../../modifyProfile.do";
					frm.submit(); 
					return false;
				}
			}
		
		
		
		
		});  
		
		
	};
	
</script>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>프로필 기입 및 수정</title>
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
							<h4 class="card-title" style="text-align : center;">프로필 기입 및 수정</h4>
							<form method="POST" class="my-login-validation" id="form">
	
								<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">	
								
								<div class="form-group">
									<label for="hobby" style="text-align : center;">취미</label>
									<textarea rows="5" cols="10" id="p_hobby" name="p_hobby" class="form-control"></textarea>
								</div>
								
								<div class="form-group">
									<label for="langauge" style="text-align : center;">사용가능한 언어</label>
									<textarea rows="5" cols="10" id="p_langauge" name="p_langauge"  class="form-control"></textarea>
								</div>
								
								<div class="form-group">
									<label for="job" style="text-align : center;">직업</label>
									<textarea rows="5" cols="10" id="p_job"  name="p_job" class="form-control"></textarea>
								</div>
								
								<div class="form-group">
									<label for="aboutme" style="text-align : center;">자기 소개</label>
									<textarea rows="5" cols="10" id="p_aboutme" name="p_aboutme" class="form-control"></textarea>
								</div>
								
								<div class="form-group">
									<label for="purpose" style="text-align : center;">목적</label>
									<textarea rows="5" cols="10" id="p_purpose"  name="p_purpose" class="form-control"></textarea>
								</div>
								
								<div class="form-group">
									<label for="visitcountry" style="text-align : center;">방문했던 나라</label>
									<textarea rows="5" cols="10" id="p_visitcountry"   name="p_visitcountry" class="form-control"></textarea>
								</div>
								
								<div class="form-group m-0">
									<button type="button" class="btn btn-primary btn-block" onclick="insertProfile(this.form)">
										프로필 등록
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