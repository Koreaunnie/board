package com.example.pjboard.controller;

import com.example.pjboard.dto.Board;
import com.example.pjboard.dto.Member;
import com.example.pjboard.service.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
@RequiredArgsConstructor
@RequestMapping("board")
public class BoardController {
    private final BoardService service;

    // 게시판 > 게시물 작성 (로그인 여부 확인)
    @GetMapping("new")
    public String newBoard(@SessionAttribute(value = "loggedInMember", required = false) Member member,
                           Model model,
                           RedirectAttributes rttr) {

        if (member != null) {
            // 로그인 한 상태
            return "board/new";
        } else {
            // 로그인 안 한 상태
            rttr.addFlashAttribute("message", Map.of(
                    "type", "danger",
                    "text", "로그인한 회원만 글 작성이 가능합니다."));
            return "redirect:/member/login";
        }
    }

    @PostMapping("new")
    public String newBoard(Board board,
                           RedirectAttributes rttr,
                           @SessionAttribute("loggedInMember") Member member) {
        service.add(board, member);
        rttr.addFlashAttribute("message", Map.of(
                "type", "success",
                "text", "게시물이 작성되었습니다."));
        return "redirect:/board/list";
    }

    // 게시판 > 목록
    @GetMapping("list")
    public void listBoard(@RequestParam(name = "page", defaultValue = "1") Integer page,
                          Model model) {

        // 한 페이지에 10개의 게시물
        Map<String, Object> result = service.list(page);
        model.addAllAttributes(result);
    }

    // 게시판 > 게시물 보기
    @GetMapping("view")
    public void viewBoard(Model model, Integer id) {
        model.addAttribute("board", service.get(id));
    }

    // 게시판 > 게시물 수정 (수정 화면으로 넘기기)
    @GetMapping("edit")
    public String editBoard(Model model, Integer id,
                            RedirectAttributes rttr,
                            @SessionAttribute("loggedInMember") Member member) {

        // 게시물 id 조회
        Board board = service.get(id);

        // 게시물 id 와 로그인한 사용자 id가 일치하는지 확인
        if (board.getWriter().equals(member.getId())) {
            // 사용자가 게시물의 작성자일 경우, 해당 게시물 객체를 모델에 추가하여 뷰에 전달
            model.addAttribute("board", service.get(id));
            // 요청을 처리한 후 해당 (edit) 뷰로 이동
            return null;
        } else {
            rttr.addFlashAttribute("message", Map.of(
                    "type", "danger",
                    "text", "게시물 수정 권한이 없습니다."));

            return "redirect:/board/list";
        }
    }

    // 게시판 > 게시물 수정 (수정 화면에서 수정 후 저장)
    @PostMapping("edit")
    public String editBoard(Board board,
                            RedirectAttributes rttr) {
        service.edit(board);
        rttr.addFlashAttribute("message", Map.of(
                "type", "success",
                "text", "게시물이 수정되었습니다."));
        return "redirect:/board/list";
    }

    // 게시판 > 게시물 삭제
    @PostMapping("delete")
    public String deleteBoard(Integer id,
                              RedirectAttributes rttr,
                              @SessionAttribute("loggedInMember") Member member) {

        try {
            // 삭제 성공
            service.delete(id);

            rttr.addFlashAttribute("message", Map.of(
                    "type", "warning",
                    "text", id + "번 게시물이 삭제되었습니다."));

            // 삭제 후 게시판 목록으로 리다이렉트
            return "redirect:/board/list";
        } catch (Exception e) {
            // 삭제 중 예외 발생 시
            rttr.addFlashAttribute("message", Map.of("type", "danger",
                    "text", id + "번 게시물이 삭제중 문제가 발생하였습니다."));
            // 삭제 실패 후 다시 해당 id의 게시물을 보기 위한 리다이렉트 (id 를 넘김)
            rttr.addAttribute("id", id);

            return "redirect:/board/view";
        }
    }
}
