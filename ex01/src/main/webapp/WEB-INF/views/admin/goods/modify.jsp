<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정 페이지</title>
<style>
    body { font-family:'맑은 고딕', verdana; padding:0; margin:0; }
    ul { padding:0; margin:0; list-style:none; }
    div#root { width:90%; margin:0 auto; }
    header#header { font-size:60px; padding:20px 0; }
    header#header h1 a { color:#000; font-weight:bold; }
    nav#nav { padding:10px; text-align:right; }
    nav#nav ul li { display:inline-block; margin-left:10px; }
    section#container { padding:20px 0; border-top:2px solid #eee; border-bottom:2px solid #eee; }
    section#container::after { content:""; display:block; clear:both; }
    aside { float:left; width:200px; }
    div#container_box { float:right; width:calc(100% - 200px - 20px); }
    aside ul li { text-align:center; margin-bottom:10px; }
    aside ul li a { display:block; width:100%; padding:10px 0;}
    aside ul li a:hover { background:#eee; }
    footer#footer { background:#f9f9f9; padding:20px; }
    footer#footer ul li { display:inline-block; margin-right:10px; }
    .inputArea { margin:10px 0; }
    select { width:150px; }
    label { display:inline-block; width:70px; padding:5px; }
    label[for='gdsDes'] { display:block; }
    input { width:150px; }
    textarea#gdsDes { width:400px; height:180px; }
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
                <form role="form" method="post" action="/admin/goods/modify" autocomplete="off">
                    <input type="hidden" name="gdsNum" value="${goods.gdsNum}" />
                    
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
                        <button type="submit" id="update_Btn">완료</button>
                        <button type="button" id="back_Btn">취소</button>  
                        
                        <script>
                            $("#back_Btn").click(function(){
                                location.href = "/admin/goods/view?n=" + ${goods.gdsNum};
                            });   
                            
                            var select_cateCode = '${goods.cateCode}';
                    		var select_cateCodeRef = '${goods.cateCodeRef}';
                    		var select_cateName = '${goods.cateName}';

                    		console.log("select_cateCode = " + select_cateCode);
                    		console.log("select_cateCodeRef = " + select_cateCodeRef);


                    		if(select_cateCodeRef != null && select_cateCodeRef != "") {
                    			
                    			console.log("값이 없으면");
                    			
                    			$(".category1").val(select_cateCodeRef);
                    			$(".category2").val(select_cateCode);
                    			$(".category2").children().remove();
                    			$(".category2").append("<option value='"
                    									+ select_cateCode + "'>" + select_cateName + "</option>");


                    			
                    			
                    		} else {
                    			
                    			console.log("값이 있으면");
                    			
                    			$(".category1").val(select_cateCode);
                    			//$(".category2").val(select_cateCode);
                    			$(".category2").append("<option value='"
                    					+ select_cateCode + "' selected='selected'>전체</option>");
                    		}

                        </script> 
                    </div>     
                </form>
            </div>
        </section>

        <script>
            // 컨트롤러에서 데이터 받기
            var jsonData = JSON.parse('${category}');
            console.log(jsonData);

            var cate1Arr = [];

            // 1차 분류 셀렉트 박스에 삽입할 데이터 준비
            for (var i = 0; i < jsonData.length; i++) {
                var cate = jsonData[i];
                cate1Arr.push({
                    cateCode: cate.cateCode,
                    cateName: cate.cateName
                });
            }

            // 1차 분류 셀렉트 박스에 데이터 삽입
            var cate1Select = $("select.category1");

            for (var i = 0; i < cate1Arr.length; i++) {
                cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>" + cate1Arr[i].cateName + "</option>");
            }
            
            // 1차 분류 선택 시 2차 분류 업데이트
            $(document).on("change", "select.category1", function() {
                var selectedCateCode = $(this).val();
                var cate2Select = $("select.category2");
                
                cate2Select.empty().append("<option value=''>전체</option>");
                
                for (var i = 0; i < jsonData.length; i++) {
                    var cate = jsonData[i];
                    if (cate.cateCodeRef === selectedCateCode) {
                        cate2Select.append("<option value='" + cate.cateCode + "'>" + cate.cateName + "</option>");
                    }
                }
            });

            // 페이지 로드 시 1차 분류가 이미 선택되어 있다면, 2차 분류를 업데이트
            $(document).ready(function() {
                var selectedCateCode = $("select.category1").val();
                if (selectedCateCode) {
                    $("select.category1").trigger("change");
                }
            });
        </script>

        <footer id="footer">
            <div id="footer_box">
                <%@ include file="../include/footer.jsp" %>
            </div>
        </footer>
    </div>
</body>
</html>
