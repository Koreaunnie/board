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
    </style>
</head>

<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<!-- alert -->
<c:if test="${not empty message}">
    <div class="alert alert-${message.type}" role="alert">
            ${message.text}
    </div>
</c:if>

<div class="container">
    <form>
        <fieldset>
            <legend>${board.id}번 게시물</legend>

            <ul>
                <li>
                    <label for="input-title">제목</label>
                    <input type="text" id="input-title" value="${board.title}" readonly>
                </li>

                <li>
                    <label for="textarea-content">내용</label>
                    <textarea id="textarea-content" cols="30" rows="10" readonly>${board.content}</textarea>
                </li>

                <li>
                    <label for="input-writer">작성자</label>
                    <input type="text" id="input-writer" value="${board.writer}" readonly>
                </li>

                <li>
                    <label for="input-date">작성일</label>
                    <input type="text" id="input-date" value="${board.created}" readonly>
                </li>
            </ul>
        </fieldset>
    </form>

    <div class="button-wrap">
        <ul>
            <li>
                <form action="board/edit" method="get" onclick="return confirm('이 게시물을 수정하시겠습니까?');">
                    <a href="/board/edit?id=${board.id}" class="btn btn-dark">수정</a>
                </form>
            </li>

            <li>
                <form action="/board/delete" method="post" onsubmit="return confirm('정말로 이 게시물을 삭제하시겠습니까?');">
                    <input type="hidden" name="id" value="${board.id}">
                    <button type="submit" class="btn-warning">삭제</button>
                </form>
            </li>
        </ul>
    </div>
</div>

<%-- modal (js 필요) --%>
<%--    <div class="modal-wrap">--%>
<%--        <div class="modal-content">--%>
<%--            <div class="modal-header">--%>
<%--                <h5 id="deleteConfirmModal">삭제 확인</h5>--%>
<%--            </div>--%>

<%--            <div class="modal-body">--%>
<%--                정말로 이 게시물을 삭제하시겠습니까?--%>
<%--            </div>--%>

<%--            <div class="modal-footer">--%>
<%--                <button type="button" class="btn-dark-outline">--%>
<%--                    닫기--%>
<%--                </button>--%>

<%--                <button type="button" form="form-delete" class="btn-warning">--%>
<%--                    삭제--%>
<%--                </button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>

</body>
</html>
