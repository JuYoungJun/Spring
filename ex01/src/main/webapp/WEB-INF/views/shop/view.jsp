<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <title>상세페이지</title>
    <link rel="stylesheet" type="text/css" href="../css/main_shop_list.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="../js/main_shop_view.js"></script>
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
            <form role="form" method="post">
                <input type="hidden" id="gdsNum" name="gdsNum"
                    value="${view.gdsNum}" />
            </form>

            <div class="goods">
                <div class="goodsImg">
                    <img src="${view.gdsImg}">
                </div>

                <div class="goodsInfo">
                    <p class="gdsName">
                        <span>상품명 ${view.gdsName}</span>
                    </p>

                    <p class="cateName">
                        <span>카테고리 ${view.cateName}</span>
                    </p>

                    <p class="gdsPrice">
                        <span>가격 <fmt:formatNumber pattern="###,###,###"
                                value="${view.gdsPrice}" /> 원
                        </span>
                    </p>

                    <p class="gdsStock">
                        <span>재고 <fmt:formatNumber pattern="###,###,###"
                                value="${view.gdsStock}" /> EA
                        </span>
                    </p>

                    <p class="cartStock">
                        <span>구입 수량
                            <button type="button" class="plus">+</button> <input
                            type="number" class="numBox" min="1" max="${view.gdsStock}"
                            value="1" readonly="readonly" />
                            <button type="button" class="minus">-</button>
                        </span>
                    </p>

                    <p class="addToCart">
                        <button type="button" class="addCart_btn">카트에 담기</button>
                        <script type="text/javascript">
                        // 카트에 상품 추가 버튼 클릭 시 처리
                        $(".addCart_btn").click(function() {
                            var gdsNum = $("#gdsNum").val();
                            var cartStock = $(".numBox").val();
                            var data = {
                                gdsNum: gdsNum,
                                cartStock: cartStock
                            };

                            console.log("전송 데이터:", data); // 디버깅용

                            $.ajax({
                                url: "/shop/view/addCart",
                                type: "post",
                                data: data,
                                success: function(result) {
                                    if (result == 1) {
                                        alert("카트 담기 성공");
                                        $(".numBox").val("1"); // 수량을 1로 리셋
                                    } else {
                                        alert("회원만 사용할 수 있습니다.");
                                        $(".numBox").val("1"); // 수량을 1로 리셋
                                    }
                                },
                                error: function(xhr, status, error) {
                                    console.error("카트 담기 실패:", status, error);
                                    alert("카트 담기 실패. 다시 시도해 주세요.");
                                }
                            });
                        });
                        </script>
                    </p>
                </div>

                <div class="gdsDes">${view.gdsDes}</div>
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
