<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메세지 목록</title>

<style>
	#container {
		width: 700px;
		margin: 0 auto;
	}
	h1, h3 { text-align: center; }
	table { border-collapse: collapse; }
	table, th, td {
		border: 1px solid black;
		margin: 0 auto;
	}
	th { background-color: powderblue; }
	.center { text-align: center; }
	.border-none, .border-none td { border: none; }
</style>
</head>
<body>

<div id="container">
	<h1>메세지 목록</h1>
	<h3>[${member.m_id }]님 환영합니다... </h3>
	
	<!-- 데이타 표시 -->
	<form>
	<table>
		<tr>
			<th width="100">번호</th>
			<th width="200">제목</th>
			<th width="150">작성자</th>
			<th width="150">등록일</th>
			<th width="100">조회수</th>
		</tr>
		
		<c:forEach var="board" items="${boardList }">
		<tr>
			<td class="center">${board.seq }</td>
			<td>
				<a href="getBoard.do?seq=${board.seq }">
					${board.title }
				</a>
			</td>
			<td>${board.writer }</td>
			<td>${board.regdate }</td>
			<td class="center">${board.cnt }</td>
		</tr>
		</c:forEach>
	</table>
	</form>
	<p class="center"><a href="insertBoard.jsp">새글등록</a></p>
	
</div>

</body>
</html>