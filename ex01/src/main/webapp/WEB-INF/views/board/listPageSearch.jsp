<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>페이징 + 검색</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 8px 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #f4f4f4;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        a {
            color: #3498db;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        #nav {
            margin-top: 20px;
        }

        .pagination, .search {
            text-align: center;
            margin: 20px 0;
        }

        .pagination span, .pagination a {
            margin: 0 5px;
        }

        .search select, .search input, .search button {
            margin: 0 5px;
        }
    </style>
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
            <c:forEach items="${list}" var="item">
                <tr>
                    <td>${item.bno}</td>
                    <td><a href="/board/view?bno=${item.bno}">${item.title}</a></td>
                    <td><fmt:formatDate value="${item.regDate}" pattern="yyyy.MM.dd (E) a HH:mm:ss" timeZone="UTC"/></td>
                    <td>${item.writer}</td>
                    <td>${item.viewCnt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <c:if test="${page.prev}">
            <span>[ <a href="/board/listPageSearch?num=${page.startPageNum - 1}${page.searchTypeKeyword}">이전</a> ]</span>
        </c:if>

        <c:forEach begin="${page.startPageNum}" end="${page.endPageNum}" var="num">
            <span>
                <c:choose>
                    <c:when test="${select == num}">
                        <b>${num}</b>
                    </c:when>
                    <c:otherwise>
                        <a href="/board/listPageSearch?num=${num}${page.searchTypeKeyword}">${num}</a>
                    </c:otherwise>
                </c:choose>
            </span>
        </c:forEach>

        <c:if test="${page.next}">
            <span>[ <a href="/board/listPageSearch?num=${page.endPageNum + 1}${page.searchTypeKeyword}">다음</a> ]</span>
        </c:if>
    </div>

    <div class="search">
        <select name="searchType">
            <option value="title" <c:if test="${searchType eq 'title'}">selected</c:if>>제목</option>
            <option value="content" <c:if test="${searchType eq 'content'}">selected</c:if>>내용</option>
            <option value="title_content" <c:if test="${searchType eq 'title_content'}">selected</c:if>>제목+내용</option>
            <option value="writer" <c:if test="${searchType eq 'writer'}">selected</c:if>>작성자</option>
        </select>
        <input type="text" name="keyword" value="${keyword}">
        <button type="button" id="searchBtn">검색</button>
    </div>

    <script>
        document.getElementById("searchBtn").addEventListener("click", function() {
            const searchType = document.querySelector("select[name='searchType']").value;
            const keyword = document.querySelector("input[name='keyword']").value;
            location.href = `/board/listPageSearch?num=1&searchType=${searchType}&keyword=${keyword}`;
        });
    </script>
</body>
</html>
