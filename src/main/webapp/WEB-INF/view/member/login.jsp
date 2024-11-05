<%--
  Created by IntelliJ IDEA.
  User: hyunjunglim
  Date: 2024. 10. 29.
  Time: 오후 5:53
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>회원 > 로그인</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .container {
            max-width: 450px;
        }

        .button-wrap {
            margin-top: 30px;
        }

        .button-login button {
            width: 100%;
        }

        .button-join {
            text-align: center;
            margin-top: 15px;
            color: var(--btn-normal-dark);
        }

        .button-join button {
            width: 100%;
            height: 45px;
        }

        .button-find-password {
            text-align: center;
            margin-top: 20px;
            color: var(--btn-normal-info);
        }

        .button-find-password a {
            display: inline-block;
            font-weight: bold;
            text-decoration-line: underline;
            color: var(--btn-normal-dark);
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
            <legend>로그인</legend>

            <ul>
                <li>
                    <label for="input-id">아이디</label>
                    <input type="text" id="input-id" name="id" required>
                </li>

                <li>
                    <label for="input-password">비밀번호</label>
                    <input type="text" id="input-password" name="password" required>
                </li>
            </ul>

            <div class="button-wrap">
                <div class="button-login">
                    <button class="btn btn-dark">
                        로그인
                    </button>
                </div>

                <div class="button-join">
                    <button type="button" class="btn btn-dark-outline" onclick="location.href='/member/join'">
                        회원가입
                    </button>
                </div>

                <div class="button-find-password">
                    <p>
                        비밀번호를 까먹으셨나요?
                        <a href="/member/join">비밀번호 찾기</a>
                    </p>
                </div>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>

