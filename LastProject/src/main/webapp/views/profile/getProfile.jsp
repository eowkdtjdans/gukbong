<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function profileModify() {
		location.href = "../../insertProfile.do";
	}
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
              <a href="../../myProfile.do" class="list-group-item list-group-item-action active">마이 프로필</a>
              <a href="../../getReceiveMessageList.do" class="list-group-item list-group-item-action">받은 쪽지함</a>
              <a href="../../getSendMessageList.do" class="list-group-item list-group-item-action">보낸 쪽지함</a>
              <a href="../../insertProfile.do" class="list-group-item list-group-item-action">프로필 수정</a>
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
		                    <h4>Your Profile</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    <form>
                                <div class="col-8" >  <!-- style=" text-align:center; margin-left: 120px -->
                                <img src="${profile.p_route }" style="width:250px;" class="rounded" /> <!--  -->
                                 </div> 
                                   <hr />
                                    <div class="col-8" >  <!-- style=" text-align:center; margin-left: 120px -->
                                <img src="${hostImg.h_route }" style="width:250px;" class="rounded" /> <!--  -->
                                 </div> 
                                   <hr />
                              <div class="form-group row">
                                <label for="username" class="col-4 col-form-label">ID</label> 
                                <div class="col-8">
                                <p>${member.m_id }</p>
                                </div>
                              </div>
                             	 <hr />
                              <div class="form-group row">
                                <label for="name" class="col-4 col-form-label">이름</label> 
                                <div class="col-8">
                                  <p>${member.m_name }</p>
                                </div>
                              </div>
                                 <hr />
                              <div class="form-group row">
                                <label for="lastname" class="col-4 col-form-label">취미</label> 
                                <div class="col-8">
                                  <p>${profile.p_hobby }</p>
                                </div>
                              </div>
                                 <hr />
                              <div class="form-group row">
                                <label for="text" class="col-4 col-form-label">사용가능한 언어</label> 
                                <div class="col-8">
                                 <p>${profile.p_language }</p>
                                </div>
                              </div>
                                 <hr />
                              <div class="form-group row">
                                <label for="select" class="col-4 col-form-label">직업</label> 
                                <div class="col-8">
                                  <p>${profile.p_job }</p>
                                </div>
                              </div>
                                 <hr />
                              <div class="form-group row">
                                <label for="email" class="col-4 col-form-label">나에 대해서</label> 
                                <div class="col-8">
                                 <p>${profile.p_aboutme }</p>
                                </div>
                              </div>
                                 <hr />
                              <div class="form-group row">
                                <label for="website" class="col-4 col-form-label">목적</label> 
                                <div class="col-8">
                                      <p>${profile.p_purpose }</p>
                                </div>
                              </div>
                                 <hr />
                              <div class="form-group row">
                                <label for="publicinfo" class="col-4 col-form-label">방문했던 국가</label> 
                                <div class="col-8">
                                 <p>${profile.p_visitcountry }</p>
                                </div>
                              </div>
                                <hr />
                              <div class="form-group row">
                                <div class="offset-4 col-8">
                                  <button name=button type="button" class="btn btn-primary" onclick="profileModify()">프로필 수정하기</button>
                                </div>
                              </div>
                            </form>
		                </div>
		            </div>
		            
		        </div>
		    </div>
		</div>
	</div>
</div>
</body>
</html>