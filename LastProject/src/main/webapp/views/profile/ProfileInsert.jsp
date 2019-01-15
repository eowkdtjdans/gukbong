<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
              <a href="../../insertProfile.do" class="list-group-item list-group-item-action active">프로필 수정</a>
              <a href="../../ModifyPwdMember.do" class="list-group-item list-group-item-action">비밀번호 변경</a>
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
		                    <h4>프로필</h4>
		                    <hr>
		                </div>
		            </div>
		            
		            
		            <div class="row">
		                <div class="col-md-12">
		                 <form method="POST" class="my-login-validation" id="form">
		                    	<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
		                    	<input id="p_route" type="hidden" class="form-control" name="p_route" value="${profile.p_route }">
                             
                               <div class="form-group row">
                                <label for="p_hobby" class="col-4 col-form-label">취미</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_hobby" name="p_hobby" class="form-control">${profile.p_hobby }</textarea>
                                </div>
                              </div>
                        	   
                              <div class="form-group row">
                                <label for="p_language" class="col-4 col-form-label">사용가능한 언어</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_language" name="p_language" class="form-control">${profile.p_language }</textarea>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="p_job" class="col-4 col-form-label">직업</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_job" name="p_job" class="form-control">${profile.p_job }</textarea>
                                </div>
                              </div>
                           
                              <div class="form-group row">
                                <label for="p_aboutme" class="col-4 col-form-label">자기소개</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="aboutme" name="p_aboutme" class="form-control">${profile.p_aboutme }</textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="p_purpose" class="col-4 col-form-label">목적</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_purpose" name="p_purpose" class="form-control">${profile.p_purpose }</textarea>
                                </div>
                              </div>
                        
                              <div class="form-group row">
                                <label for="p_visitcountry" class="col-4 col-form-label">방문했던 국가</label> 
                                <div class="col-8">
                                	<textarea rows="5" cols="10" id="p_visitcountry" name="p_visitcountry" class="form-control">${profile.p_visitcountry }</textarea>
                                </div>
                              </div>
                        
                              
                               <div class="form-group m-0">
		                          	<button type="button" class="btn btn-primary btn-block" onclick="insertProfile(this.form)">
										프로필 등록
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