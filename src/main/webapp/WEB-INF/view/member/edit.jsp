<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>회원 > 회원 정보 수정</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .container {
            max-width: 700px;
        }

        p {
            font-size: 12px;
            margin-left: 10px;
            margin-top: 7px;
            color: #555555;
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
            <legend>회원 정보 수정</legend>

            <ul>
                <li>
                    <label for="input-id">아이디</label>
                    <input type="text" id="input-id" value="${member.id}" disabled>
                    <p>id는 수정이 불가합니다.</p>
                </li>

                <li>
                    <label for="input-password">비밀번호</label>
                    <input type="text" id="input-password" name="password" value="${member.password}"
                           pattern="[A-Za-z0-9]{1,20}" maxlength="20"
                           title="영어 알파벳과 숫자만 입력 가능합니다. (1~20자)" required>
                    <p>20자 이내 영문과 숫자로만 작성해주세요.</p>
                </li>

                <li>
                    <label for="input-nickname">별명 *</label>
                    <input type="text" id="input-nickname" name="nickname" value="${member.nickname}" maxlength="15"
                           required>
                    <p>15자 이내로 작성해주세요.</p>
                </li>

                <li>
                    <label for="textarea-introduction">자기소개</label>
                    <textarea name="introduction" id="textarea-introduction" rows="10"
                              maxlength="100">${member.introduction}</textarea>
                </li>
            </ul>

            <div class=" button-wrap">
                <button class="btn-dark">
                    <i class="fa-solid fa-floppy-disk"></i>
                    저장
                </button>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
