<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
</head>
<body>
	<form method="post">
		<label>제목</label> <input type="text" name="title"
			value="${ view.title }"><br> <label>작성자</label> <input
			type="text" name="writer" value="${ view.writer }" readonly><br>
		<label>내용</label>
		<textarea rows="5" cols="50" name="content" style="resize: none;">${ view.content }</textarea>
		<br>
		<button type="submit">수정</button>
	</form>

	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

</body>
</html>