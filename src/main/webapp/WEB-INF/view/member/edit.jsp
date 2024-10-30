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
</head>

<body>
<div class="container">
    <form method="post">
        <fieldset>
            <legend>회원 정보 수정</legend>

            <ul>
                <li>
                    <label for="input-id">아이디</label>
                    <input type="text" id="input-id" name="id" value="${member.id}">
                </li>

                <li>
                    <label for="input-password">비밀번호</label>
                    <input type="text" id="input-password" name="password" value="${member.password}">
                </li>

                <li>
                    <label for="input-name">이름 *</label>
                    <input type="text" id="input-name" name="name" value="${member.name}">
                </li>

                <li>
                    <label for="textarea-introduction">자기소개</label>
                    <textarea name="introduction" id="textarea-introduction" cols="30" rows="10">
                        ${member.introduction}
                    </textarea>
                </li>
            </ul>

            <div class="button-wrap">
                <button class="btn-dark">
                    가입하기
                </button>
            </div>
        </fieldset>
    </form>

    <c:if test="${not empty message}">
        <div>
                ${message}
        </div>
    </c:if>
</div>
</body>
</html>
