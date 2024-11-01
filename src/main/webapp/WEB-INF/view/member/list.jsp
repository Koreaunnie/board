<%--
  Created by IntelliJ IDEA.
  User: hyunjunglim
  Date: 2024. 10. 29.
  Time: 오후 6:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>회원 > 목록</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <style>
        .container {
            max-width: 700px;
        }
    </style>
</head>

<body>
<c:import url="/WEB-INF/fragment/navbar.jsp"/>

<div class="container">
    <h1>회원 목록</h1>

    <table class="table-list">
        <thead>
        <tr>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>별명</th>
            <th>가입일</th>
        </tr>
        </thead>

        <tbody>
        <c:forEach items="${memberList}" var="member">
            <tr onclick="location.href='/member/info?id=${member.id}'">
                <td>${member.id}</td>
                <td>${member.password}</td>
                <td>${member.nickname}</td>
                <td>${member.joined}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
