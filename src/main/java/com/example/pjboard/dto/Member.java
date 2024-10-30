package com.example.pjboard.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Member {
    private String id;
    private String password;
    private String nickname;
    private String introduction;
    private LocalDateTime joined;
}
