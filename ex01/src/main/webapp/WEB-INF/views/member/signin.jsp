<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="../css/main_member_signin.css">
</head>
<body>
	<section id="content">
		<form role="form" method="post" autocomplete="off">
			<div class="input_area">
				<label for="userId">아이디</label>
				<input type="email" id="userId" name="userId" required="required">
			</div>
			
			<div class="input_area">
				<label for="userPass">패스워드</label>
				<input type="password" id="userPass" name="userPass" required="required">
			</div>
			
			<button type="submit" id="signin_btn" name="signin_btn">로그인</button>
			
			<c:if test="${ msg == false }">
				<p style="color: #f00; ">로그인에 실패 했습니다. 아이디 또는 패스워드를 다시 입력하세요.</p>
			</c:if>
		</form>
	</section>
</body>
</html>