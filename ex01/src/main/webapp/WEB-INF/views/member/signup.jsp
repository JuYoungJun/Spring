<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="../css/main_member_signup.css">
</head>
<body>
	<section id = "content">
		<form role="form" method="post" autocomplete="off">
			<div class="input_area">
				<label for="userId">아이디</label>
				<input type="email" id="userId" name="userId" placeholder="example@email.com" required="required">
			</div>
			
			<div class="input_area">
				<label for="userPass">패스워드</label>
				<input type="password" id="userPass" name="userPass" required="required">
			</div>
			
			<div class="input_area">
				<label for="userName">이름</label>
				<input type="text" id="userName" name="userName" placeholder="이름을 입력해주세요" required="required">
			</div>
			
			<div class="input_area">
				<label for="userPhone">연락처</label>
				<input type="tel" id="userPhone" name="userPhone" placeholder="연락처를 입력해주세요" required="required">
			</div>
			
			<button type="submit" id="signup_btn" name="signup_btn">회원가입</button>
		</form>
	</section>
</body>
</html>