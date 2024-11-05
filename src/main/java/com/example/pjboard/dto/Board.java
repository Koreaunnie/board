package com.example.pjboard.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Board {
    private Integer id;
    private String title;
    private String content;
    private String writer;
    private LocalDateTime created;
    private Boolean pinned; // 상단 고정 여부
    private String writerNickname; // 게시글 작성자가 member id가 아닌 닉네임이 보이게
}
