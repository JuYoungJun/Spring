<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin_goods_modify.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    var categoryJson = ${category};
    var selectCateCode = "${goods.cateCode}";
    var selectCateCodeRef = "${goods.cateCodeRef}";
    var selectCateName = "${goods.cateName}";
    var gdsNum = "${goods.gdsNum}";
</script>
<script type="text/javascript" src="/js/admin_goods_modify.js"></script>
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
                <h2>상품 수정</h2>
                <form role="form" method="post" action="/admin/goods/modify" autocomplete="off" enctype="multipart/form-data">
                    <input type="hidden" id="gdsNum" name="gdsNum" value="${goods.gdsNum}" />
                    
                    <div class="inputArea">   
                        <label>1차 분류</label>
                        <select class="category1" name="cateCodeRef">
                            <option value="">전체</option>
                        </select>     
                        <label>2차 분류</label>
                        <select class="category2" name="cateCode">
                            <option value="">전체</option>
                        </select>
                    </div>
                    <div class="inputArea">
                        <label for="gdsName">상품명</label>
                        <input type="text" id="gdsName" name="gdsName" value="${goods.gdsName}" />
                    </div>
                    <div class="inputArea">
                        <label for="gdsPrice">상품가격</label>
                        <input type="text" id="gdsPrice" name="gdsPrice" value="${goods.gdsPrice}" />
                    </div>
                    <div class="inputArea">
                        <label for="gdsStock">상품수량</label>
                        <input type="text" id="gdsStock" name="gdsStock" value="${goods.gdsStock}" />
                    </div>
                    <div class="inputArea">
                        <label for="gdsDes">상품소개</label>
                        <textarea rows="5" cols="50" id="gdsDes" name="gdsDes">${goods.gdsDes}</textarea>
                    </div>
                    
                    <div class="inputArea">
                        <label for="gdsImg">이미지</label>
                        <input type="file" id="gdsImg" name="file" />
                        <div class="select_img">
                            <img src="${goods.gdsImg}" />
                            <input type="hidden" name="gdsImg" value="${goods.gdsImg}" />
                            <input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" />   
                        </div>
                    </div>
                    
                    <div class="inputArea">
                        <button type="submit" id="update_Btn">완료</button>
                        <button type="button" id="back_Btn">취소</button>  
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
