<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travelers</title>
</head>
<body>
	<c:forEach var="list" items="${travelersList}">
	<a href="#">
		<div class="container">
			<ul>
				<li>프로필사진</li>
				<li>${list.m_id}</li>
				<li>${list.t_visits}</li>
				<li>${list.t_dateofvisit}</li>
				<li>${list.t_motive}</li>
			</ul>
		</div>
	</a>
	</c:forEach>
</body>
</html>