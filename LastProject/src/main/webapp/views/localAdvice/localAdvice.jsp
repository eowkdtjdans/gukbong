<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LocalAdvice</title>
</head>
<body>
	<h2>localAdvice.jsp</h2>
	<c:forEach var="list" items="${localAdviceList}">
		<div>
			<p>${list.m_id}</p>
		</div>	
	</c:forEach>
	
</body>
</html>