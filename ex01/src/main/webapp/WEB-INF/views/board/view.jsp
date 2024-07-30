<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/main_board_view.css">
</head>
<body>
	<div id="nav">
		<%@ include file="../include/nav.jsp"%>
	</div>

	<form method="post">
		<label>제목</label> <input type="text" name="title"
			value="${ view.title }" readonly><br> <label>조회수</label>
		<input type="text" name="viewCnt" value="${ view.viewCnt }" readonly><br>
		<label>작성자</label> <input type="text" name="writer"
			value="${ view.writer }" readonly><br> <label>내용</label>
		<textarea rows="5" cols="50" name="content" readonly>${ view.content }</textarea>
		<br>
		<!-- <button type="submit">작성</button> -->
	</form>

	<div>
		<a href="/board/modify?bno=${ view.bno }">게시물 수정</a> <a
			href="/board/delete?bno=${ view.bno }">게시물 삭제</a>
	</div>

</body>
</html>
