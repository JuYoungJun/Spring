<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환영 페이지</title>
<style>
body {
	font-family: '나눔고딕', Arial, sans-serif;
	background-color: #f7f7f7;
	margin: 0;
	padding: 0;
}

header {
	background-color: #6BB12C;
	padding: 15px 20px;
	color: white;
	text-align: center;
	font-size: 24px;
	font-weight: bold;
}

nav {
	margin: 20px auto;
	text-align: center;
}

nav a {
	text-decoration: none;
	color: #6BB12C;
	font-weight: bold;
	margin: 0 15px;
	font-size: 18px;
}

form {
	background-color: white;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	max-width: 350px;
	margin: 40px auto;
}

form p {
	margin-bottom: 20px;
}

form label {
	display: block;
	margin-bottom: 8px;
	color: #555;
}

form input {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

form button {
	width: 100%;
	padding: 12px;
	background-color: #6BB12C;
	border: none;
	border-radius: 5px;
	color: white;
	font-size: 16px;
	cursor: pointer;
}

form button:hover {
	background-color: #5CA024;
}

form a {
	color: #6BB12C;
	text-decoration: none;
	display: inline-block;
	margin-top: 15px;
	font-size: 14px;
}

form a:hover {
	text-decoration: underline;
}

.welcome-message {
	text-align: center;
	font-size: 20px;
	color: #333;
	margin-top: 40px;
}
</style>
</head>
<body>
	<header> 환영합니다 </header>
	<nav>
		<a href="/board/list">게시물 목록</a> <a href="/board/write">게시물 작성</a> <a
			href="/board/uploadForm">파일 업로드</a> <a href="/board/uploadAjax">파일
			업로드(Ajax)</a>
	</nav>
	<c:if test="${ member == null }">
		<form role="form" method="post" autocomplete="off"
			action="/member/login">
			<p>
				<label for="userID">아이디</label> <input type="text" id="userID"
					name="UserID" required>
			</p>
			<p>
				<label for="userPW">비밀번호</label> <input type="password" id="userPW"
					name="userPW" required>
			</p>
			<p>
				<button type="submit">로그인</button>
			</p>
			<p>
				<a href="/member/register">회원가입</a>
			</p>
		</form>
	</c:if>

	<c:if test="${ msg == false }">
		<p style="color: #f00; text-align: center;">로그인에 실패 했습니다. 아이디 또는
			패스워드를 다시 입력하세요.</p>
	</c:if>

	<c:if test="${ member != null }">
		<p style="color: 888; text-align: center;">${ member.userName }님
			환영합니다</p>
		<a href="member/delete">회원탈퇴</a>
		<a href="member/update">회원정보 수정</a>
		<a href="member/logout">로그아웃</a>
	</c:if>

</body>
</html>
