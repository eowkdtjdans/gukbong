<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: powderblue; }
	.center { text-align: center; }
</style>

<script>
	//로그인 값이 있던 없던 그냥 넘어가니까 JSON을 사용해서 데이터베이스에 있는지 체크하기.

    $("#login").submit(function(){ //문서의 모든 form이 submit될때
            alert("앙기모띠"); // password라고 경고
            
    });
		
</script>

</head>
<body>

<body>


<div class="container" id="container"> <!--id="login"  -->
<form method="post" action="../../loginMember.do">
   <table class="table table-hover" style="text-align : center; border : 1px solid #dddddd" >
<thead>
   <tr>
      <th colspan="3">
         <h3 class="text-center" >로그인</h3>
      </th>
   </tr>
</thead>

<tbody>
  
   <tr>
      <td style="width: 110px;">아이디</td>
	      <td>
	      	<input type="text" class="form-control" id="m_id" name="m_id" maxLength="20" />
	      </td>
   </tr>
     
   <tr>
      <td style="width: 110px;">비밀번호</td>
	      <td>
	      	<input type="text" class="form-control" id="m_pwd" name="m_pwd" maxLength="20" />
	      </td>
   </tr>
     
   
   <tr>
      <td colspan="3">
      <input  type="submit" class="btn btn-outline-secondary pull-right"  value="로그인" id="login"/> 
      </td>
   </tr>
   
  	 </tbody>
         
     </table>
   </form>
</div>

</body>
</html>