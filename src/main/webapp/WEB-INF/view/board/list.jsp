<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>게시판</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .container {
            max-width: 700px;
            height: 700px;
        }

        .list-header {
            display: flex;
            position: relative;
        }

        .list-header .search form {
            display: flex;
        }

        .list-header .button-wrap {
            position: absolute;
            right: 0;
        }

        .list-header .search-button button {
            cursor: pointer;
            height: 40px;
            padding: 0 15px;
            border-radius: 0 5px 5px 0;
            margin-left: -5px;
        }

        .table-list thead tr .th-id {
            width: 7%;
        }

        .table-list thead tr .th-title {
            width: 45%;
        }

        .table-list thead tr .th-writer {
            width: 25%;
        }

        .table-list thead tr .th-date {
            width: 18%;
        }

        .table-list tbody .pinned {
            background-color: #f8f9fa;
            border-left: 4px solid #e63a3a;
        }

        .table-list tbody .td-id {
            font-size: var(--small-font-size);
        }

        .table-list tbody .td-date {
            font-size: var(--small-font-size);
        }

        .pagination {
            width: 490px;
            margin: 30px auto;
        }

        .pagination ul {
            display: flex;
            justify-content: center;
        }

        .pagination ul li {
            height: 35px;
            width: 7%;
            line-height: 35px;
            text-align: center;
            border-radius: 20px;
            font-size: var(--small-font-size);
        }

        .pagination ul li:hover {
            background: var(--table-hover-color);
        }

        .pagination ul li a {
            border-radius: 20px;
            color: var(--btn-normal-info);
            vertical-align: middle;
        }

        .pagination .active {
            color: var(--btn-normal-dark);
            font-weight: bold;
            background: var(--table-header-color);
        }
    </style>
</head>

<body>
<c:import url="/WEB-INF/fragment/navbar.jsp">
    <c:param name="active" value="list"/>
</c:import>

<%-- 로그인 여부 --%>
<c:set value="${not empty sessionScope.loggedInMember}" var="loggedIn"/>

<div class="container">
    <h1>게시판</h1>

    <div class="list-header">
        <%-- 검색 form --%>
        <div class="search">
            <form action="">
                <div class="search-select">
                    <select name="search" id="select-category">
                        <option value="all">전체</option>
                        <option value="title" ${param.search == 'title' ? 'selected' : ''}>제목</option>
                        <option value="content" ${param.search == 'content' ? 'selected' : ''}>본문</option>
                        <option value="writer" ${param.search == 'writer' ? 'selected' : ''}>작성자</option>
                    </select>
                </div>

                <div class="search-input">
                    <input type="text" title="검색" name="keyword" value="${param.keyword}">
                </div>

                <div class="search-button">
                    <button class="btn-dark" title="검색하기">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </div>
            </form>
        </div>

        <c:if test="${loggedIn}">
            <div class="button-wrap">
                <a href="/board/new" class="btn btn-dark" title="글 작성">
                    <i class="fa-solid fa-pen"></i>
                </a>
            </div>
        </c:if>
    </div>

    <table class="table-list">
        <thead>
        <tr>
            <th class="th-id">#</th>
            <th class="th-title">제목</th>
            <th class="th-writer">작성자</th>
            <th class="th-date">작성일</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${boardList}" var="board">
            <tr onclick="location.href='/board/view?id=${board.id}'" class="${board.pinned ? 'pinned' : ''}">
                <td class="td-id">${board.id}</td>
                <td>${board.title}</td>
                <td>${board.writerNickname}</td>
                <td class="td-date">${board.created}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav class="pagination">
        <ul>
            <%-- 이전 --%>
            <c:if test="${pageInfo.hasPrevPage}">
                <c:url value="/board/list" var="pageLink">
                    <c:param name="page" value="${pageInfo.prevPageNumber}"/>
                    <c:param name="search" value="${param.search}"/>
                    <c:param name="keyword" value="${param.keyword}"/>
                </c:url>

                <li>
                    <a href="${pageLink}" aria-label="Previous">&laquo;</a>
                </li>
            </c:if>

            <%-- 숫자 --%>
            <c:forEach begin="${pageInfo.beginPageNumber}" end="${pageInfo.endPageNumber}" var="pageNumber">
                <c:url value="/board/list" var="pageLink">
                    <c:param name="page" value="${pageNumber}"/>
                    <c:param name="search" value="${param.search}"/>
                    <c:param name="keyword" value="${param.keyword}"/>
                </c:url>

                <li>
                    <a href="${pageLink}"
                       class="${pageInfo.currentPageNumber == pageNumber ? 'active' : ''}">${pageNumber}</a>
                </li>
            </c:forEach>


            <%-- 다음 --%>
            <c:if test="${pageInfo.hasNextPage}">
                <c:url value="/board/list" var="pageLink">
                    <c:param name="page" value="${pageInfo.nextPageNumber}"/>
                    <c:param name="search" value="${param.search}"/>
                    <c:param name="keyword" value="${param.keyword}"/>
                </c:url>

                <li>
                    <a href="${pageLink}" aria-label="Next">&raquo;</a>
                </li>
            </c:if>

        </ul>
    </nav>
</div>
</body>
</html>
