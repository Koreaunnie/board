<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<style>
    * {
        text-decoration: none;
        list-style: none;
    }

    body {
        width: 60%;
        margin: 0 auto;
    }

    input, textarea {
        border: 1px solid #dee2e6;
        border-radius: 5px;
        padding: 7px;
    }

    button {
        cursor: pointer;
        padding: 5px 7px;
    }

    :root {
        --table-border-color: #e7e8ea;
        --table-hover-color: #f3f3f4;
        --description: #8a8b8c;

        --small-font-size: 14px;
        --normal-font-size: 16px;
    }
</style>

<div>
    <ul>
        <li>
            <a href="/board/list">게시판</a>
        </li>

        <li>
            <a href="/board/new">글 작성하기</a>
        </li>
        <li></li>
        <li></li>
    </ul>
</div>
