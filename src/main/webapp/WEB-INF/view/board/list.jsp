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

        .pagination {
            width: 300px;
            margin: 0 auto;
        }

        .pagination ul {
            display: flex;
        }

        .pagination ul li {
            height: 35px;
            width: 35px;
            line-height: 35px;
            text-align: center;
            margin: 5px;
            border-radius: 10px;
        }

        .pagination ul li:hover {
            background: var(--table-hover-color);
        }

        .pagination ul li a {
            border-radius: 10px;
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
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<%-- 로그인 여부 --%>
<c:set value="${not empty sessionScope.loggedInMember}" var="loggedIn"/>

<div class="container">
    <h1>게시판</h1>

    <div class="list-header">
        <div class="search">
            <form action="">
                <div class="search-select">
                    <select name="category" id="select-category">
                        <option value="all">전체</option>
                        <option value="title">제목</option>
                        <option value="content">본문</option>
                        <option value="writer">작성자</option>
                    </select>
                </div>

                <div class="search-input">
                    <input type="text" title="검색">
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
            <th>#</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${boardList}" var="board">
            <tr onclick="location.href='/board/view?id=${board.id}'">
                <td>${board.id}</td>
                <td>${board.title}</td>
                <td>${board.writer}</td>
                <td>${board.created}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <nav class="pagination">
        <ul>
            <%-- 이전 --%>
            <c:if test="${pageInfo.hasPreviousPage}">
                <c:url value="/board/list" var="pageLink">
                    <c:param name="page" value="${pageInfo.prevPageNumber}"/>
                </c:url>

                <li>
                    <a href="${pageLink}" aria-label="Previous">&laquo;</a>
                </li>
            </c:if>

            <%-- 숫자 --%>
            <c:forEach begin="${pageInfo.beginPageNumber}" end="${pageInfo.endPageNumber}" var="pageNumber">
                <c:url value="/board/list" var="pageLink">
                    <c:param name="page" value="${pageNumber}"/>
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
                </c:url>

                <li>
                    <a href="/board/list?page=${pageNumber}" aria-label="Next">&raquo;</a>
                </li>
            </c:if>

        </ul>
    </nav>


</div>
</body>
</html>
