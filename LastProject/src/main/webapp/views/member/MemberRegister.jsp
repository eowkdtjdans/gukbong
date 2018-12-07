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
</head>
<body>

<body>


<div class="container" id="container">
<form method="post" action="../../insertMember.do" >
   <table class="table table-hover" style="text-align : center; border : 1px solid #dddddd" >
<thead>
   <tr>
      <th colspan="3">
         <h3 class="text-center" >회원가입 양식</h3>
      </th>
   </tr>
</thead>

<tbody>
  
   <tr>
      <td style="width: 110px;">아이디</td>
	      <td colspan="1">
	      	<input type="text" class="form-control" id="m_id" name="m_id" maxLength="30" />
	      </td>
   </tr>
     
   <tr>
      <td style="width: 110px;">비밀번호</td>
	      <td>
	      	<input type="text" class="form-control" id="m_pwd" name="m_pwd" maxLength="30" />
	      </td>
   </tr>
     
   <tr>
      <td style="width: 110px;">이름</td>
	      <td>
	      	<input type="text" class="form-control" id="m_name" name="m_name" maxLength="30" />
	      </td>
   </tr>
     
   <tr>
      <td style="width: 110px;">핸드폰</td>
	      <td>
	      	<input type="text" class="form-control" id="m_phone" name="m_phone" maxLength="30" />
	      </td>
   </tr>
     
   <tr>
      <td style="width: 110px;">성별</td>
	      <td>
	      	<input type="text" class="form-control" id="m_gender" name="m_gender" maxLength="30" />
	      </td>
   </tr>
     
   <tr>
      <td style="width: 110px;" colspan="1">생일</td>
	      <td colsapn="1">
	      	<input type="text" class="form-control" id="m_birthday" name="m_birthday" maxLength="30" />
	      </td>
   </tr>
   
        
   <tr>
      <td style="width: 110px;">주소</td>
	      <td>
	      	<input type="text" class="form-control" id="m_address" name="m_address" maxLength="30" />
	      </td>
   </tr>
   
   <tr>
      <td colspan="3">
         <input  type="submit" class="btn btn-outline-secondary pull-right"  value="가입하기" />
      </td>
   </tr>
   
  	 </tbody>
         
     </table>
   </form>
</div>

</body>
</html>