<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul>
    <c:choose>
        <c:when test="${member == null}">
            <li><a href="/member/signin">로그인</a></li>
            <li><a href="/member/signup">회원가입</a></li>
        </c:when>
        <c:otherwise>
            <li>${member.userName}님 환영합니다.</li>
            <c:if test="${member.verify == 9}">
                <li><a href="/admin/index">관리자 화면</a></li>
            </c:if>
            <li><a href="/board/listPageSearch?num=1">게시판</a></li>
            <li><a href="/board/write">글작성</a></li>
            <li><a href="/shop/cartList">장바구니</a></li>
            <li><a href="/shop/orderList">장바구니</a></li>
            <li><a href="/member/signout">로그아웃</a></li>
        </c:otherwise>
    </c:choose>
</ul>
