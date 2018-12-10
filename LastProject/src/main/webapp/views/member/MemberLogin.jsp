 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>회원가입</title>

<script>
	//로그인 값이 있던 없던 그냥 넘어가니까 JSON을 사용해서 데이터베이스에 있는지 체크하기.
	function login(frm) {
		frm.action = "../../loginMember.do"; //로그인 작업 처리
		frm.submit();

	};
		
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
							<form method="POST" class="my-login-validation">
								<div class="form-group">
									<label for="email">아이디</label>
									<input id="m_id" type="email" class="form-control" name="m_id" required autofocus>
								</div>

								<div class="form-group">
									<label for="password">비밀번호
										<a href="../../findPwdMember.do" class="float-right">
											비밀번호 찾기
										</a>
									</label>
									<input id="m_pwd" type="password" class="form-control" name="m_pwd" required data-eye>
								</div>

								<div class="form-group m-0">
									<button type="button" class="btn btn-primary btn-block" onclick="login(this.form)">
										Login
									</button>
								</div>
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