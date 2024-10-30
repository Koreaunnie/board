package com.example.pjboard.controller;

import com.example.pjboard.dto.Member;
import com.example.pjboard.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
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
    public String deleteMember(String id, String password,
                               HttpSession session,
                               RedirectAttributes rttr,
                               @SessionAttribute("signedInMember") Member member) {

        if (service.delete(id, password)) {
            // 탈퇴 성공
            rttr.addFlashAttribute("message", Map.of(
                    "type", "success",
                    "text", "탈퇴가 완료되었습니다."));

            // 탈퇴 성공 후 세션을 종료하고 로그아웃 상태로 만듦
            session.invalidate();
            return "redirect:/member/signin";
        } else {
            // 탈퇴 실패
            rttr.addFlashAttribute("message", Map.of(
                    "type", "warning",
                    "text", "비밀번호가 일치하지 않습니다."));

            // 탈퇴 실패 후 다시 해당 id 의 회원 정보를 보기 위한 리다이렉트 (id 를 info 에 넘김)
            rttr.addAttribute("id", id);
            return "redirect:/member/info";
        }


    }

    // 회원 > 로그인 (로그인 화면으로 이동)
    @GetMapping("signin")
    public void signin() {

    }

    // 회원 > 로그인 (로그인 처리)
    @PostMapping("signin")
    public String signin(String id, String password,
                         RedirectAttributes rttr,
                         HttpSession session) {

        Member member = service.get(id, password);

        if (member != null) {
            // 로그인 성공
            rttr.addFlashAttribute("message", Map.of(
                    "type", "success",
                    "text", "로그인 되었습니다."));
            session.setAttribute("signedInMember", member);
            return "redirect:/member/list";
        } else {
            // 로그인 실패
            rttr.addFlashAttribute("message", Map.of(
                    "type", "danger",
                    "text", "일치하는 아이디나 패스워드가 없습니다."));
            return "redirect:/member/signin";
        }
    }

    @RequestMapping("signout")
    public String signout(HttpSession session,
                          RedirectAttributes rttr) {

        session.invalidate();
        rttr.addFlashAttribute("message", Map.of(
                "type", "success",
                "text", "로그아웃 되었습니다."));

        return "redirect:/member/signin";
    }


}
