 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>로그인</title>

<script>



	function login(frm) {
	var str = $("#form").serialize();
		$.ajax({
			async: true,
			type : "POST",
			dataType : "json",
			data : str,
			url : '../../loginMemberJson.do',
			success : function(data) {
				
				$.get("http://ipinfo.io", function(response){
					localStorage.ll_ip = response.ip;
					localStorage.ll_country = response.country;
					localStorage.ll_device = navigator.userAgent;
					localStorage.ll_result = "로그인 테스트";
				}, "jsonp");
				
				var ll_id = frm.m_id.value;
				var ll_ip = localStorage.ll_ip;
				var ll_country = localStorage.ll_country;
				var ll_device = localStorage.ll_device;
				
				if (data.cnt > 0) {
					$.ajax({
						type : "GET",
						url : "../logLogin.do?ll_id="+ll_id+"&ll_ip="+ll_ip+"&ll_country="+ll_country+"&ll_device="+ll_device+"&ll_result=로그인성공",
						success : function(){
							frm.action = "../../loginMember.do";
							frm.submit();
						}
					});
				} 
				else {
					$.ajax({
						type : "GET",
						url : "../logLogin.do?ll_id="+ll_id+"&ll_ip="+ll_ip+"&ll_country="+ll_country+"&ll_device="+ll_device+"&ll_result=로그인실패",
						success : function(){
							alert("아이디 또는 비밀번호가 일치하지않습니다. 다시 입력해주세요.");
							
							frm.m_id.value = "";
							frm.m_pwd.value = "";
							frm.m_id.focus();
						}
					});
				}
				
			}
		});

	};
	
	function getIpCountry(ll_result, ll_id) {
		$.get("http://ipinfo.io", function(response){
			var ll_ip = response.ip;
			var ll_country = response.country;
			var ll_device = navigator.userAgent;
			
			location.href = "../logLogin.do?ll_id="+ll_id+"&ll_ip="+ll_ip+"&ll_country="+ll_country+"&ll_device="+ll_device+"&ll_result="+ll_result;
			
		}, "jsonp");
	}
	
	
	function enterkey(event) {
		if(event.keyCode == 13) {
			$("#loginBtn").click();
		}
	}

	
</script>

	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>로그인페이지</title>
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
							<h4 class="card-title" style="text-align : center;">로그인</h4>
							<form onsubmit="return false"method="POST" class="my-login-validation" id="form"  >
								<div class="form-group">
									<label for="email">아이디</label>
									<input type="email" class="form-control" name="m_id" onkeypress="enterkey()" required autofocus>
								</div>
								
								<div class="form-group">
									<label for="password">비밀번호</label>
									<input type="password" class="form-control" name="m_pwd" onkeypress="enterkey()" required data-eye>
								</div>
								
								
								<div class="form-group m-0">
									 <button type="submit" id="loginBtn" class="btn btn-primary btn-block" onclick="login(this.form)" >
										Login
									</button> 
								</div>
								
					
								<a href="../../findPwdMember.do" class="float-right">
									비밀번호 찾기
								</a>
								
								<div class="mt-4 text-center">
									아이디가 없으십니까? <a href="../../insertMember.do">회원가입</a>
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