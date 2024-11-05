<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
    /* common style */
    * {
        text-decoration: none;
        list-style: none;
    }

    body, a, p, ul, li {
        margin: 0;
        padding: 0;
    }

    a {
        color: inherit;
        display: block;
    }

    fieldset {
        border: 0;
    }

    legend {
        margin: 10px auto;
        font-size: 2em;
        font-weight: bold;
    }

    label {
        font-weight: bold;
        display: block;
        margin: 10px 5px;
    }

    input[type=text] {
        border: 1px solid #dee2e6;
        box-sizing: border-box;
        border-radius: 5px;
        width: 100%;
        height: 40px;
        padding: 0 10px;
    }

    textarea {
        border: 1px solid #dee2e6;
        box-sizing: border-box;
        border-radius: 5px;
        width: 100%;
        padding: 10px;
    }

    select {
        border: 1px solid #dee2e6;
        box-sizing: border-box;
        border-radius: 5px;
        height: 40px;
        padding: 0 10px;
        margin-right: 5px;
        outline: none;
    }

    h1 {
        text-align: center;
        margin: 30px;
    }

    /* -------------------------- button --------------------------- */

    .btn {
        cursor: pointer;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: bold;
    }

    .btn-dark {
        background: var(--btn-normal-dark);
        color: var(--btn-normal-light);
        border: 1px solid var(--btn-normal-dark);
        box-sizing: border-box;
    }

    .btn-dark:hover {
        background: var(--btn-normal-hover);
    }

    .btn-dark-outline {
        background: var(--btn-normal-light);
        border: 1px solid var(--btn-normal-dark);
        box-sizing: border-box;
    }

    .btn-dark-outline:hover {
        background: var(--btn-normal-dark);
        color: var(--btn-normal-light);
    }

    .btn-warning {
        background: var(--btn-warning-dark);
        color: var(--btn-normal-light);
        border: 1px solid var(--btn-warning-dark);
        box-sizing: border-box;
    }

    .btn-warning:hover {
        background: var(--btn-warning-hover);
    }

    /* -------------------------- table-list --------------------------- */

    .table-list {
        border-collapse: collapse;
        width: 100%;
        text-align: center;
        table-layout: fixed;
    }

    .table-list thead tr {
        height: 50px;
        border-top: 1px solid #000;
        background: var(--table-header-color);
        border-bottom: 1px solid var(--table-border-color);
    }

    .table-list tbody {
        max-height: 400px;
    }

    .table-list tbody tr {
        cursor: pointer;
        height: 40px;
    }

    .table-list tbody tr td {
        border-bottom: 1px solid var(--table-border-color);
    }

    .table-list tbody tr:last-child {
        border-bottom: none;
    }

    .table-list tbody tr:hover {
        background: var(--table-hover-color);
    }

    .table-list tbody tr td {
        padding: 5px 10px;
    }

    /* -------------------------- alert --------------------------- */

    .alert {
        width: 60%;
        margin: 30px auto;
        padding: 15px 20px;
        border-radius: 5px;
        position: relative; /* 상대 위치 */
    }

    /* 성공 메시지 */
    .alert-success {
        background-color: #d4edda; /* 연한 초록색 배경 */
        color: #155724; /* 어두운 초록색 텍스트 */
        border: 1px solid #c3e6cb; /* 연한 초록색 테두리 */
    }

    /* 경고 메시지 */
    .alert-warning {
        background-color: #fff3cd; /* 연한 노란색 배경 */
        color: #856404; /* 어두운 노란색 텍스트 */
        border: 1px solid #ffeeba; /* 연한 노란색 테두리 */
    }

    /* 에러 메시지 */
    .alert-danger {
        background-color: #f8d7da; /* 연한 빨간색 배경 */
        color: #721c24; /* 어두운 빨간색 텍스트 */
        border: 1px solid #f5c6cb; /* 연한 빨간색 테두리 */
    }

    /* -------------------------- modal --------------------------- */

    /* 모달 배경 */
    .modal {
        display: none; /* 기본적으로 숨김 */
        position: fixed; /* 고정 위치 */
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5); /* 반투명 배경 */
        justify-content: center; /* 가로 중앙 정렬 */
        align-items: center; /* 세로 중앙 정렬 */
    }

    /* 모달 콘텐츠 */
    .modal-content {
        background-color: white; /* 흰색 배경 */
        border-radius: 5px; /* 둥근 모서리 */
        padding: 20px; /* 내부 여백 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        width: 300px; /* 너비 */
    }

    /* 닫기 버튼 스타일 */
    .modal-header .close {
        cursor: pointer; /* 클릭 커서 */
    }

    /* :target 선택자로 모달을 보이게 함 */
    .modal:target {
        display: flex; /* 모달 표시 */
    }

    .modal-footer ul {
        display: flex;
    }

    :root {
        --table-header-color: #f7f7f7;
        --table-border-color: #eaeaea;
        --table-hover-color: #f9f9f9;

        --btn-normal-dark: #212529;
        --btn-normal-light: #fff;
        --btn-normal-info: #727373;
        --btn-normal-hover: #424649;
        --btn-normal-hover-border: #373b3e;

        --btn-warning-dark: #dc3545;
        --btn-warning-light: #fff;
        --btn-warning-hover: #bb2d3b;
        --btn-warning-hover-border: #b02a37;

        --small-font-size: 14px;
        --normal-font-size: 16px;
    }

    .container {
        margin: 0 auto;
        margin-top: 30px;
    }

    .button-wrap {
        text-align: center;
    }

    .button-wrap ul {
        display: flex;
        justify-content: center;
    }

    /* -------------------------- nav --------------------------- */

    .header {
        width: 100%;
        background: #212529;
    }

    .header ul {
        display: flex;
        padding: 20px;
        justify-content: space-evenly;
    }

    .header ul li a {
        color: #e7e8ea;
    }

    .header .active {
        font-weight: bold;
    }

    .user-info {
        text-align: right;
        margin-top: 10px;
        padding-right: 10px;
    }
</style>

<%-- 로그인 여부 --%>
<c:set value="${not empty sessionScope.loggedInMember}" var="loggedIn"/>

<%-- 관리자 여부--%>
<c:set value="${sessionScope.loggedInMember.authorization.contains('admin')}" var="isAdmin"/>

<nav class="header">
    <ul>
        <li>
            <a href="/board/list">게시판</a>
        </li>

        <c:if test="${loggedIn}">
            <li>
                <a href="/board/new" title="게시글 작성">
                    게시글 작성
                </a>
            </li>
        </c:if>


        <c:if test="${not loggedIn}">
            <li>
                <a href="/member/login" title="로그인">
                    <i class="fa-solid fa-user"></i>
                </a>
            </li>
        </c:if>

        <c:if test="${loggedIn}">
            <li>
                <a href="/member/info?id=${sessionScope.loggedInMember.id}" title="회원 정보">
                    <i class="fa-solid fa-user"></i>
                </a>
            </li>
        </c:if>

        <c:if test="${loggedIn}">
            <li>
                <a href="/member/logout" onclick="return confirm('로그아웃 하시겠습니까?');" title="로그아웃">
                    <i class="fa-solid fa-right-from-bracket"></i>
                    로그아웃
                </a>
            </li>
        </c:if>

        <c:if test="${loggedIn && isAdmin}">
            <li>
                <a href="/member/list" title="회원 목록">
                    <i class="fa-solid fa-address-book"></i>
                    회원목록
                </a>
            </li>
        </c:if>
    </ul>
</nav>

<c:if test="${loggedIn}">
    <p class="user-info">
            ${sessionScope.loggedInMember.nickname}님이 로그인하셨습니다.
    </p>
</c:if>

