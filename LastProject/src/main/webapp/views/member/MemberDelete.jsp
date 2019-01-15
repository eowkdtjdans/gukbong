<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>회원탈퇴</title>

<script>
	//로그인 값이 있던 없던 그냥 넘어가니까 JSON을 사용해서 데이터베이스에 있는지 체크하기.
	function DeleteMember(frm) {
	
	 	var str = $("#DeleteMember").serialize();
		$.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : str,
			url : "../../MemberDeleteJson.do",
			success : function(data) {
				if (data.cnt > 0) {
					alert("회원탈퇴가 완료되었습니다.");
					frm.action = "../../DeleteMember.do";
				 	frm.submit();   
				 	return false;
				} else {
					alert("기존에 등록된 핸드폰번호가 일치하지않습니다. 다시 확인해주세요.");
					frm.m_phone.value = "";
					frm.modifyM_phone.value = "";
					frm.m_phone.focus();
				}
			}
		})
		
	};
		
	function enterkey(event) {
		if(event.keyCode == 13) {
			$("#deleteBtn").click();
		}
	}
	
</script>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>회원탈퇴 페이지</title>
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
							<h4 class="card-title" style="text-align : center;">회원 탈퇴</h4>
							<form onsubmit="return false;"method="POST" class="my-login-validation" id="DeleteMember">
							<label for="id">아이디</label>
									<input id="m_id" type="text" class="form-control" name="m_id" value="${member.m_id }" required autofocus>
								<div class="form-group">
									<label for="password">비밀번호</label>
									<input onkeypress="enterkey()"id="m_pwd" type="password" class="form-control" name="m_pwd" required data-eye>
								</div>
								
								<div class="form-group">
									<label for="phone">핸드폰 번호</label>
									<input onkeypress="enterkey()"id="m_phone" type="text" class="form-control" name="m_phone" required autofocus>
								</div>

								
								<div class="form-group m-0">
									<button type="submit" id="deleteBtn"class="btn btn-primary btn-block" onclick="DeleteMember(this.form)">
										회원 정보 삭제
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