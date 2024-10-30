<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>게시판 > 게시물 작성</title>

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
    <form method="post">
        <fieldset>
            <legend>게시물 작성</legend>

            <ul>
                <li>
                    <label for="input-title">제목 *</label>
                    <input type="text" id="input-title" name="title" required>
                </li>

                <li>
                    <label for="textarea-content">내용 *</label>
                    <textarea name="content" id="textarea-content" rows="10" maxlength="5000" required></textarea>
                </li>

                <li>
                    <label for="input-writer">작성자</label>
                    <input type="text" id="input-writer" name="writer">
                </li>
            </ul>

            <div class="button-wrap">
                <ul>
                    <li>
                        <a href="#confirmationModal" class="btn btn-dark">저장</a>
                    </li>
                </ul>
            </div>

            <!-- modal : 확인 팝업 메시지 -->
            <div id="confirmationModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>게시물 등록 확인</h5>
                        <a href="#" class="close">&times;</a>
                    </div>

                    <div class="modal-body">
                        게시물을 등록하시겠습니까?
                    </div>

                    <div class="modal-footer">
                        <ul>
                            <li>
                                <form action="/your-submit-endpoint" method="post">
                                    <button type="submit" class="btn-dark">등록</button>
                                </form>
                            </li>

                            <li>
                                <a href="#" class="btn btn-dark-outline">닫기</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
