package com.example.pjboard.service;

import com.example.pjboard.dto.Board;
import com.example.pjboard.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public void add(Board board) {
        // 게시물을 데이터베이스에 추가
        mapper.insert(board);
    }

    public List<Board> list() {
        // 모든 게시물을 조회하여 반환
        return mapper.selectAll();
    }

    public Board get(Integer id) {
        // 특정 id에 해당하는 게시물 조회 (게시물 하나 상세조회)
        Board board = mapper.selectById(id);
        // 조회된 게시물 반환
        return board;
    }

    public void edit(Board board) {
        // 게시물을 데이터베이스에서 수정
        mapper.update(board);
    }

    public void delete(Integer id) {
        mapper.deleteById(id);
    }
}
