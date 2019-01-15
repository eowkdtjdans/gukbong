<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <meta charset="utf-8"> 
  <title>BizPage Bootstrap Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">
 

  <!-- Favicons -->
  <link href="views/img/favicon.png" rel="icon">
  <link href="views/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,700,700i|Montserrat:300,400,500,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="views/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="views/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="views/lib/animate/animate.min.css" rel="stylesheet">
  <link href="views/lib/ionicons/css/ionicons.min.css" rel="stylesheet">
  <link href="views/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="views/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="views/css/style.css" rel="stylesheet">
  
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?v=3&sensor=false&libraries=places&callback=initAutocomplete&key=AIzaSyAfB2qQnvAuU2YFFqi8hrPWfjJNyxl5kWc" async defer></script>

  <!-- =======================================================
    Theme Name: BizPage
    Theme URL: https://bootstrapmade.com/bizpage-bootstrap-business-template/
    Author: BootstrapMade.com
    License: https://bootstrapmade.com/license/
  ======================================================= -->
  
<style>
	body{
		padding-top: 70px;
	}
	a{
		color:#5e7e9b;
	}
	#profileImage { width: 80px; height: 80px;} 
	#profileImage2 { width: 60px; height: 60px;}
	td{
		padding-right: 30px;
	}
	#tableDiv{
		width: 1100px;
		height: 400px;
	}


</style> 

<script>
function login_chk(frm){
	if("${m_id}" == "") {
		alert("로그인이 필요한 서비스입니다.");
		location.href="";  /* 로그인을 안하고 댓글 쓰려고할 때 로그인페이지로 이동 */
	} else{
		if (frm.lc_content.value == ""){
			alert("댓글을 입력해주세요");
			alert(frm.lc_content.value);
			frm.lc_content.focus();
			return false;
		} else {
			alert("컨트롤러 이동");
			frm.action = "../insertLocalAdviceComment.do?l_idx=${getLocalAdvice.l_idx }&getProfileImage.m_id=${getProfileImage.m_id}";
			frm.submit();			
		}
	}	
}


/* jQuery(document).ready(function(){
		var count= 0;
		$('#update_button').click(function() { 
			count = 1;
			alert("count:" + count);		
		});
						
	}); */ 


	 function update_button(lc_idx) {
		alert("update_button()함수로옴");
	    var textareaTag = "<br><textarea id='textarea" + lc_idx + "'  rows='3' cols='134' name='lc_content'></textarea>"+
	    "<button type='button' class='btn btn-outline-secondary' onclick='json_update(this.form)'>수정완료</button>"+
	    "<input type='hidden' id='lc_idx' value="+lc_idx+">";
	    var lc_content = $("#"+ lc_idx).text();
	    //alert(lc_idx);
		//$("#"+ lc_idx).append(textareaTag);
		
		$("#"+lc_idx).empty();
		$("#"+lc_idx).append(textareaTag);
		//alert("aa");
		$("#textarea" + lc_idx).append(lc_content);		
	}  
	
	function json_update(){	
		//alert("json_update");
		/* var lc_idx = document.getElementById("lc_idx").value; */
		var lc_idx = $('#lc_idx').val();
		var str = $("#frm").serialize();
		
		//alert("lc_idx : " + lc_idx);
		//alert("str4 : " +str);
		
		alert("lc_idx : " + $('#lc_idx').val());
		/* alert("m_id : " + ${member.m_id}); */
		alert("lc_content : " + $('#textarea')); 
		
		
		$.ajax({
			async: true,
			type : 'POST',
			dataType : "json",			
			/* data : {lc_idx: $('#lc_idx').val(), m_id: ${member.m_id}, lc_content: $('#textarea'+lc_idx)}, */
			contentType: "application/json; charset=UTF-8",
			url : '../updateLocalAdviceCommentJson.do',
		
			success : function(data){
				alert("data.cnt : " + data.cnt);
				if(data.cnt ==0){
					alert("데이터가 없숨");
				} else{
					alert("데이터가 있숨");
				}
			}
		
		})
	}
	
	
</script>
 
</head>

<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="views/sub2.jsp" class="scrollto">Couch Surfing</a></h1>
        <!-- Uncomment below if you prefer to use an image logo -->
        <!-- <a href="#intro"><img src="img/logo.png" alt="" title="" /></a>-->
      </div>

      <nav id="nav-menu-container">
        <ul class="nav-menu">
        <li class="menu-has-children"><a href="">Drop Down</a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
              <li><a href="#">Drop Down 5</a></li>
            </ul>
          </li>
          <li><a href="#about">쪽지</a></li>
          <li><a href="#portfolio">마이 프로필</a></li>         
        </ul>
      </nav><!-- #nav-menu-container -->
    </div>
  </header><!-- #header -->
  
<!-- 키워드로 검색 -->
<form action="../sub.do" method="post">
	<table class="border-none">
		<tr>
			<td>
				<select name="searchCondition">			
					<%-- <c:forEach var="option" items="${conditionMap }">
						<option value="${option.value }">${option.key }
					</c:forEach> --%>
					<option value="find_travler">여행자검색
					<option value="find_host">호스트검색
					<option value="find_event">이벤트검색
					<option value="find_advice">현지정보검색
				</select>
				<input id="autocomplete" placeholder="Enter your address" type="text" name="searchKeyword">
				
				<input class="field" id="lat" type="hidden" name="lat"/>
				<input class="field" id="lng" type="hidden" name="lng"/>
				
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>  
  <!--==========================
      About Us Section
    ============================-->    
<section id="about">
<div class="container">
	<div class="row from-group">	
	
		<div id="tableDiv">
			<table>				
				<tr>
					<td rowspan="3"><img src="${getLocalAdvice.getP_route() }" class="rounded-circle"  id="profileImage" onerror='this.src="../views/img/people/fuckyou.jpg"'></td>
					<td><strong>${getLocalAdvice.l_subject }</strong></td>
					<td>					
						<c:if test="${getProfileImage.m_id eq m_id }"> 
							<a id="atag-size" href="../updateLocalAdvice.do?l_idx=${getLocalAdvice.l_idx }">&nbsp;수정&nbsp;</a>|
							<a id="atag-size" href="#" onclick="deleteokC('${vo.qc_idx}')">삭제&nbsp;</a>
						</c:if>
					</td>
				</tr>
				<tr>
					<td>${getLocalAdvice.m_id}&emsp;&emsp; ${getLocalAdvice.l_date }</td>
				</tr>
				<tr>
					<td>${getLocalAdvice.l_upvote } &nbsp;&nbsp; ${getLocalAdvice.l_reviewcount }</td>
				</tr>				
			</table>	
				<div style="height: 300px"><p><br>${getLocalAdvice.l_content }${member.m_id }</p></div>		
		</div>	

		<%-- ${getLocalAdvice.l_idx } --%>
	 
      	<!-- 여기서부터 댓글폼 -->    
      	<form method="post" id="frm">	
      	<input type="hidden" name="m_id" value="${member.m_id }">
      	
			<table class="table" style="width: 1100px; /* height: 400px; */"> 
				<c:forEach var="list" items="${getLocalAdviceCommentList}">
					<tr>
						<td  class="update">
							<img src="${list.p_route }" class="rounded-circle" id="profileImage2" onerror='this.src="../views/img/people/fuckyou.jpg"'>
								&nbsp;&nbsp;${list.m_id }&emsp;&emsp;${list.lc_date }asdfasdfasdf${list.lc_idx }
								<c:if test="${list.m_id eq member.m_id}">    <!-- 조건에 로그인한아이디와 프로필의 m_id가 같으면 -->									
									<%-- <a href="../updateLocalAdviceComment.do?lc_idx=${list.lc_idx }&m_id=${getProfileImage.m_id}">&nbsp;수정&nbsp;</a>| --%>
					 				<button type="button" class="btn btn-outline-secondary" onclick="update_button('${list.lc_idx}')">수정</button>			 				
									<button type="button" class="btn btn-outline-secondary" onclick="delete_button(this.form)">삭제</button>
									<input type="hidden" name="lc_idx" value="${list.lc_idx }">
								</c:if>
									<div id="${list.lc_idx}"><br>${list.lc_content }<br></div>
						</td>
						<td>${list }</td>
					</tr>	
				</c:forEach>	
			</table>
		</form> 


		<!-- 댓글 입력 폼 -->
		<form method="post" name="frm">
			<p>
			<textarea name="lc_content" rows="3" cols="134"></textarea>
			<input class="btn btn-outline-secondary" type="button" value="댓글등록" onclick="login_chk(this.form)">			
			</p>
		</form>
		
	</div>
</div>	   
</section><!-- #about -->
 <!--==========================
    Footer
  ============================-->
  <footer id="footer">
    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-info">
            <h3>Couch Surfing</h3>
            <p>카우치 서핑(Couch Surfing)은 잠을 잘수 있는 쇼파를 의미하는 카우치(Couch)와 파도를 타다는 서핑(Surfing)의 합성어로 숙박 혹은 가이드까지 받을 수 있는, 여행자들을 위한 비영리 커뮤니티 이다.</p>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Home</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">About us</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Services</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="ion-ios-arrow-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-contact">
            <h4>Contact Us</h4>
            <p>
             	 비트캠프 신촌센터 <br>
              Seoul, NY 535022<br>
              Korea <br>
              <strong>Phone:</strong> 010-5575-4786<br>
              <strong>Email:</strong> test@test.com<br>
            </p>

            <div class="social-links">
              <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
              <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
              <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
              <a href="#" class="google-plus"><i class="fa fa-google-plus"></i></a>
              <a href="#" class="linkedin"><i class="fa fa-linkedin"></i></a>
            </div>

          </div>

          <div class="col-lg-3 col-md-6 footer-newsletter">
            <h4>Couch Surfing tip</h4>
            <p>만나는 사람들과 대화를 많이 하려고 시도하세요.
				그 의사소통보다 더 중요한 건 안전이다. 인증이 된 멤버인지, 타인들이 남긴 레퍼런스(리뷰)는 긍정적인지, 올려둔 사진은 괜찮은지... 감각을 키워가자.
				호스트든 게스트든 집에서는 위생을 유지하도록 하자.</p>
          </div>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong>Couch Surfing</strong>. All Rights Reserved
      </div>
      <div class="credits">

        Best <a href="https://bootstrapmade.com/">Bootstrap Templates</a> by BootstrapMade
      </div>
    </div> 
  </footer><!-- #footer --> 