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
<style>
body {
	font-family: Arial, sans-serif;
	margin: 20px;
	padding: 0;
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

	<br>
	<br>
	<h3>-----------------------------댓글-----------------------------</h3>

	<!-- 게시물 끝 -->

	<!-- 댓글 작성 폼 -->
	<%-- 	<form method="post" action="/board/writeReply">
		<input type="hidden" name="bno" value="${ view.bno }">
		<label>작성자</label>
		<input type="text" name="writer" required value="${ member.userName }"><br>
		<label>내용</label>
		<textarea rows="3" cols="50" name="content" required></textarea><br>
		<button type="submit">댓글 작성</button>
	</form> --%>

	<!-- 댓글 작성 폼 -->
	<form method="post" action="/board/writeReply">
		<input type="hidden" name="bno" value="${ view.bno }"> <label>작성자</label>
		<c:choose>
			<c:when test="${ not empty member.userName }">
				<input type="text" name="writer" required
					value="${ member.userName }" readonly>
				<br>
			</c:when>
			<c:otherwise>
				<input type="text" name="writer" required>
				<br>
			</c:otherwise>
		</c:choose>
		<label>내용</label>
		<textarea rows="3" cols="50" name="content" required></textarea>
		<br>
		<button type="submit">댓글 작성</button>
	</form>

	<div id="reply">
		<ol class="replyList">
			<c:forEach items="${ repList }" var="repList">
				<li>
					<p>
						작성자 : ${ repList.writer } <br> 작성 날짜 :
						<fmt:formatDate value="${ repList.regDate }"
							pattern="yyyy-MM-dd HH:mm:ss" timeZone="UTC" />
					</p>

					<p>${ repList.content }</p>

					<div>
						<%-- <a href="/board/modifyReply?rno=${ repList.rno }&bno=${ view.bno }">댓글 수정</a> --%>
						<a href="javascript:void(0)"
							onclick="showModifyForm(${ repList.rno })">댓글 수정</a>
						<%-- <a href="/board/deleteReply?rno=${ repList.rno }&bno=${ view.bno }">댓글 삭제</a> --%>
						<c:if test="${repList.writer eq member.userName}">
							<a href="/board/deleteReply?rno=${repList.rno}&bno=${view.bno}">댓글
								삭제</a>
						</c:if>
					</div> <!-- 댓글 수정 폼 -->
					<div id="modifyReplyForm${ repList.rno }" style="display: none;">
						<form method="post" action="/board/modifyReply">
							<input type="hidden" name="rno" value="${ repList.rno }">
							<input type="hidden" name="bno" value="${ view.bno }"> <label>작성자</label>
							<input type="text" name="writer" value="${ repList.writer }"
								readonly><br> <label>내용</label>
							<textarea rows="3" cols="50" name="content" required>${ repList.content }</textarea>
							<br>
							<button type="submit">수정완료</button>
							<button type="button" onclick="hideModifyForm(${ repList.rno })">취소</button>
						</form>
					</div>

				</li>
			</c:forEach>
		</ol>
	</div>

	<script>
    	function showModifyForm(rno) {
        	$('#modifyReplyForm' + rno).show(); // 댓글 수정폼 보이게 함
    	}
    
    	function hideModifyForm(rno){
        	$('#modifyReplyForm' + rno).hide(); // 댓글 수정폼 숨김
    	}
    
    	function submitModifyForm(rno){
        	var form = $('#modifyReplyForm' + rno + ' form'); // 해당 댓글 수정 폼 선택
        	var formData = form.serialize(); 
        
        	$.ajax({
            	type : 'post',
            	url : '/board/modifyReply',
            	data : formData,
            	success : function(response) {
                	// 수정 성공 시 폼 숨김
                	hideModifyForm(rno);
            	}
        	});
    	}
	</script>

</body>
</html>
