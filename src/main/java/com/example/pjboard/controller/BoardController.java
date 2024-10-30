package com.example.pjboard.controller;

import com.example.pjboard.dto.Board;
import com.example.pjboard.service.BoardService;
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
@RequestMapping("board")
public class BoardController {
    private final BoardService service;

    // 게시판 > 게시물 작성
    @GetMapping("new")
    public void newBoard() {

    }

    @PostMapping("new")
    public String newBoard(Board board,
                           RedirectAttributes rttr) {
        service.add(board);
        rttr.addFlashAttribute("message", Map.of(
                "type", "success",
                "text", "게시물이 작성되었습니다."));
        return "redirect:/board/list";
    }

    // 게시판 > 목록
    @GetMapping("list")
    public void listBoard(Model model) {
        model.addAttribute("boardList", service.list());
    }

    // 게시판 > 게시물 보기
    @GetMapping("view")
    public void viewBoard(Model model, Integer id) {
        model.addAttribute("board", service.get(id));
    }

    // 게시판 > 게시물 수정 (수정 화면으로 넘기기)
    @GetMapping("edit")
    public void editBoard(Model model, Integer id) {
        model.addAttribute("board", service.get(id));
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
    public String deleteBoard(Integer id, RedirectAttributes rttr) {
        service.delete(id);
        rttr.addFlashAttribute("message", Map.of(
                "type", "warning",
                "text", id + "번 게시물이 삭제되었습니다."));

        return "redirect:/board/list"; // 삭제 후 리스트 페이지로 리다이렉트
    }
}
