<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>아이디 찾기</title>
	<link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center align-items-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="../imgModal/logo.jpg" alt="bootstrap 4 login page">
					</div>
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">아이디 찾기</h4>
							<form method="POST" class="my-login-validation" action="../../FindIdMember.do">
								<div class="form-group">
									<label for="m_name">성함</label>
									<input id="m_name" type="text" class="form-control" name="m_name" required autofocus>

									<div class="form-text text-muted">
										By clicking "Reset Password" we will send a password reset link
									</div>
								</div>
								
									<div class="form-group">
									<label for="m_phone">전화번호</label>
									<input id="m_phone" type="text" class="form-control" name="m_id" required autofocus>

								</div>

								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										비밀번호 찾기
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2018 &mdash; 방국봉
					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
</html>