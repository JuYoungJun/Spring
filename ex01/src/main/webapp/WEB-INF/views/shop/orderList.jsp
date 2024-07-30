<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>주문 목록</title>
	<link rel="stylesheet" type="text/css" href="../css/main_shop_orderlist.css">
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
		<div id="container_box">
		
			<section id="content">
				
				 <ul class="orderList">
    				<c:forEach items="${orderList}" var="orderList">
    					<li>
    					<div>
     						<p><span>주문번호 <a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
     						<p><span>수령인 ${orderList.orderRec}</p>
     						<p><span>주소 (${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
     						<p><span>가격 <fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
    					</div>
    					</li>
    				</c:forEach>
   				</ul>

			</section>
			
			<aside id="aside">
				<%@ include file="../include/aside.jsp" %>
			</aside>
			
		</div>
	</section>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp" %>
		</div>		
	</footer>

</div>
</body>
</html>