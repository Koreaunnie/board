package com.example.pjboard.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class Member {
    private String id;
    private String password;
    private String name;
    private String description;
    private LocalDateTime joined;
}
