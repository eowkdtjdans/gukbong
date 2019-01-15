<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css" integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">

	<!-- Font Awesome CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta charset="utf-8">
   <meta name="author" content="Kodinger">
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <title>이메일 인증</title>
   <link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
   
   
<script>

	function findPwdAndUpdate(frm) {
		var certifyCode = frm.certifyCode.value;
		var findPwdEmailCheck = "${findPwdEmailCheck}";
		var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;
		
		var m_pwd = frm.m_pwd.value;
		var m_pwd2 = frm.m_pwd2.value;
		 if(frm.m_pwd.value == "" || frm.m_pwd.value == null){
			   alert("변경할 비밀번호를 기입하세요.");
				frm.m_pwd.value="";
				frm.m_pwd2.value="";
				frm.m_pwd.focus();
				return false; 
	   } else if (frm.m_pwd.value.length<8 ) {
			alert("비밀번호를 8~16자리로 설정해주세요.");
        	frm.m_pwd.value = ""; 
        	frm.m_pwd2.value = ""; 
			frm.m_pwd.focus();
			return false;
	   }
		else if (findPwdEmailCheck == certifyCode && m_pwd == m_pwd2) {
			alert("비밀번호가 변경되엇습니다.");
		frm.action = "../../PwdUpdate.do";
		frm.submit();
		} else {
			alert("인증번호 또는 비밀번호가 일치하지않습니다.");
			frm.certifyCode.value = "";
			frm.m_pwd.value = "";
			frm.m_pwd2.value = "";
			frm.certifyCode.focus();
			return false;
		}
	};
	function enterkey(event) {
		if(event.keyCode == 13) {
			$("#findBtn").click();
		}
	}
	
</script>
   
   
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
                     <h4 class="card-title">이메일 인증을 완료해주세요</h4>
                     <form method="POST" onsubmit="return false;" class="my-login-validation" id="findId">
                    
							<input id="m_id"  value="${member.m_id }" type="hidden" class="form-control" name="m_id">
                        
                        <div class="form-group" >
                           <label for="certifyCode">인증번호</label>
                           <input id="certifyCode" onkeypress="enterkey()"type="text" class="form-control" name="certifyCode" placeholder="인증번호를 입력하세요." required autofocus>
                        </div>
                        
                          <div class="form-group" >
                           <label for="m_pwd">변경할 비밀번호</label>
                           <input id="m_pwd" onkeypress="enterkey()"type="password" class="form-control" name="m_pwd" placeholder="비밀번호를 입력하세요." required autofocus>
                        </div>
                        
                        
                          <div class="form-group" >
                           <label for="m_pwd2">비밀번호 확인</label>
                           <input id="m_pwd2" onkeypress="enterkey()"type="password" class="form-control" name="m_pwd2" placeholder="비밀번호 확인" required autofocus>
                        </div>
                        
                        

                        <div class="form-group m-0">
                           <button type="submit" id="findBtn" class="btn btn-primary btn-block" onclick="findPwdAndUpdate(this.form)">
                             이메일로 비밀번호 찾기
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