<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이징 + 검색</title>
<link rel="stylesheet" type="text/css" href="../css/admin_board_listPageSearch.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="../js/admin_board_listPageSearch.js"></script>
</head>
<body>
    <div id="nav">
        <%@ include file="../include/nav.jsp"%>
    </div>

    <table>
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>작성자</th>
                <th>조회수</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach items="${ list }" var="list">
                <tr>
                    <td>${ list.bno }</td>
                    <td><a href="/board/view?bno=${ list.bno }">${ list.title }</a></td>
                    <td><fmt:formatDate value="${ list.regDate }" pattern="yyyy.MM.dd (E)a HH:mm:s" timeZone="UTC" /></td>
                    <td>${ list.writer }</td>
                    <td>${ list.viewCnt }</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div style="text-align: center;">
        <c:if test="${page.prev}">
            <span>[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}${ page.searchTypeKeyword }">이전</a> ]</span>
        </c:if>

        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            <span> <c:if test="${select != num}">
                <a href="/board/listPageSearch?num=${num}${ page.searchTypeKeyword }">${num}</a>
                </c:if> <c:if test="${select == num}">
                <b>${num}</b>
                </c:if>
            </span>
        </c:forEach>

        <c:if test="${page.next}">
            <span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}${ page.searchTypeKeyword }">다음</a> ]</span>
        </c:if>
    </div>

    <div>
        <select name="searchType">
            <option value="title" <c:if test="${ searchType eq 'title' }">selected</c:if>>제목</option>
            <option value="content" <c:if test="${ searchType eq 'content' }">selected</c:if>>내용</option>
            <option value="title_content" <c:if test="${ searchType eq 'title_content' }">selected</c:if>>제목+내용</option>
            <option value="writer" <c:if test="${ searchType eq 'writer' }">selected</c:if>>작성자</option>
        </select>
        <input type="text" name="keyword" value="${ keyword }">
        <button type="button" id="searchBtn">검색</button>
    </div>
</body>
</html>
