 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<<<<<<< HEAD
<title>회원가입</title>
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: powderblue; }
	.center { text-align: center; }
</style>

<script>
	//로그인 값이 있던 없던 그냥 넘어가니까 JSON을 사용해서 데이터베이스에 있는지 체크하기.

    $("#login").submit(function(){ //문서의 모든 form이 submit될때
            alert("앙기모띠"); // password라고 경고
            
    });
		
</script>

=======
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>My Login Page</title>
	<link rel="stylesheet" type="text/css" href="../bootstrapModal/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="../cssModal/my-login.css">
>>>>>>> refs/remotes/origin/master
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
							<form method="POST" class="my-login-validation" action="../../loginMember.do">
								<div class="form-group">
									<label for="email">아이디</label>
									<input id="m_id" type="email" class="form-control" name="m_id" required autofocus>
								</div>

								<div class="form-group">
									<label for="password">비밀번호
										<a href="forgot.html" class="float-right">
											비밀번호 찾기
										</a>
									</label>
									<input id="m_pwd" type="password" class="form-control" name="m_pwd" required data-eye>
								</div>

<<<<<<< HEAD
<div class="container" id="container"> <!--id="login"  -->
<form method="post" action="../../loginMember.do">
   <table class="table table-hover" style="text-align : center; border : 1px solid #dddddd" >
<thead>
   <tr>
      <th colspan="3">
         <h3 class="text-center" >로그인</h3>
      </th>
   </tr>
</thead>
=======
								<!-- <div class="form-group">
									<div class="custom-checkbox custom-control">
										<input type="checkbox" name="remember" id="remember" class="custom-control-input">
										<label for="remember" class="custom-control-label">Remeber Me</label>
									</div>
								</div> -->
>>>>>>> refs/remotes/origin/master

<<<<<<< HEAD
<tbody>
  
   <tr>
      <td style="width: 110px;">아이디</td>
	      <td>
	      	<input type="text" class="form-control" id="m_id" name="m_id" maxLength="20" />
	      </td>
   </tr>
     
   <tr>
      <td style="width: 110px;">비밀번호</td>
	      <td>
	      	<input type="text" class="form-control" id="m_pwd" name="m_pwd" maxLength="20" />
	      </td>
   </tr>
     
   
   <tr>
      <td colspan="3">
      <input  type="submit" class="btn btn-outline-secondary pull-right"  value="로그인" id="login"/> 
      </td>
   </tr>
   
  	 </tbody>
         
     </table>
   </form>
</div>
=======
								<div class="form-group m-0">
									<button type="submit" class="btn btn-primary btn-block">
										Login
									</button>
								</div>
								<div class="mt-4 text-center">
									아이디가 없으십니까? <a href="register.html">Create One</a>
								</div>
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2017 &mdash; Your Company 
					</div>
				</div>
			</div>
		</div>
	</section>
>>>>>>> refs/remotes/origin/master

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
</html>