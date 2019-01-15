<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 이미지 수정</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">

	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script>
	$(function(){
		$("#profileModal").click(function(){
			$("#profile").modal({
				backdrop: 'static',
				keyboard: false
			});
		});
		
		$("#uploadProfileImg").change(function(){
			var imgFile = $("#uploadProfileImg").val();
			var imgFileExtendArray = imgFile.split('.');
			var imgFileLength = $("#uploadProfileImg").val().length;
			var imgFileExtend = imgFileExtendArray[1];
			
			var size = document.getElementById("uploadProfileImg").files[0].size;
			
			if(imgFileExtend=="jpg" || imgFileExtend=="png" || imgFileExtend=="gif" || imgFileExtend=="jpeg" || imgFileExtend=="JPG" || imgFileExtend=="PNG" || imgFileExtend=="GIF" || imgFileExtend=="JPEG") {
				if (size <= 20971520) {
					$("#profileWrong").remove();
					$("#profileImgBtn").prop("disabled", false);
				} else {
					$("#profileWrong").remove();
					$("<div id='typeWrong'><b>파일 용량이 너무 큽니다.</b></div>").insertAfter("#uploadProfileImg");
				}
			} else {
				$("#profileWrong").remove();
				$("#profileImgBtn").prop("disabled", true);
				$("<div id='profileWrong'><b>파일 유형이 잘못되었습니다.</b></div>").insertAfter("#uploadProfileImg");
			}
		});
		
		$("#hostModal").click(function(){
			$("#host").modal({
				backdrop: 'static',
				keyboard: false
			});
		});
		
		$("#uploadHostImg").change(function(){
			var imgFile = $("#uploadHostImg").val();
			var imgFileLength = $("#uploadHostImg").val().length;
			var imgFileExtend = imgFile.substring(imgFileLength - 3);
			
			if(imgFileExtend=="jpg" || imgFileExtend=="png" || imgFileExtend=="gif" || imgFileExtend=="jpeg") {
				$("#hostWrong").remove();
				$("#hostImgBtn").prop("disabled", false);
			} else {
				$("#hostWrong").remove();
				$("#hostImgBtn").prop("disabled", true);
				$("<div id='hostWrong'><b>파일 유형이 잘못되었습니다.</b></div>").insertAfter("#uploadHostImg");
			}
		});
		
	});
</script>
<script>
function uploadProfile(profileFrm) {
	profileFrm.action="/uploadProfileImg.do";
	profileFrm.submit();
}
function uploadHost(hostFrm) {
	hostFrm.action="/uploadHostImg.do";
	hostFrm.submit();
}
</script>



</head>

<body>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!------ Include the above in your HEAD tag ---------->
<section>
<div class="container">
	<div class="row">
		<div class="col-md-3 ">
		     <div class="list-group ">
		      <a href="../../sub2.do" class="list-group-item list-group-item-action">메인페이지</a>
              <a href="../../myProfile.do" class="list-group-item list-group-item-action">마이 프로필</a>
              <a href="../../getReceiveMessageList.do" class="list-group-item list-group-item-action">받은 쪽지함</a>
              <a href="../../getSendMessageList.do" class="list-group-item list-group-item-action">보낸 쪽지함</a>
              <a href="#" class="list-group-item list-group-item-action">프로필 수정</a>
              <a href="../../ModifyPwdMember.do" class="list-group-item list-group-item-action">비밀번호 변경</a>
              <a href="../../ModifyPhoneMember.do" class="list-group-item list-group-item-action">핸드폰 변경</a>
              <a href="../../ModifyAddressMember.do" class="list-group-item list-group-item-action">주소 변경</a>
              <a href="../../profileImageInsert.do" class="list-group-item list-group-item-action active">이미지 업로드</a>
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
		                    <h4>이미지 업로드</h4>
		                    <hr>
		                </div>
		            </div>
		            <div class="row">
		                <div class="col-md-12">
		                    	<input id="m_id" type="hidden" class="form-control" name="m_id" value="${member.m_id }">
                             
                             
                              <div class="form-group row">
                                <label for="profile_img" class="col-4 col-form-label">프로필 이미지 업로드</label> 
                                <div class="col-8">
                                	<button type="button" class="btn btn-primary btn-block" id="profileModal" >ADD PROFILE IMG+</button>
                                </div>
                              </div>
                              
                              <form id="profileFrm" name="profileFrm" method="POST" enctype="multipart/form-data">
							<div class="modal fade" id="profile">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4>Upload File</h4>
											<button type="button" class="close" data-dismiss="modal">×</button>
										</div>
										<div class="modal-body">
											<b>Select Image: </b><br>
											<input type="file" id="uploadProfileImg" name="profileImg"/>
											
											<ul>
												<li>이미지는 JPG, JPEG, GIF, PNG 타입만 허용됩니다.</li>
												<li>이미지는 최대 20MB까지 허용됩니다.</li>
												<li>Script Blockers를 사용할경우 이미지 업로드 기능이 안될 수 있습니다.</li>
											</ul>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" id="profileImgBtn" disabled="disabled" onclick="uploadProfile(this.form)">업로드</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											
											<input type="hidden" value="${member.m_id}" name="m_id">
										</div>
									</div>
								</div>
							</div>
							</form>
                            
                            <div class="form-group row">
                               	<label for="home_img"  class="col-4 col-form-label">호스트 이미지 업로드</label>
                                <div class="col-8">
                                	<button type="button" class="btn btn-primary btn-block" id="hostModal" >ADD HOST IMG+</button>
                                </div>
                              </div>
                            
                          	 <form id="hostFrm" name="hostFrm" method="POST" enctype="multipart/form-data">
							<div class="modal fade" id="host">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4>Upload File</h4>
											<button type="button" class="close" data-dismiss="modal">×</button>
										</div>
										<div class="modal-body">
											<b>Select Image: </b><br>
											<input type="file" id="uploadHostImg" name="uploadHostImg"/>
											
											<ul>
												<li>이미지는 JPG, JPEG, GIF, PNG 타입만 허용됩니다.</li>
												<li>이미지는 최대 20MB까지 허용됩니다.</li>
												<li>Script Blockers를 사용할경우 이미지 업로드 기능이 안될 수 있습니다.</li>
											</ul>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" id="hostImgBtn" disabled="disabled" onclick="uploadHost(this.form)">업로드</button>
											<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
											
											<input type="hidden" value="${member.m_id}" name="m_id">
										</div>
									</div>
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
<script src="js/jquery.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/my-login.js"></script>
	
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</section>
</body>
</html>