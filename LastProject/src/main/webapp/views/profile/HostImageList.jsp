 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>프로필 이미지 수정</title>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">

   <script src="http://maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<style>
body {font-family: Arial, Helvetica, sans-serif;}

.myImg {
  border-radius: 5px;
  cursor: pointer;
  transition: 0.3s;
}

.myImg:hover {opacity: 0.7;}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0);  
  background-color: rgba(0,0,0,0.9);  
 
}

/* Modal Content (image) */
.modal-content {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Caption of Modal Image */
#caption {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
  text-align: center;
  color: #ccc;
  padding: 10px 0;
  height: 150px;
}

/* Add Animation */
.modal-content, #caption {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
.close {
  position: absolute;
  top: 15px;
  right: 35px;
  color: #f1f1f1;
  font-size: 40px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,
.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}
</style>

<script>
function test(h_route, m_id) {
   var modal = document.getElementById('myModal');
   
   var img = document.getElementById(h_route);
   var modalImg = document.getElementById("img01");
   var captionText = document.getElementById("caption");
   
   var m_id_value = document.getElementById('m_id');
   var h_route_value = document.getElementById('h_route');
   
   m_id_value.value=m_id;
   h_route_value.value=h_route;
   
   modal.style.display = "block";
   modalImg.src = img.src;
   captionText.innerHTML = img.alt;
   
   var span = document.getElementsByClassName("close")[0];

   span.onclick = function() { 
     modal.style.display = "none";
   }
}
</script>

<script>
   function deleteHostImage(frm) {
      var m_id = frm.m_id.value;
      var h_route = frm.h_route.value;
      var str = $("#modalBtn").serialize();
   	
      frm.action = "../../deleteHostImage.do";
      frm.submit();
      return false;  
   }
   
   function updateMainHostImage(frm) {
	  var m_id = frm.m_id.value;
      var h_route = frm.h_route.value;
      var str = $("#modalBtn").serialize();
   
   	  frm.action = "../../updateMainHostImage.do";
   	  frm.submit();
   	  return false;
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
                          <h4>나의 이미지</h4>
                          <hr>
                      </div>
                  </div>


 <c:forEach var="hostImageList" items="${hostImageList}">
    <span style="width:250px; height:300px;" onclick="test('${hostImageList.h_route}', '${hostImageList.m_id}')">
       <img id="${hostImageList.h_route}" class="myImg" src="${hostImageList.h_route}" style="width:200px; height:250px;">
      </span>
</c:forEach>

<!-- The Modal -->
<form method="post" id="modalBtn">
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
   <div style="text-align : center;">
        <button class="btn btn-light" onclick="updateMainHostImage(this.form)">대표이미지 등록</button>
        <button class="btn btn-light" onclick="deleteHostImage(this.form)">이미지 삭제</button>
        <div>
         <input id="m_id" type="hidden" class="form-control" name="m_id">
         <input id="h_route" type="hidden" class="form-control" name="h_route"> 
         </div>
          
  </div>
  <div id="caption"></div>
</div>
</form>

</div>
</div>
</div>
</div>
</div>
</section>


</body>
</html>