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
        .container {
            max-width: 700px;
            position: relative;
        }

        .input-pinned {
            position: absolute;
            right: 10px;
            font-weight: normal;
        }

        .button-wrap {
            margin-top: 30px;
        }

    </style>
</head>

<body>
<c:import url="/WEB-INF/fragment/navbar.jsp">
    <c:param name="active" value="new"/>
</c:import>

<%-- 로그인 여부 --%>
<c:set value="${not empty sessionScope.loggedInMember}" var="loggedIn"/>

<%-- 관리자 여부--%>
<c:set value="${sessionScope.loggedInMember.authorization.contains('admin')}" var="isAdmin"/>

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

            <c:if test="${loggedIn && isAdmin}">
                <div class="input-pinned">
                    <label for="input-pinned">
                        <input type="checkbox" name="pinned" id="input-pinned">
                        고정 게시물로 등록
                    </label>
                </div>
            </c:if>

            <ul>
                <li>
                    <label for="input-title">제목 *</label>
                    <input type="text" id="input-title" name="title" maxlength="30" required>
                </li>

                <li>
                    <label for="textarea-content">내용 *</label>
                    <textarea name="content" id="textarea-content" rows="10" maxlength="5000" required></textarea>
                </li>
            </ul>

            <div class="button-wrap">
                <button class="btn btn-dark" onclick="return confirm('게시물을 등록하시겠습니까?');">
                    <i class="fa-solid fa-floppy-disk"></i>
                    저장
                </button>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>
