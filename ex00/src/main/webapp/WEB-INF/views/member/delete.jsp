<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
</head>
<body>
	<form role="form" method="post" autocomplete="off">
		<p>
			<label for="userID">아이디</label> <input type="text" id="userID"
				name="UserID" value="${ member.userID }">
		</p>

		<p>
			<label for="userPW">패스워드</label> <input type="password" id="userPW"
				name="userPW">
		</p>

		<p>
			<button type="submit">회원 탈퇴</button>
		</p>
		<p>
			<a href="/">처음으로</a>
		</p>

		<c:if test="${ msg == false }">
			<p style="color: #f00;">입력한 비밀번호가 잘못되었습니다.</p>
		</c:if>

	</form>
</body>
</html>