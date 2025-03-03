<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>게시판 > 게시물 수정</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .container {
            max-width: 700px;
        }

        .button-wrap {
            margin-top: 30px;
        }
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
            <legend>게시물 수정</legend>

            <ul>
                <li>
                    <label for="input-title">제목</label>
                    <input type="text" id="input-title" name="title" value="${board.title}" maxlength="50" required>
                </li>

                <li>
                    <label for="textarea-content">내용</label>
                    <textarea name="content" id="textarea-content" rows="10" maxlength="5000"
                              required>${board.content}</textarea>
                </li>
            </ul>

            <div class="button-wrap">
                <button class="btn btn-dark" onclick="return confirm('저장하시겠습니까?');">
                    <i class="fa-solid fa-floppy-disk"></i>
                    저장
                </button>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
