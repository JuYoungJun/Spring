<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/admin_goods_list.css">
</head>
<body>
	<div id = "root">
		<header id = "header">
			<div id = "header_box">
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>
		
		<nav id = "nav">
			<div id = "nav_box">
				<%@ include file="../include/nav.jsp" %>
			</div>
		</nav>
		
		<section id = "container">
			<aside>
				<%@ include file = "../include/aside.jsp" %>
			</aside>
			<div id="container_box">
				<table>
					<thead>
						<tr>
							<th>썸네일</th>
							<th>이름</th>
							<th>카테고리</th>
							<th>가격</th>
							<th>수량</th>
							<th>등록날짜</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><img src="${list.gdsThumbImg}"></td>
								<td>
								<a href="/admin/goods/view?n=${list.gdsNum}">${list.gdsName}</a>
								</td>
								<td>${list.cateCode}</td>
								<td>
								<fmt:formatNumber value="${list.gdsPrice}" pattern="###,###,###"/>
								</td>
								<td>${list.gdsStock}</td>
								<td>
								<fmt:formatDate value="${list.gdsDate}" pattern="yyyy.MM.dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
		
		
		<footer id = "footer">
			<div id = "footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
</body>
</html>