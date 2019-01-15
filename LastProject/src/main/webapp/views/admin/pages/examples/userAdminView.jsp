<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | User Profile</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<!-- Ionicons -->
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<style>
   .fas.fa-search {
      font-size: 14px;
   }
   .fas.fa-heart {
      font-size: 14px;
   }
   #content {
      display: block;
      overflow: hidden;
      text-overflow: ellipsis;
      
      line-height: 1.2;
      height: 3.6em;
      text-align: left;
      word-wrap: break-word;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
   }
   .subject {
      display: block;
      text-overflow:ellipsis;
      white-space:nowrap;
      word-wrap:normal;
      width:800px;
      overflow:hidden;
   }
   
   
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

.card-body {
	max-height: 610px;
	overflow: hidden;
}
.post {
	min-height: 150px;
}
.post2 {
	min-height: 50px;
}
</style>

<script>
function test(p_route, m_id) {
   var modal = document.getElementById('myModal');
   
   var img = document.getElementById(p_route);
   var modalImg = document.getElementById("img01");
   var captionText = document.getElementById("caption");
   
   var m_id_value = document.getElementById('m_id');
   var p_route_value = document.getElementById('p_route');
   
   m_id_value.value=m_id;
   p_route_value.value=p_route;
   
   modal.style.display = "block";
   modalImg.src = img.src;
   captionText.innerHTML = img.alt;
   

   function close() { 
     modal.style.display = "none";
   }
}
   function deleteImage(frm) {
      var m_id = frm.m_id.value;
      var p_route = frm.p_route.value;
      var str = $("#modalBtn").serialize();
   
      frm.action = "../../deleteProfileImage.do";
      frm.submit();
      return false; 
   }

</script>
<script>
$(function(){
	var page = 610;
	$("#readBtn").click(function(){
		console.log(page += 610);
		$(".card-body").css("max-height", page);
	});
	
	$(".nav-link").click(function(){
		$(".card-body").css("max-height", 610);
	});
});
</script>
</head>
<body class="hold-transition sidebar-mini">
   <div class="wrapper">
      <!-- Navbar -->
      <nav
         class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
         <!-- Left navbar links -->
         <ul class="navbar-nav">
            <li class="nav-item"><a class="nav-link" data-widget="pushmenu"
               href="#"><i class="fa fa-bars"></i></a></li>
            <li class="nav-item d-none d-sm-inline-block"><a
               href="../../index3.jsp" class="nav-link">Home</a></li>
            <li class="nav-item d-none d-sm-inline-block"><a href="#"
               class="nav-link">Contact</a></li>
         </ul>

         <!-- SEARCH FORM -->
         <form class="form-inline ml-3">
            <div class="input-group input-group-sm">
               <input class="form-control form-control-navbar" type="search"
                  placeholder="Search" aria-label="Search">
               <div class="input-group-append">
                  <button class="btn btn-navbar" type="submit">
                     <i class="fa fa-search"></i>
                  </button>
               </div>
            </div>
         </form>

         <!-- Right navbar links -->
         <ul class="navbar-nav ml-auto">
            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown"><a class="nav-link"
               data-toggle="dropdown" href="#"> <i class="fa fa-comments-o"></i>
                  <span class="badge badge-danger navbar-badge">3</span>
            </a>
               <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                  <a href="#" class="dropdown-item"> <!-- Message Start -->
                     <div class="media">
                        <img src="../../dist/img/user1-128x128.jpg" alt="User Avatar"
                           class="img-size-50 mr-3 img-circle">
                        <div class="media-body">
                           <h3 class="dropdown-item-title">
                              Brad Diesel <span class="float-right text-sm text-danger"><i
                                 class="fa fa-star"></i></span>
                           </h3>
                           <p class="text-sm">Call me whenever you can...</p>
                           <p class="text-sm text-muted">
                              <i class="fa fa-clock-o mr-1"></i> 4 Hours Ago
                           </p>
                        </div>
                     </div> <!-- Message End -->
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item"> <!-- Message Start -->
                     <div class="media">
                        <img src="../../dist/img/user8-128x128.jpg" alt="User Avatar"
                           class="img-size-50 img-circle mr-3">
                        <div class="media-body">
                           <h3 class="dropdown-item-title">
                              John Pierce <span class="float-right text-sm text-muted"><i
                                 class="fa fa-star"></i></span>
                           </h3>
                           <p class="text-sm">I got your message bro</p>
                           <p class="text-sm text-muted">
                              <i class="fa fa-clock-o mr-1"></i> 4 Hours Ago
                           </p>
                        </div>
                     </div> <!-- Message End -->
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item"> <!-- Message Start -->
                     <div class="media">
                        <img src="../../dist/img/user3-128x128.jpg" alt="User Avatar"
                           class="img-size-50 img-circle mr-3">
                        <div class="media-body">
                           <h3 class="dropdown-item-title">
                              Nora Silvester <span class="float-right text-sm text-warning"><i
                                 class="fa fa-star"></i></span>
                           </h3>
                           <p class="text-sm">The subject goes here</p>
                           <p class="text-sm text-muted">
                              <i class="fa fa-clock-o mr-1"></i> 4 Hours Ago
                           </p>
                        </div>
                     </div> <!-- Message End -->
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item dropdown-footer">See All
                     Messages</a>
               </div></li>
            <!-- Notifications Dropdown Menu -->
            <li class="nav-item dropdown"><a class="nav-link"
               data-toggle="dropdown" href="#"> <i class="fa fa-bell-o"></i> <span
                  class="badge badge-warning navbar-badge">15</span>
            </a>
               <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                  <span class="dropdown-item dropdown-header">15
                     Notifications</span>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item"> <i
                     class="fa fa-envelope mr-2"></i> 4 new messages <span
                     class="float-right text-muted text-sm">3 mins</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item"> <i class="fa fa-users mr-2"></i>
                     8 friend requests <span class="float-right text-muted text-sm">12
                        hours</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item"> <i class="fa fa-file mr-2"></i>
                     3 new reports <span class="float-right text-muted text-sm">2
                        days</span>
                  </a>
                  <div class="dropdown-divider"></div>
                  <a href="#" class="dropdown-item dropdown-footer">See All
                     Notifications</a>
               </div></li>
            <li class="nav-item"><a class="nav-link"
               data-widget="control-sidebar" data-slide="true" href="#"> <i
                  class="fa fa-th-large"></i>
            </a></li>
         </ul>
      </nav>
      <!-- /.navbar -->

      <!-- Main Sidebar Container -->
      <aside class="main-sidebar sidebar-dark-primary elevation-4">
         <!-- Brand Logo -->
         <a href="../../index3.jsp" class="brand-link">
            <img src="../../dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
            <span class="brand-text font-weight-light">AdminLTE 3</span>
         </a>

         <!-- Sidebar -->
         <div class="sidebar">
            <!-- Sidebar user (optional) -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
               <div class="image">
                  <img src="../../dist/img/user2-160x160.jpg"
                     class="img-circle elevation-2" alt="User Image">
               </div>
               <div class="info">
                  <a href="#" class="d-block">Alexander Pierce</a>
               </div>
            </div>

            <!-- Sidebar Menu -->
            <nav class="mt-2">
               <ul class="nav nav-pills nav-sidebar flex-column"
                  data-widget="treeview" role="menu" data-accordion="false">
                  <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fa fa-dashboard"></i>
                        <p>
                           Dashboard <i class="right fa fa-angle-left"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../../index.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Dashboard v1</p>
                        </a></li>
                        <li class="nav-item"><a href="../../index2.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Dashboard v2</p>
                        </a></li>
                        <li class="nav-item"><a href="../../index3.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Dashboard v3</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-item"><a href="../widgets.jsp"
                     class="nav-link"> <i class="nav-icon fa fa-th"></i>
                        <p>
                           Widgets <span class="right badge badge-danger">New</span>
                        </p>
                  </a></li>
                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fa fa-pie-chart"></i>
                        <p>
                           Charts <i class="right fa fa-angle-left"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../charts/chartjs.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>ChartJS</p>
                        </a></li>
                        <li class="nav-item"><a href="../charts/flot.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Flot</p>
                        </a></li>
                        <li class="nav-item"><a href="../charts/inline.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Inline</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fa fa-tree"></i>
                        <p>
                           UI Elements <i class="fa fa-angle-left right"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../UI/general.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>General</p>
                        </a></li>
                        <li class="nav-item"><a href="../UI/icons.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Icons</p>
                        </a></li>
                        <li class="nav-item"><a href="../UI/buttons.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Buttons</p>
                        </a></li>
                        <li class="nav-item"><a href="../UI/sliders.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Sliders</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fa fa-edit"></i>
                        <p>
                           Forms <i class="fa fa-angle-left right"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../forms/general.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>General Elements</p>
                        </a></li>
                        <li class="nav-item"><a href="../forms/advanced.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Advanced Elements</p>
                        </a></li>
                        <li class="nav-item"><a href="../forms/editors.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Editors</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fa fa-table"></i>
                        <p>
                           Tables <i class="fa fa-angle-left right"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../tables/simple.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Simple Tables</p>
                        </a></li>
                        <li class="nav-item"><a href="../tables/data.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Data Tables</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-header">EXAMPLES</li>
                  <li class="nav-item"><a href="../calendar.jsp"
                     class="nav-link"> <i class="nav-icon fa fa-calendar"></i>
                        <p>
                           Calendar <span class="badge badge-info right">2</span>
                        </p>
                  </a></li>
                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fa fa-envelope-o"></i>
                        <p>
                           Mailbox <i class="fa fa-angle-left right"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../mailbox/mailbox.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Inbox</p>
                        </a></li>
                        <li class="nav-item"><a href="../mailbox/compose.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Compose</p>
                        </a></li>
                        <li class="nav-item"><a href="../mailbox/read-mail.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Read</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-item has-treeview menu-open"><a href="#"
                     class="nav-link active"> <i class="nav-icon fa fa-book"></i>
                        <p>
                           Pages <i class="fa fa-angle-left right"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../examples/invoice.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Invoice</p>
                        </a></li>
                        <li class="nav-item"><a href="../examples/profile.jsp"
                           class="nav-link active"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Profile</p>
                        </a></li>
                        <li class="nav-item"><a href="../examples/login.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Login</p>
                        </a></li>
                        <li class="nav-item"><a href="../examples/register.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Register</p>
                        </a></li>
                        <li class="nav-item"><a href="../examples/lockscreen.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Lockscreen</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-item has-treeview"><a href="#"
                     class="nav-link"> <i class="nav-icon fa fa-plus-square-o"></i>
                        <p>
                           Extras <i class="fa fa-angle-left right"></i>
                        </p>
                  </a>
                     <ul class="nav nav-treeview">
                        <li class="nav-item"><a href="../examples/404.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Error 404</p>
                        </a></li>
                        <li class="nav-item"><a href="../examples/500.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Error 500</p>
                        </a></li>
                        <li class="nav-item"><a href="../examples/blank.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Blank Page</p>
                        </a></li>
                        <li class="nav-item"><a href="../../starter.jsp"
                           class="nav-link"> <i class="fa fa-circle-o nav-icon"></i>
                              <p>Starter Page</p>
                        </a></li>
                     </ul></li>
                  <li class="nav-header">MISCELLANEOUS</li>
                  <li class="nav-item"><a href="https://adminlte.io/docs"
                     class="nav-link"> <i class="nav-icon fa fa-file"></i>
                        <p>Documentation</p>
                  </a></li>
                  <li class="nav-header">LABELS</li>
                  <li class="nav-item"><a href="#" class="nav-link"> <i
                        class="nav-icon fa fa-circle-o text-danger"></i>
                        <p class="text">Important</p>
                  </a></li>
                  <li class="nav-item"><a href="#" class="nav-link"> <i
                        class="nav-icon fa fa-circle-o text-warning"></i>
                        <p>Warning</p>
                  </a></li>
                  <li class="nav-item"><a href="#" class="nav-link"> <i
                        class="nav-icon fa fa-circle-o text-info"></i>
                        <p>Informational</p>
                  </a></li>
               </ul>
            </nav>
            <!-- /.sidebar-menu -->
         </div>
         <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
         <!-- Content Header (Page header) -->
         <section class="content-header">
            <div class="container-fluid">
               <div class="row mb-2">
                  <div class="col-sm-6">
                     <h1>Profile</h1>
                  </div>
                  <div class="col-sm-6">
                     <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item active">User Profile</li>
                     </ol>
                  </div>
               </div>
            </div>
            <!-- /.container-fluid -->
         </section>

         <!-- Main content -->
         <section class="content">
            <div class="container-fluid">
               <div class="row">
                  <div class="col-md-3">

                     <!-- Profile Image -->
                     <div class="card card-primary card-outline">
                        <div class="card-body box-profile">
                           <div class="text-center">
                              <img class="profile-user-img img-fluid img-circle"
                                 src="${userAdminViewVO.p_route}"
                                 alt="User profile picture"
                                 onerror='this.src="/views/img/people/fuckyou.jpg"' style="width:300px;">
                           </div>

                           <h3 class="profile-username text-center">${userAdminViewVO.m_id}</h3>

                           <p class="text-muted text-center">${userAdminViewVO.p_job}</p>

                           <fmt:formatDate var="reg" value="${userAdminViewVO.m_regdate}" pattern="yyyy-MM-dd"/>
                           
                           <ul class="list-group list-group-unbordered mb-3">
                              <li class="list-group-item"><b>이름</b> <a
                                 class="float-right">${userAdminViewVO.m_name}</a></li>
                              <li class="list-group-item"><b>번호</b> <a
                                 class="float-right">${userAdminViewVO.m_phone}</a></li>
                              <li class="list-group-item"><b>가입일자</b> <a
                                 class="float-right">${reg}</a></li>
                           </ul>

                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.card -->

                     <!-- About Me Box -->
                     <div class="card card-primary">
                        <div class="card-header">
                           <h3 class="card-title">유저 프로필 정보</h3>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                           <strong><i class="fas fa-user-alt"></i> 회원소개</strong>

                           <p class="text-muted">${userAdminViewVO.p_aboutme}</p>

                           <hr>

                           <strong><i class="fas fa-home"></i> 주소</strong>

                           <p class="text-muted">${userAdminViewVO.m_address}</p>

                           <hr>

                           <strong><i class="fas fa-pencil-alt"></i> 취미 및 사용언어</strong>

                           <p class="text-muted">
                              <span class="tag tag-danger">${userAdminViewVO.p_hobby}</span>
                              <span class="tag tag-danger">${userAdminViewVO.p_language}</span>
                           </p>

                           <hr>
                           
                           <strong><i class="far fa-bookmark"></i> 사이트 방문목적</strong>

                           <p class="text-muted">${userAdminViewVO.p_purpose}</p>
                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.card -->
                  </div>
                  <!-- /.col -->
                  <div class="col-md-9">
                     <div class="card">
                        <div class="card-header p-2">
                           <ul class="nav nav-pills">
                              <li class="nav-item"><a class="nav-link active" href="#activity" data-toggle="tab">게시글 내역</a></li>
                              <li class="nav-item"><a class="nav-link" href="#timeline" data-toggle="tab">댓글 내역</a></li>
                              <li class="nav-item"><a class="nav-link" href="#settings" data-toggle="tab">프로필 목록</a></li>
                           </ul>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                           <div class="tab-content">
                              <div class="active tab-pane" id="activity">
                              
                              <c:forEach var="list" items="${userAdminPostList}">
                                 <!-- Post -->
                                 <div class="post">
                                    <div class="user-block">
                                       <img class="img-circle img-bordered-sm" src="${list.p_route}" alt="user image" onerror='this.src="/views/img/people/fuckyou.jpg"'>
                                       <span class="username">
                                          <a href="/getLocalAdvice.do?l_idx=${list.l_idx }&m_id=${list.m_id}" class="subject">${list.l_subject}</a>
                                       </span>
                                       <fmt:formatDate var="l_date" value="${list.l_date}" pattern="yyyy-MM-dd a hh:mm:ss"/>
                                       <span class="description">
                                          ${l_date}
                                       </span>
                                    </div>
                                    <!-- /.user-block -->
                                    <p id="content">${list.l_content}</p>

                                    <p>
                                       <i class="fas fa-search"> 조회수(${list.l_reviewcount})</i>
                                       &nbsp;&nbsp;
                                       <i class="fas fa-heart"> 좋아요(${list.l_upvote})</i>
                                       <span class="float-right">
                                          <a href="#" class="link-black text-sm">
                                             <i class="fa fa-comments-o mr-1">댓글 (${list.lc_cnt})</i>
                                          </a>
                                       </span>
                                    </p>

                                 </div>
                                 <!-- /.post -->
                                 </c:forEach>
                              </div>
                              
                              <div class="tab-pane" id="timeline">
                              <c:forEach var="list" items="${userAdminCommentList}">
                                 <div class="post2">
                                    <div class="user-block">
                                       <img class="img-circle img-bordered-sm" src="${list.p_route}" alt="user image" onerror='this.src="/views/img/people/fuckyou.jpg"'>
                                       <span class="username">
                                          <a href="/getLocalAdvice.do?l_idx=${list.l_idx }&m_id=${list.m_id}" class="subject">${list.lc_content}</a>
                                       </span>
                                       <fmt:formatDate var="lc_date" value="${list.lc_date}" pattern="yyyy-MM-dd a hh:mm:ss"/>
                                       <span class="description">
                                          ${lc_date}
                                       </span>
                                    </div>

                                 </div>
                                 <hr>
                                 <!-- /.post -->
                                 </c:forEach>
                              </div>
                              
                              
                              <div class="tab-pane" id="settings">
                                 <div class="post2">
                                    <div class="user-block">
                                    <c:forEach var="list" items="${userAdminImageSelect}">
									    <span style="width:250px; height:300px;" onclick="test('${list.p_route}', '${list.m_id}')">
									       <img id="${list.p_route}" class="myImg" src="${list.p_route}" style="width:250px; height:250px;" onerror='this.src="/views/img/people/fuckyou.jpg"'>
									      </span>
									</c:forEach>
                                    </div>
                                 </div>
                                 <!-- /.post -->
                              </div>
                              
                              </div>
                              
                           </div>
                           <!-- /.tab-content -->
                           <button type="button" id="readBtn" class="btn btn-default">더 읽기...</button>
                        </div>
                        <!-- /.card-body -->
                     </div>
                     <!-- /.nav-tabs-custom -->
                  </div>
                  <!-- /.col -->
               </div>
               <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
         </section>
         <!-- /.content -->
      </div>
      <!-- /.content-wrapper -->
      <footer class="main-footer">
         <div class="float-right d-none d-sm-block">
            <b>Version</b> 3.0.0-alpha
         </div>
         <strong>Copyright &copy; 2014-2018 <a
            href="http://adminlte.io">AdminLTE.io</a>.
         </strong> All rights reserved.
      </footer>

      <!-- Control Sidebar -->
      <aside class="control-sidebar control-sidebar-dark">
         <!-- Control sidebar content goes here -->
      </aside>
      <!-- /.control-sidebar -->
   </div>
   <!-- ./wrapper -->
   
   	<!-- The Modal -->
	<form method="post" id="modalBtn">
	<div id="myModal" class="modal">
	  <div style="text-align : right;">
        <button onclick="deleteImage(this.form)" class="btn btn-default">이미지 삭제</button>
        <button onclick="close()" class="btn btn-default">닫기</button>
        <input id="m_id" type="hidden" class="form-control" name="m_id">
        <input id="p_route" type="hidden" class="form-control" name="p_route">
	  </div>
	  <img class="modal-content" id="img01">
	  <div id="caption"></div>
	</div>
	</form>
   
   <!-- jQuery -->
   <script src="../../plugins/jquery/jquery.min.js"></script>
   <!-- Bootstrap 4 -->
   <script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
   <!-- FastClick -->
   <script src="../../plugins/fastclick/fastclick.js"></script>
   <!-- AdminLTE App -->
   <script src="../../dist/js/adminlte.min.js"></script>
   <!-- AdminLTE for demo purposes -->
   <script src="../../dist/js/demo.js"></script>
</body>
</html>