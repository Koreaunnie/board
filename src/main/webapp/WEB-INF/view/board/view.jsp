<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>게시판 > 게시물 보기</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .container {
            max-width: 700px;
        }

        .table-view {
            border-collapse: collapse;
            width: 100%;
            text-align: center;
        }

        .table-view thead tr {
            border-top: 1px solid #000;
            background: var(--table-header-color);
            border-bottom: 1px solid var(--table-border-color);
        }

        .table-view thead .tr-title {
            height: 50px;
            font-size: 1.2rem;
        }

        .table-view thead .tr-subtitle {
            height: 40px;
        }

        .table-view thead tr .th-writer {
            width: 60%;
            text-align: left;
            padding-left: 20px;
            font-weight: normal;
        }

        .table-view thead tr .th-date {
            width: 40%;
            text-align: right;
            padding-right: 20px;
            font-weight: normal;
            font-size: 0.9rem;
        }

        .table-view tbody {
            width: 100%;
            height: 500px;
        }

        .table-view tbody tr td {
            border-bottom: 1px solid var(--table-border-color);
            width: 100%;
        }

        .table-view tbody .table-td-content {
            text-align: left;
            vertical-align: top;
            padding: 30px;
        }

        .button-wrap {
            margin-top: 30px;
        }

        .button-wrap ul li {
            margin: 0 15px;
        }
    </style>
</head>

<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<%-- 수정 / 삭제 권한--%>
<c:set value="${sessionScope.loggedInMember.id == board.writer}" var="hasAccess"/>

<!-- alert -->
<c:if test="${not empty message}">
    <div class="alert alert-${message.type}" role="alert">
            ${message.text}
    </div>
</c:if>

<div class="container">
    <h1>게시판</h1>

    <table class="table-view">
        <thead>
        <tr class="tr-title">
            <th colspan="2">${board.title}</th>
        </tr>

        <tr class="tr-subtitle">
            <th class="th-writer">${board.writerNickname}</th>
            <th class="th-date">${board.created}</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td colspan="2" class="table-td-content">${board.content}</td>
        </tr>
        </tbody>
    </table>

    <c:if test="${hasAccess}">
        <div class="button-wrap">
            <ul class=>
                <li>
                    <a href="/board/edit?id=${board.id}" onclick="return confirm('게시물을 수정하시겠습니까?');"
                       class="btn btn-dark">
                        수정
                    </a>
                </li>

                <li>
                    <form action="/board/delete" method="post" onsubmit="return confirm('게시물을 삭제하시겠습니까?');">
                        <input type="hidden" name="id" value="${board.id}">
                        <button type="submit" class="btn btn-warning">삭제</button>
                    </form>
                </li>
            </ul>
        </div>
    </c:if>
</div>
</body>
</html>
