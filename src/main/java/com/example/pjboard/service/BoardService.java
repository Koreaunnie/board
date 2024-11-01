package com.example.pjboard.service;

import com.example.pjboard.dto.Board;
import com.example.pjboard.dto.Member;
import com.example.pjboard.mapper.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
@RequiredArgsConstructor
public class BoardService {
    private final BoardMapper mapper;

    public void add(Board board, Member member) {
        // 게시물을 데이터베이스에 추가
        mapper.insert(board, member);
    }

    public Map<String, Object> list(Integer page) {
        // 한 페이지에 표시할 게시물 수
        Integer pageSize = 10;

        // 페이지 시작 위치 계산
        Integer offset = (page - 1) * 10;

        // 페이징 적용하여 게시물 조회
        List<Board> boards = mapper.selectAllPaging(offset, pageSize);

        // 총 게시물 수
        Integer totalCount = mapper.countAll();

        // 페이지 정보와 게시물 리스트를 함께 저장
        Map<String, Object> result = new HashMap<>();
        result.put("totalCount", totalCount);

        // 모든 게시물을 조회하여 반환
        return result;
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
        // 게시물을 데이터베이스에서 삭제
        mapper.deleteById(id);
    }
}
