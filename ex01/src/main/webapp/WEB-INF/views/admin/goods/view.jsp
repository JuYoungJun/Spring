<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 보기 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin_goods_view.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/js/admin_goods_view.js"></script>
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
                <h2>상품정보</h2>
                
                <form role="form" method="post" autocomplete="off">
                
                    <input type="hidden" name="n" value="${goods.gdsNum}">
                    
                    <div class="inputArea">
                        <label>1차 분류</label> <span class="category1"> <label>2차 분류</label> <span class="category2">${goods.cateCode}</span>
                    </div>

                    <div class="inputArea">
                        <label for="gdsName">상품명</label> <span>${goods.gdsName}</span>
                    </div>

                    <div class="inputArea">
                        <label for="gdsPrice">상품가격</label> <span><fmt:formatNumber value="${goods.gdsPrice}" pattern="###,###,###" /></span>
                    </div>

                    <div class="inputArea">
                        <label for="gdsStock">상품수량</label> <span>${goods.gdsStock}</span>
                    </div>

                    <div class="inputArea">
                        <label for="gdsDes">상품소개</label> <span>${goods.gdsDes}</span>
                    </div>
                    
                    <!-- 이미지 표시 부분 -->
               		<div class="inputArea">
                        <label for="gdsImg">이미지</label>
                        <p>원본 이미지</p>
                        <img src="${goods.gdsImg}" class="oriImg"/>
                        
                        <p>썸네일</p>
                        <img src="${goods.gdsThumbImg}" class="thumbImg"/>
                    </div>
            
                    <div class="inputArea">
                        <button type="button" id="modify_Btn">수정</button>
                        <button type="button" id="delete_Btn">삭제</button>
                    </div>
                </form>
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
