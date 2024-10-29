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
</head>

<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <form>
        <fieldset>
            <legend>${board.id}번 게시물</legend>

            <ul>
                <li>
                    <label for="input-title">제목</label>
                    <input type="text" id="input-title" value="${board.title}">
                </li>

                <li>
                    <label for="textarea-content">내용</label>
                    <textarea id="textarea-content" cols="30" rows="10">${board.content}</textarea>
                </li>

                <li>
                    <label for="input-writer">작성자</label>
                    <input type="text" id="input-writer" value="${board.writer}">
                </li>

                <li>
                    <label for="input-date">작성일</label>
                    <input type="text" id="input-date" value="${board.created}">
                </li>
            </ul>
        </fieldset>
    </form>

    <div class="button-wrap">
        <ul>
            <li>
                <button>
                    <a href="/board/edit?id=${board.id}">수정</a>
                </button>
            </li>

            <li>
                <button data-as>삭제</button>
            </li>
        </ul>
    </div>


    <div class="modal-wrap">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="deleteConfirmModal">삭제 확인</h5>
                <button type="button">

                </button>
            </div>

            <div class="modal-body">
                정말로 이 게시물을 삭제하시겠습니까?
            </div>

            <div class="modal-footer">
                <button type="button">닫기</button>
                <button type="button" form="form-delete">삭제</button>
            </div>
        </div>
    </div>

    <div class="form-wrap">
        <form action="/board/delete" method="post" id="form-delete" data-bs-target="#deleteConfirmModal">
            <input type="hidden" name="id" value="${board.id}">
        </form>
    </div>

</div>
</body>
</html>
