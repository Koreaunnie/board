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
        // 한 페이지에 10개
        Integer offset = (page - 1) * 10;

        // 페이징 적용하여 게시물 조회
        List<Board> list = mapper.selectAllPaging(offset);

        // Controller 에게 넘겨 줄 정보들을 담을 map
        Map<String, Object> map = new HashMap<>();

        // 페이지 관련 정보들

        // 총 게시물 수
        Integer totalCount = mapper.countAll();

        // 현재 페이지
        Integer currentPageNumber = page;

        // 마지막 페이지 번호
        Integer lastPageNumber = (totalCount - 1) / 10 + 1;

        // 현재 페이지 기준 끝 페이지 번호
        Integer endPageNumber = ((page - 1) / 10 + 1) * 10;

        // 현재 페이지 기준 시작 페이지 번호
        Integer beginPageNumber = endPageNumber - 9;

        // 다음 버튼 클릭 시 이동하는 페이지 번호
        Integer nextPageNumber = endPageNumber + 1;

        // 이전 버튼 클릭 시 이동하는 페이지 번호
        Integer prevPageNumber = beginPageNumber - 1;

        // 다음 버튼 유무
        Boolean hasNextPage = nextPageNumber < lastPageNumber;

        // 이전 버튼 유무
        Boolean hasPrevPage = prevPageNumber > 0;

        // 오른쪽 끝페이지 제한 (마지막 페이지보다 클 수 없음)
        endPageNumber = Math.min(endPageNumber, lastPageNumber);

        // 페이지 정보와 게시물 리스트를 함께 저장
        Map<String, Object> pageInfo = new HashMap<>();

        pageInfo.put("totalCount", totalCount);
        pageInfo.put("currentPageNumber", currentPageNumber);
        pageInfo.put("lastPageNumber", lastPageNumber);
        pageInfo.put("endPageNumber", endPageNumber);
        pageInfo.put("beginPageNumber", beginPageNumber);
        pageInfo.put("nextPageNumber", nextPageNumber);
        pageInfo.put("prevPageNumber", prevPageNumber);
        pageInfo.put("hasNextPage", hasNextPage);
        pageInfo.put("hasPrevPage", hasPrevPage);

        map.put("pageInfo", pageInfo);
        map.put("boardList", list);

        // 모든 게시물을 조회하여 반환
        return map;
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
