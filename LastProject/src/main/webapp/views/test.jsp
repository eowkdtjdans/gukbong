<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Commit-Test</title>
</head>
<body>
	<h2>ㅎㅇ</h2>
	<a href="../getTravelersList.do">travelers</a>
	<a href="Travelers.jsp">travelers2</a>
	<a href="travelers/Travelers.jsp">travelers3</a>
	<a href="../insertMember.do">Register</a> 
	<a href="../loginMember.do">Login</a> 
	<a href="../logoutMember.do">logout</a> 
	<a href="../sub2.do">sub페이지</a>  
	<a href="../findIDmember.do">아이디 찾기페이지</a>  
	<a href="../findPWDmember.do">비밀번호 찾기페이지</a>  
	<p>세션 : [${m_id}] 앙기무리</p>
</body>
</html>