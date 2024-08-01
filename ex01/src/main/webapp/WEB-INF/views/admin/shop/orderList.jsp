<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/admin_goods_orderlist.css">
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>

		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>

		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp"%>
			</aside>
			<div id="container_box">

				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
						<li>
							<div>
								<p><span>주문번호</span> <a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
								<p><span>주문자</span> ${orderList.userId}</p>
								<p><span>수령인</span> ${orderList.orderRec}</p>
								<p><span>주소</span> (${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
								<p><span>가격</span> <fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
								<p><span>상태</span> ${orderList.delivery}</p>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</section>

		<footer id="footer">
			<div id="footer_box">
				<%@ include file="../include/footer.jsp"%>
			</div>
		</footer>
	</div>
</body>
</html>
