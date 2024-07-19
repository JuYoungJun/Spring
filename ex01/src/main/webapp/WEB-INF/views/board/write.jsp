
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	padding: 0;
	background-color: #f4f4f9;
}

form {
	margin-bottom: 20px;
}

label {
	display: inline-block;
	width: 100px;
	font-weight: bold;
}

input[type="text"], textarea {
	width: 60%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

textarea {
	resize: vertical;
}

button {
	background-color: #4CAF50;
	color: white;
	padding: 10px 15px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

div {
	margin-top: 20px;
}

a {
	color: #3498db;
	text-decoration: none;
	margin-right: 10px;
}

a:hover {
	text-decoration: underline;
}

#nav {
	margin-top: 20px;
}

textarea {
	resize: none;
}
</style>
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
