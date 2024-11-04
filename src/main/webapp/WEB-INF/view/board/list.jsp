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
        }

        .pagination {
            width: 300px;
            margin: 0 auto;
        }

        .pagination ul {
            display: flex;
            height: 35px;
            vertical-align: center;
            border: 1px solid var(--table-border-color);
            box-sizing: border-box;
        }

        .pagination ul li {
            width: 30px;
            text-align: center;
            border: 1px solid var(--table-border-color);
            box-sizing: border-box;
        }

        .pagination .active {
            font-weight: bold;
        }
    </style>
</head>

<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <h1>게시판</h1>

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

    <div class="search">
        <form action="">
            <label for="input-search">검색</label>
            <input type="text" id="input-search">
        </form>
    </div>

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
