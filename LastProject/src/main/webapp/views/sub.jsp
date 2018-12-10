 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
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
</style>
 
 
</head>

<body>

  <!--==========================
    Header
  ============================-->
  <header id="header">
    <div class="container-fluid">

      <div id="logo" class="pull-left">
        <h1><a href="#intro" class="scrollto">Couch Surfing</a></h1>
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
          
          <li><a href="../../findIdMember.do">아이디</a></li>
          <li><a href="../../findPwdMember.do">비밀번호</a></li>
          <li><a href="../../logoutMember.do">로그아웃</a></li>
          <li><a href="../../loginMember.do" >로그인</a></li>
		  <li><a  href="../../insertMember.do" >회원가입</a></li>   
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
				<input type="text" name="searchKeyword">
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
        <header class="section-header">
        	<p>${m_id }</p>
          <h3>About Us</h3>
          <p>${m_id }</p>
          <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
        </header>

        <div class="row about-cols">

          <div class="col-md-4 wow fadeInUp">
            <div class="about-col">
              <div class="img">
                <img src="img/about-mission.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-speedometer-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Our Mission</a></h2>
              <p>
                Lorem ipsum dolor sit amet, consectetur elit, sed do eiusmod tempor ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
              </p>
            </div>
          </div>

          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.1s">
            <div class="about-col">
              <div class="img">
                <img src="img/about-plan.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-list-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Our Plan</a></h2>
              <p>
                Sed ut perspiciatis unde omnis iste natus error sit voluptatem  doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.
              </p>
            </div>
          </div>

          <div class="col-md-4 wow fadeInUp" data-wow-delay="0.2s">
            <div class="about-col">
              <div class="img">
                <img src="img/about-vision.jpg" alt="" class="img-fluid">
                <div class="icon"><i class="ion-ios-eye-outline"></i></div>
              </div>
              <h2 class="title"><a href="#">Our Vision</a></h2>
              <p>
                Nemo enim ipsam voluptatem quia voluptas sit aut odit aut fugit, sed quia magni dolores eos qui ratione voluptatem sequi nesciunt Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.
              </p>
            </div>
          </div>
	</div>
      </div>
    </section><!-- #about -->


    <!--==========================
      Portfolio Section
    ============================-->
    <section id="portfolio"  class="section-bg" >
      <div class="container">

        <header class="section-header">
          <h3 class="section-title">Our Portfolio</h3>
        </header>

        <div class="row">
          <div class="col-lg-12">
            <ul id="portfolio-flters">
              <li data-filter="*" class="filter-active">All</li>
              <li data-filter=".filter-app">App</li>
              <li data-filter=".filter-card">Card</li>
              <li data-filter=".filter-web">Web</li>
            </ul>
          </div>
        </div>

        <div class="row portfolio-container">

          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/app1.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/app1.jpg" data-lightbox="portfolio" data-title="App 1" class="link-preview" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">App 1</a></h4>
                <p>App</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/web3.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/web3.jpg" class="link-preview" data-lightbox="portfolio" data-title="Web 3" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Web 3</a></h4>
                <p>Web</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/app2.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/app2.jpg" class="link-preview" data-lightbox="portfolio" data-title="App 2" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">App 2</a></h4>
                <p>App</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/card2.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/card2.jpg" class="link-preview" data-lightbox="portfolio" data-title="Card 2" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Card 2</a></h4>
                <p>Card</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/web2.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/web2.jpg" class="link-preview" data-lightbox="portfolio" data-title="Web 2" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Web 2</a></h4>
                <p>Web</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-app wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/app3.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/app3.jpg" class="link-preview" data-lightbox="portfolio" data-title="App 3" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">App 3</a></h4>
                <p>App</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/card1.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/card1.jpg" class="link-preview" data-lightbox="portfolio" data-title="Card 1" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Card 1</a></h4>
                <p>Card</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-card wow fadeInUp" data-wow-delay="0.1s">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/card3.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/card3.jpg" class="link-preview" data-lightbox="portfolio" data-title="Card 3" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Card 3</a></h4>
                <p>Card</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 portfolio-item filter-web wow fadeInUp" data-wow-delay="0.2s">
            <div class="portfolio-wrap">
              <figure>
                <img src="img/portfolio/web1.jpg" class="img-fluid" alt="">
                <a href="img/portfolio/web1.jpg" class="link-preview" data-lightbox="portfolio" data-title="Web 1" title="Preview"><i class="ion ion-eye"></i></a>
                <a href="#" class="link-details" title="More Details"><i class="ion ion-android-open"></i></a>
              </figure>

              <div class="portfolio-info">
                <h4><a href="#">Web 1</a></h4>
                <p>Web</p>
              </div>
            </div>
          </div>

        </div>

      </div>
    </section><!-- #portfolio -->

 

   
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
        <!--
          All the links in the footer should remain intact.
          You can delete the links only if you purchased the pro version.
          Licensing information: https://bootstrapmade.com/license/
          Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/buy/?theme=BizPage
        -->
        Best <a href="https://bootstrapmade.com/">Bootstrap Templates</a> by BootstrapMade
      </div>
    </div> 
  </footer><!-- #footer -->

  <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

  <!-- JavaScript Libraries -->
  <script src="views/lib/jquery/jquery.min.js"></script>
  <script src="views/lib/jquery/jquery-migrate.min.js"></script>
  <script src="views/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="views/lib/easing/easing.min.js"></script>
  <script src="views/lib/superfish/hoverIntent.js"></script>
  <script src="views/lib/superfish/superfish.min.js"></script>
  <script src="views/lib/wow/wow.min.js"></script>
  <script src="views/lib/waypoints/waypoints.min.js"></script>
  <script src="views/lib/counterup/counterup.min.js"></script>
  <script src="views/lib/owlcarousel/owl.carousel.min.js"></script>
  <script src="views/lib/isotope/isotope.pkgd.min.js"></script>
  <script src="views/lib/lightbox/js/lightbox.min.js"></script>
  <script src="views/lib/touchSwipe/jquery.touchSwipe.min.js"></script>
  <!-- Contact Form JavaScript File -->
  <script src="views/contactform/contactform.js"></script>

  <!-- Template Main Javascript File -->
  <script src="views/js/main.js"></script>













<!-- ================================================== modal  -->
<div class="cd-intro">
		<h1>Login/Signup Modal Window</h1>
		<div class="cd-nugget-info">
			<a href="http://codyhouse.co/gem/loginsignup-modal-window/">
				<span>
					<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="16px" height="16px" viewBox="0 0 16 16" style="enable-background:new 0 0 16 16;" xml:space="preserve">
						<style type="text/css">
							.cd-nugget-info-arrow{fill:#383838;}
						</style>
						<polygon class="cd-nugget-info-arrow" points="15,7 4.4,7 8.4,3 7,1.6 0.6,8 0.6,8 0.6,8 7,14.4 8.4,13 4.4,9 15,9 "/>
					</svg>
				</span>
				Article &amp; Download
			</a>
		</div> <!-- cd-nugget-info -->
	</div>

	<div class="cd-signin-modal js-signin-modal"> <!-- this is the entire modal form, including the background -->
		<div class="cd-signin-modal__container"> <!-- this is the container wrapper -->
			<ul class="cd-signin-modal__switcher js-signin-modal-switcher js-signin-modal-trigger">
				<li><a href="#0" data-signin="login" data-type="login">Sign in</a></li>
				<li><a href="#0" data-signin="signup" data-type="signup">New account</a></li>
			</ul>

			<div class="cd-signin-modal__block js-signin-modal-block" data-type="login"> <!-- log in form -->
				<form class="cd-signin-modal__form">
					<p class="cd-signin-modal__fieldset">
						<label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signin-email">E-mail</label>
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-email" type="email" placeholder="E-mail">
						<span class="cd-signin-modal__error">Error message here!</span>
					</p>

					<p class="cd-signin-modal__fieldset">
						<label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signin-password">Password</label>
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signin-password" type="text"  placeholder="Password">
						<a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
						<span class="cd-signin-modal__error">Error message here!</span>
					</p>

					<p class="cd-signin-modal__fieldset">
						<input type="checkbox" id="remember-me" checked class="cd-signin-modal__input ">
						<label for="remember-me">Remember me</label>
					</p>

					<p class="cd-signin-modal__fieldset">
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width" type="submit" value="Login">
					</p>
				</form>
				
				<p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="reset">Forgot your password?</a></p>
			</div> <!-- cd-signin-modal__block -->

			<div class="cd-signin-modal__block js-signin-modal-block" data-type="signup"> <!-- sign up form -->
				<form class="cd-signin-modal__form">
					<p class="cd-signin-modal__fieldset">
						<label class="cd-signin-modal__label cd-signin-modal__label--username cd-signin-modal__label--image-replace" for="signup-username">Username</label>
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-username" type="text" placeholder="Username">
						<span class="cd-signin-modal__error">Error message here!</span>
					</p>

					<p class="cd-signin-modal__fieldset">
						<label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="signup-email">E-mail</label>
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-email" type="email" placeholder="E-mail">
						<span class="cd-signin-modal__error">Error message here!</span>
					</p>

					<p class="cd-signin-modal__fieldset">
						<label class="cd-signin-modal__label cd-signin-modal__label--password cd-signin-modal__label--image-replace" for="signup-password">Password</label>
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="signup-password" type="text"  placeholder="Password">
						<a href="#0" class="cd-signin-modal__hide-password js-hide-password">Hide</a>
						<span class="cd-signin-modal__error">Error message here!</span>
					</p>

					<p class="cd-signin-modal__fieldset">
						<input type="checkbox" id="accept-terms" class="cd-signin-modal__input ">
						<label for="accept-terms">I agree to the <a href="#0">Terms</a></label>
					</p>

					<p class="cd-signin-modal__fieldset">
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit" value="Create account">
					</p>
				</form>
			</div> <!-- cd-signin-modal__block -->

			<div class="cd-signin-modal__block js-signin-modal-block" data-type="reset"> <!-- reset password form -->
				<p class="cd-signin-modal__message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>

				<form class="cd-signin-modal__form">
					<p class="cd-signin-modal__fieldset">
						<label class="cd-signin-modal__label cd-signin-modal__label--email cd-signin-modal__label--image-replace" for="reset-email">E-mail</label>
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding cd-signin-modal__input--has-border" id="reset-email" type="email" placeholder="E-mail">
						<span class="cd-signin-modal__error">Error message here!</span>
					</p>

					<p class="cd-signin-modal__fieldset">
						<input class="cd-signin-modal__input cd-signin-modal__input--full-width cd-signin-modal__input--has-padding" type="submit" value="Reset password">
					</p>
				</form>

				<p class="cd-signin-modal__bottom-message js-signin-modal-trigger"><a href="#0" data-signin="login">Back to log-in</a></p>
			</div> <!-- cd-signin-modal__block -->
			<a href="#0" class="cd-signin-modal__close js-close">Close</a>
		</div> <!-- cd-signin-modal__container -->
	</div> <!-- cd-signin-modal -->
<script src="jsModal/placeholders.min.js"></script> <!-- polyfill for the HTML5 placeholder attribute -->
<script src="jsModal/main.js"></script> <!-- Resource JavaScript -->







</body>
</html>
