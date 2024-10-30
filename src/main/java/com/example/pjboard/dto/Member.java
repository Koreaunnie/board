package com.example.pjboard.dto;

import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

@Data
public class Member {
    private String id;
    private String password;
    private String nickname;
    private String introduction;
    private LocalDateTime joined;
    private List<String> authorization;
}
