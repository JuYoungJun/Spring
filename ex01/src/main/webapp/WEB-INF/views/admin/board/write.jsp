
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<link rel="stylesheet" type="text/css" href="../css/admin_board_write.css">
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

	<form method="post">
		<label>제목</label> <input type="text" name="title"><br> <label>작성자</label>
		<input type="text" name="writer" value="${ member.userName }"
			readonly="readonly"><br> <label>내용</label>
		<textarea rows="5" cols="50" name="content"></textarea>
		<br>
		<button type="submit">작성</button>
		<button type="button" onclick="location.href = '../'">취소</button>
	</form>

</body>
</html>
