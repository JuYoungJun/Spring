<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 8px 12px;
	border: 1px solid #ddd;
	text-align: left;
}

th {
	background-color: #f4f4f4;
}

tr:nth-child(even) {
	background-color: #f9f9f9;
}

a {
	color: #3498db;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

#nav {
	margin-top: 20px;
}
</style>
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${ list }" var="list">
				<tr>
					<td>${ list.bno }</td>
					<td><a href="/board/view?bno=${ list.bno }">${ list.title }</a></td>
					<%-- <td>${ list.regDate }</td> --%>
					<td><fmt:formatDate value="${ list.regDate }"
							pattern="yyyy.MM.dd (E)a HH:mm:s" timeZone="UTC" /></td>
					<td>${ list.writer }</td>
					<td>${ list.viewCnt }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>