package com.example.pjboard.controller;

import com.example.pjboard.dto.Member;
import com.example.pjboard.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("member")
public class MemberController {
    private final MemberService service;

    // 회원 > 회원가입
    @GetMapping("join")
    public void joinMember() {

    }

    @PostMapping("join")
    public String joinMember(Member member,
                             RedirectAttributes rttr) {
        service.join(member);
        rttr.addFlashAttribute("message", Map.of(
                "type", "success",
                "text", "회원가입 되었습니다."));

        return "redirect:/member/list";
    }

    // 회원 > 회원 목록
    @GetMapping("list")
    public void listMember(Model model) {
        model.addAttribute("memberList", service.list());
    }

    // 회원 > 회원정보 상세조회
    @GetMapping("info")
    public void infoMember(Model model, String id) {
        model.addAttribute("member", service.info(id));
    }

    // 회원 > 회원정보 수정 (수정 화면으로 넘기기)
    @GetMapping("edit")
    public void editMember(Model model, String id) {
        model.addAttribute("member", service.info(id));
    }

    // 회원 > 회원정보 수정 (수정 화면에서 수정 후 저장)
    @PostMapping("edit")
    public String editMember(Member member,
                             RedirectAttributes rttr) {
        service.edit(member);
        rttr.addFlashAttribute("message", Map.of(
                "type", "success",
                "text", "회원 정보가 수정되었습니다."));
        return "redirect:/member/list";
    }

    // 회원 > 회원 탈퇴
    @PostMapping("delete")
    public void deleteMember(String id, String password) {
        service.delete(id, password);
    }

    // 회원 > 로그인
    @GetMapping("signin")
    public void signin() {

    }

    @PostMapping("signin")
    public void signin(String id, String password) {
        service.get(id, password);
    }

}
