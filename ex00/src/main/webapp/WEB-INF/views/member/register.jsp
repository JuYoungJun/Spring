<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
        $(document).ready(function() {
            var formSubmitted = false; // 폼이 제출되었는지 여부를 나타내는 변수 추가

            // 폼 제출 핸들링
            $('#add_member_form').submit(function(event) {
                event.preventDefault();

                // reCAPTCHA 응답 가져오기
                var captcha = grecaptcha.getResponse();

                if (captcha === "") {
                    alert("reCAPTCHA를 완료해주세요.");
                    return;
                }

                console.log("Sending reCAPTCHA token: " + captcha);

                $.ajax({
                    url: '/pro/VerifyRecaptcha',
                    type: 'post',
                    data: {
                        'g-recaptcha-response': captcha
                    },
                    dataType: 'json', // 응답을 JSON으로 파싱하도록 설정
                    success: function(response) {
                        if (response.success) {
                            // 폼을 다시 제출하지 않고 바로 서버로 보냅니다.
                            if (!formSubmitted) {
                                formSubmitted = true; // 폼이 한 번 제출되었음을 표시
                                $('#add_member_form').submit(); // 폼 제출
                            }
                        } else {
                            alert("reCAPTCHA 검증에 실패하였습니다.");
                            grecaptcha.reset(); // reCAPTCHA를 초기화하여 새로운 검증을 받도록 함
                        }
                    },
                    error: function() {
                        alert("서버와의 통신 중 오류가 발생했습니다.");
                    }
                });
            });

            // ID 중복 체크 핸들링
            $(".IDCheck").click(function() {
                var query = { userID: $("#userID").val() };

                $.ajax({
                    url: "/member/IDCheck",
                    type: "post",
                    data: query,
                    success: function(data) {
                        if (data == 1) {
                            $(".result .msg").text("사용불가");
                            $(".result .msg").css("color", "#f00");
                            $("#submit").attr("disabled", "disabled");
                        } else {
                            $(".result .msg").text("사용가능");
                            $(".result .msg").css("color", "#00f");
                            $("#submit").removeAttr("disabled");
                        }
                    },
                    error: function() {
                        alert("서버와의 통신 중 오류가 발생했습니다.");
                    }
                }); 
            });

            $("#userID").keyup(function() {
                $(".result .msg").text("아이디를 확인해주십시오.");
                $(".result .msg").css("color", "#000");
                $("#submit").attr("disabled", "disabled");
            });
        });
    </script>
</head>
<body>
	<form id="add_member_form" role="form" method="post"
		action="/pro/processSignup" autocomplete="off">
		<p>
			<label for="userID">아이디</label> <input type="text" id="userID"
				name="userID">
			<button type="button" class="IDCheck">아이디 확인</button>
		</p>

		<p class="result">
			<span class="msg">아이디를 확인해주세요.</span>
		</p>

		<p>
			<label for="userPW">패스워드</label> <input type="password" id="userPW"
				name="userPW" required="required">
		</p>

		<p>
			<label for="userName">닉네임</label> <input type="text" id="userName"
				name="userName" required="required">
		</p>

		<div class="g-recaptcha"
			data-sitekey="6Le1WwwqAAAAAOoVBRvq47YLOssU52zhYayByLyw"></div>

		<p>
			<button type="submit" id="submit" disabled="disabled">가입</button>
		</p>
		<p>
			<a href="/">처음으로</a>
		</p>
	</form>
</body>
</html>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
</head>
<body>
	<form id="add_member_form" role="form" method="post" autocomplete="off">
		<p>
			<label for="userID">아이디</label>
			<input type="text" id="userID" name="UserID">
			<button type="button" class="IDCheck">아이디확인</button>			
		</p>

		<p class = "result">
			<span class="msg">아이디를 확인해주십시오.</span>
		</p>
		
		<p>
			<label for="userPW">패스워드</label>
			<input type="password" id="userPW" name="userPW" required="required">
		</p>
		
		<p>
			<label for="userName">닉네임</label>
			<input type="text" id="userName" name="userName" required="required">
		</p>
		
		 <div class="g-recaptcha" data-sitekey="6Le1WwwqAAAAAOoVBRvq47YLOssU52zhYayByLyw"></div>
		
		<p><button type="submit" id = "submit" disabled="disabled">가입</button></p>
		<p><a href="/">처음으로</a></p>
	</form>
	
<!-- 	<script>
		$(".IDCheck").click(function() {

			var query = { userID: $("#userID").val() };
			
			$("#userID").keyup(function(){
				$(".result .msg").text("아이디를 확인해주십시오.");
				$(".result .msg").attr("style", "color:#000");
				
				$("#submit").attr("disabled", "disabled");
			});

			$.ajax({
				url: "/member/IDCheck",
				type: "post",
				data: query,

				success: function(data) {

					if (data == 1) {
						$(".result .msg").text("사용불가");
						$(".result .msg").attr("style", "color:#f00");
					
						$("#submit").attr("disabled", "disabled");
					} else {
						$(".result .msg").text("사용가능");
						$(".result .msg").attr("style", "color:#00f");
					
						$("#submit").removeAttr("disabled");
					}
				}
			}); 
		});
	</script> -->
	
    <script src="https://www.google.com/recaptcha/api.js"></script>
    <script>
        $(function() {
            $('#add_member_form').submit(function(event) {
                // 기본 제출 동작 막기
                event.preventDefault();

                var captcha = $("#g-recaptcha-response").val();

                // reCAPTCHA 값 체크
                if (captcha === "" || captcha === undefined || captcha === null) {
                    alert("reCAPTCHA를 완료해주세요.");
                    return;
                }

                console.log("Sending reCAPTCHA token: " + captcha); // 디버깅 출력

                $.ajax({
                    url: '/pro/VerifyRecaptcha',
                    type: 'post',
                    data: {
                        'g-recaptcha-response': captcha
                    },
                    
                    success: function(data) {
                        console.log("Server response: " + data); // 디버깅 출력

                        switch (data) {
                            case 0:
                                console.log("자동 가입 방지 봇 통과");
                                $('#add_member_form')[0].submit(); // 폼 제출
                                break;
                            case 1:
                                alert("자동 가입 방지 봇을 확인한 뒤 진행해 주세요.");
                                break;
                            default:
                                alert("자동 가입 방지 봇을 실행하는 중 오류가 발생했습니다. [Error bot Code : " + Number(data) + "]");
                                break;
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("AJAX 오류:", status, error);
                        alert("서버 오류입니다. 다시 시도해주세요.");
                    }
                });
            });

            $(".IDCheck").click(function() {
                var query = { userID: $("#userID").val() };
                
                $("#userID").keyup(function(){
                    $(".result .msg").text("아이디를 확인해주십시오.");
                    $(".result .msg").attr("style", "color:#000");
                    
                    $("#submit").attr("disabled", "disabled");
                });

                $.ajax({
                    url: "/member/IDCheck",
                    type: "post",
                    data: query,

                    success: function(data) {
                        if (data == 1) {
                            $(".result .msg").text("사용불가");
                            $(".result .msg").attr("style", "color:#f00");
                        
                            $("#submit").attr("disabled", "disabled");
                        } else {
                            $(".result .msg").text("사용가능");
                            $(".result .msg").attr("style", "color:#00f");
                        
                            $("#submit").removeAttr("disabled");
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("AJAX 오류:", status, error);
                        alert("서버 오류입니다. 다시 시도해주세요.");
                    }
                }); 
            });
        });
    </script>
	
</body>
</html> --%>
