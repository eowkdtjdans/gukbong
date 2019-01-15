<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구글로그인</title>

<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">

<style type="text/css">
    #customBtn {
      display: inline-block;
      background: white;
      color: #444;
      width: 190px;
      border-radius: 5px;
      border: thin solid #888;
      box-shadow: 1px 1px 1px grey;
      white-space: nowrap;
    }
    #customBtn:hover {
      cursor: pointer;
    }
    span.icon {
      display: inline-block;
      vertical-align: middle;
      width: 42px;
      height: 42px;
    }
    span.buttonText {
      display: inline-block;
      vertical-align: middle;
      padding-left: 42px;
      padding-right: 42px;
      font-size: 14px;
      font-weight: bold;
      /* Use the Roboto font that is loaded in the <head> */
      font-family: 'Roboto', sans-serif;
    }
    span.icon img {
       width: 20px; height: 20px;
       margin-left: 14px;
       margin-top: 11px;
    }
</style>
<script>
   function move() {
      location.href="${google_url}";
   }
</script>
</head>
<body>
   <div id="gSignInWrapper">
      <div id="customBtn" class="customGPlusSignIn" onclick="move()">
         <span class="icon"><img src="/views/img/g-normal.png"></span>
         <span class="buttonText">Google</span>
      </div>
   </div>
</body>
</html>