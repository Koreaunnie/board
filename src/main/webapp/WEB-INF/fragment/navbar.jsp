<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
    /* common style */
    * {
        text-decoration: none;
        list-style: none;
    }

    input, textarea {
        border: 1px solid #dee2e6;
        border-radius: 5px;
        padding: 7px;
    }

    button {
        cursor: pointer;
        background: var(--button-normal-color-bg);
        color: var(--button-normal-color-font);
        border: 0;
        border-radius: 5px;
        padding: 10px 20px;
        font-size: 16px;
    }

    :root {
        --table-border-color: #e7e8ea;
        --table-hover-color: #f3f3f4;

        --button-normal-color-bg: #212529;
        --button-normal-color-font: #fff;

        --small-font-size: 14px;
        --normal-font-size: 16px;
    }

    fieldset {
        border: 0;
    }

    form {
        margin-top: 50px;
    }

    legend {
        margin: 10px auto;
        font-size: 25px;
        font-weight: bold;
    }

    li {
        margin: 20px;
    }

    label {
        font-weight: bold;
        display: block;
        margin: 10px 5px;
    }

    input, textarea {
        width: 100%;
        padding: 10px;
    }

    .container {
        width: 60%;
        margin: 0 auto;
    }

    .button-wrap {
        text-align: center;
    }

    /* common style */

    nav {
        width: 100%;
        background: #212529;
    }

    nav ul {
        display: flex;
        justify-content: space-evenly;
    }

    nav ul li a {
        color: #e7e8ea;
    }
</style>

<nav>
    <ul>
        <li>
            <a href="/board/list">게시판</a>
        </li>

        <li>
            <a href="/board/new">
                <i class="fa-solid fa-file-pen"></i>
                글 작성하기
            </a>
        </li>

        <li>
            <a href="/member/signin">
                <i class="fa-solid fa-user"></i>
            </a>
        </li>

        <li>
            <a href="/member/signout">
                <i class="fa-solid fa-right-from-bracket"></i>
                로그아웃
            </a>
        </li>

        <li>
            <a href="/member/list">
                <i class="fa-solid fa-address-book"></i>
                회원목록
            </a>
        </li>
    </ul>
</nav>
