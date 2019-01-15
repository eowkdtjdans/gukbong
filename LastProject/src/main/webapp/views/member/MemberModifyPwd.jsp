<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>핸드폰번호 변경</title>

<script>
	function ModifyPwd(frm) {
		var pwd = document.getElementById("m_pwd").value;
	 	var pwdModify = document.getElementById("pwdModify").value;
	 	
	 	var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/;

	 	var str = $("#ModifyPwd").serialize();
		$.ajax({
			async : true,
			type : "POST",
			dataType : "json",
			data : str,
			url : "../../MemberModifyPwdJson.do",
			success : function(data) {
				   if (data.cnt == 0) {
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
		
	function enterkey(event) {
		if(event.keyCode == 13) {
			$("#modifyBtn").click();
		}
	}
</script>
	
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>비밀번호 변경 페이지</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
</head>

<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
		      <a href="../../sub2.do" class="list-group-item list-group-item-action">메인페이지</a>
              <a href="../../myProfile.do" class="list-group-item list-group-item-action">마이 프로필</a>
              <a href="../../getReceiveMessageList.do" class="list-group-item list-group-item-action">받은 쪽지함</a>
              <a href="../../getSendMessageList.do" class="list-group-item list-group-item-action">보낸 쪽지함</a>
              <a href="../../insertProfile.do" class="list-group-item list-group-item-action">프로필 수정</a>
              <a href="../../ModifyPwdMember.do" class="list-group-item list-group-item-action active">비밀번호 변경</a>
              <a href="../../ModifyPhoneMember.do" class="list-group-item list-group-item-action">핸드폰 변경</a>
              <a href="../../ModifyAddressMember.do" class="list-group-item list-group-item-action">주소 변경</a>
              <a href="../../profileImageInsert.do" class="list-group-item list-group-item-action">이미지 업로드</a>
              <a href="../../profileImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">프로필 이미지 관리</a>
              <a href="../../HostImageList.do?m_id=${member.m_id }" class="list-group-item list-group-item-action">호스트 이미지 관리</a>
              <a href="#" class="list-group-item list-group-item-action">내 글</a>
              <a href="#" class="list-group-item list-group-item-action">내 댓글</a>
              
              
            </div> 
		</div>
		
		
		<div class="col-md-9">
		    <div class="card">
		        <div class="card-body">
		            <div class="row">
		                <div class="col-md-12">
		                    <h4>비밀번호 변경</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form method="POST" onsubmit="return false;"class="my-login-validation" id="ModifyPwd">
		                    	<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
                              <div class="form-group row">
                                <label for="m_pwd" class="col-4 col-form-label">기존 비밀번호</label> 
                                <div class="col-8">
                                	<input onkeypress="enterkey()"id="m_pwd" name="m_pwd" type="password" class="form-control" >
                                </div>
                              </div>
                              <div class="form-group row">
                               <label for="pwdModify" class="col-4 col-form-label">변경할 비밀번호</label>
                                <div class="col-8">
                                  	<input onkeypress="enterkey()"id="pwdModify" name="pwdModify" type="password" class="form-control" >
                                </div>
                              </div>
                              
                              <div class="form-group row">
                               		<button type="submit" id="modifyBtn"class="btn btn-primary btn-block" onclick="ModifyPwd(this.form)">
										비밀번호 변경
									</button>
                              </div>
                            
                          
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>