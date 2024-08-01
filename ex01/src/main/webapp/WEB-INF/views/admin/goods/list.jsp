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
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp" %>
			</div>
		</header>
		
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp" %>
			</div>
		</nav>
		
		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp" %>
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
						<c:forEach items="${list}" var="item">
							<tr>
								<td><img src="${item.gdsThumbImg}" class="thumb-img"></td>
								<td>
								<a href="/admin/goods/view?n=${item.gdsNum}">${item.gdsName}</a>
								</td>
								<td>${item.cateName}</td>
								<td>
								<fmt:formatNumber value="${item.gdsPrice}" pattern="###,###,###"/>
								</td>
								<td>${item.gdsStock}</td>
								<td>
								<fmt:formatDate value="${item.gdsDate}" pattern="yyyy.MM.dd"/>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</section>
		
		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp" %>
			</div>
		</footer>
	</div>
	
	<script>
    $(document).ready(function() {
        $('.thumb-img').each(function() {
            var src = $(this).attr('src').replace(/\\/g, '/');
            console.log('Image source:', src);

            $(this).attr('src', src);

            $(this).on('load', function() {
                console.log('Loaded image source:', $(this).attr('src'));
            }).on('error', function() {
                console.error('Image failed to load:', $(this).attr('src'));
            });
        });
    });
    </script>
</body>
</html>
