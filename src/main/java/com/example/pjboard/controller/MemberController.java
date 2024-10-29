package com.example.pjboard.controller;

import com.example.pjboard.dto.Member;
import com.example.pjboard.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
    private final MemberService service;

    @GetMapping("join")
    public void joinMember() {

    }

    @PostMapping("join")
    public void joinMember(Member member) {
        service.join(member);
    }

    @GetMapping("list")
    public void listMember(Model model) {
        model.addAttribute("memberList", service.list());
    }

    @GetMapping("info")
    public void infoMember(Model model, String id) {
        model.addAttribute("member", service.info(id));
    }

    @GetMapping("signin")
    public void signin() {

    }

    @PostMapping("signin")
    public void signin(String id, String password) {
        service.get(id, password);
    }
}
