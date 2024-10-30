package com.example.pjboard.service;

import com.example.pjboard.dto.Member;
import com.example.pjboard.mapper.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
@RequiredArgsConstructor
public class MemberService {
    private final MemberMapper mapper;

    public void join(Member member) {
        // 회원을 데이터베이스에 추가
        mapper.insert(member);
    }

    public List<Member> list() {
        // 회원을 조회 후 반환
        return mapper.selectAll();
    }

    public Member info(String id) {
        // id별 회원 정보 조회 후 반환
        return mapper.selectById(id);
    }

    public void update(Member member) {
        mapper.update(member);
    }

    public void delete(String id, String password) {
        // id, password 매치 후 회원 삭제
        mapper.deleteByIdAndPassword(id, password);
    }

    public void get(String id, String password) {
        // id, password 가 매치되는 회원 조회
        mapper.selectByIdAndPassword(id, password);
    }


}
