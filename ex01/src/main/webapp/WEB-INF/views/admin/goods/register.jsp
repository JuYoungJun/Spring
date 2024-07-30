<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록 페이지</title>
<link rel="stylesheet" type="text/css" href="/css/admin_goods_register.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
    var categoryJson = ${category};
</script>
<script type="text/javascript" src="/js/admin_goods_register.js"></script>
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
                <h2>상품등록</h2>
                
                <form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
                    <div class="inputArea">   
                        <label>1차 분류</label>
                        <select class="category1">
                            <option value="">전체</option>
                        </select>

                        <label>2차 분류</label>
                        <select class="category2" name="cateCode">
                            <option value="">전체</option>
                        </select>
                    </div>

                    <div class="inputArea">
                        <label for="gdsName">상품명</label>
                        <input type="text" id="gdsName" name="gdsName" />
                    </div>

                    <div class="inputArea">
                        <label for="gdsPrice">상품가격</label>
                        <input type="text" id="gdsPrice" name="gdsPrice" />
                    </div>

                    <div class="inputArea">
                        <label for="gdsStock">상품수량</label>
                        <input type="text" id="gdsStock" name="gdsStock" />
                    </div>

                    <div class="inputArea">
                        <label for="gdsDes">상품소개</label>
                        <textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
                    </div>
                    
                    <div class="inputArea">
                        <label for="gdsImg">이미지</label>
                        <input type="file" id="gdsImg" name="file" />
                        <div class="select_img">
                            <img src=""/>
                        </div>
                    </div>
                    <%=request.getRealPath("/") %>

                    <div class="inputArea">
                        <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
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
