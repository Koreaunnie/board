<%--
  Created by IntelliJ IDEA.
  User: hyunjunglim
  Date: 2024. 10. 29.
  Time: 오후 5:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>회원 > 회원 정보</title>

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
            <legend>회원 정보</legend>

            <ul>
                <li>
                    <label for="input-id">아이디</label>
                    <input type="text" id="input-id" value="${member.id}" readonly>
                </li>

                <li>
                    <label for="input-password">비밀번호</label>
                    <input type="text" id="input-password" value="${member.password}" readonly>
                </li>

                <li>
                    <label for="input-nickname">별명</label>
                    <input type="text" id="input-nickname" value="${member.nickname}" readonly>
                </li>

                <li>
                    <label for="textarea-introduction">자기소개</label>
                    <textarea id="textarea-introduction" cols="30" rows="10" readonly>${member.introduction}</textarea>
                </li>
            </ul>

            <div class="button-wrap">
                <ul>
                    <li>
                        <form action="/member/edit" method="get" onclick="return confirm('회원 정보를 수정하시겠습니까?');">
                            <a href="/member/edit?id=${member.id}" class="btn btn-dark">회원 수정</a>
                        </form>
                    </li>

                    <li>
                        <form action="/member/delete" method="post" onsubmit="return confirm('정말로 탈퇴하시겠습니까?');">
                            <input type="hidden" name="id" value="${member.id}">
                            <button type="submit" class="btn-warning">회원 탈퇴</button>
                        </form>
                    </li>
                </ul>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
