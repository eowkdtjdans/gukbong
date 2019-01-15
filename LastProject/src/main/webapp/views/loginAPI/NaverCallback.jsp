<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <meta charset="utf-8">
   <meta name="author" content="Kodinger">
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <title>회원가입</title>
   <link rel="stylesheet" type="text/css" href="views/bootstrapModal/css/bootstrap.min.css">
   <link rel="stylesheet" type="text/css" href="views/cssModal/my-login.css">
   
   <link rel="stylesheet" href="views/datepicker/public/theme/css/t-datepicker.min.css">
   <link rel="stylesheet" href="views/datepicker/public/theme/css/themes/t-datepicker-teal.css">
   <!-- blue, bluegrey, cyan, green, lime, main, orange, purple, teal, yellow -->
   
   <script src="http://code.jquery.com/jquery-latest.min.js"></script>
   <script src="views/datepicker/public/theme/js/t-datepicker.min.js"></script>



<script>
   function ApiRegisterCheck() {
       var naverId = ${result}.response.email;
       alert("naverId :" + naverId);
        $.ajax({
          async: true,
         type : 'POST',
         dataType : "json",
         data : naverId,
          contentType: "application/json; charset=UTF-8",  
         url : '../../checkMemberJson.do',
         success : function(data) {
            if (data.cnt >= 1) {
               alert("사이트 이용 시 로그인을 해야 가능합니다.");
               location.href = "../../loginMember.do";
            } else if(data.cnt == 0) {
               alert("사이트 이용 시 회원가입을 해야 사용 가능합니다.");
               location.href = "../../NaverRegister.do";
            } 
            
         }
      })  
      
   }
</script>

</head>
<body class="my-login-page" onload="ApiRegisterCheck()">
</body>
</html>