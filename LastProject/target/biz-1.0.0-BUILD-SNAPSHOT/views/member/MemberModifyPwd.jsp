<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>비밀번호 변경</title>

<script>
	function ModifyPwd(frm) {
		var pwd = document.getElementById("m_pwd").value;
	 	var pwdModify = document.getElementById("pwdModify").value;
	 	
	 	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;

	 	var str = $("#ModifyPwd").serialize();
		alert("str : " + str);
		$.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : str,
			url : "../../MemberModifyPwdJson.do",
			success : function(data) {
				   if (data.cnt == 0) {
					   alert(data.cnt);
					   alert("기존 비밀번호가 일치하지않습니다. 다시 입력하세요.");
					   $("#m_id").focus();
					   $("#m_pwd").val("");
				   } else if(frm.pwdModify.value == "" || frm.m_pwd.value == null){
					   alert(data.cnt);
					   alert("변경할 비밀번호를 기입하세요.");
						frm.pwdModify.value="";
						frm.pwdModify.focus();
						return false; 
				   } else if (frm.pwdModify.value.length<8 || frm.pwdModify.value.length>16) {
					   alert(data.cnt);
						alert("비밀번호를 8~16자리로 설정해주세요.");
			        	frm.pwdModify.value = ""; 
						frm.pwdModify.focus();
						return false;
				   }  else {
					   alert(data.cnt);
					    alert("변경이 완료되었습니다.");
						frm.action = "../../ModifyPwdMember.do";
					    frm.submit();    
					    return false;
				   }
			}
		})
		
	};
		
</script>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>비밀번호 변경 페이지</title>
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
							<h4 class="card-title" style="text-align : center;">비밀번호 변경</h4>
							<form method="POST" class="my-login-validation" id="ModifyPwd">
									<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }" required autofocus>
								<div class="form-group">
									<label for="m_pwd">기존 비밀번호</label>
									<input id="m_pwd" type="password" class="form-control" name="m_pwd" required autofocus>
								</div>

								<div class="form-group">
									<label for="pwdModify">변경할 비밀번호</label>
									<input id="pwdModify" type="password" class="form-control" name="pwdModify" required data-eye>
								</div>
								
								<div class="form-group m-0">
									<button type="button" class="btn btn-primary btn-block" onclick="ModifyPwd(this.form)">
										비밀번호 변경
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