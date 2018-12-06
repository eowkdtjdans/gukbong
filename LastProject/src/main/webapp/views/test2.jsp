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
<c:choose>
	<c:when test="'${sessionScope.m_id == null }">
		<a href="${path}/member/loginMember.do ">로그인</a>
	</c:when>
	
	<c:otherwise>
		${m_id }님이 로그인 중입니다.
	</c:otherwise>
	
</c:choose>
</body>
</html>