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
        return mapper.selectAll();
    }

    public Member info(String id) {
        return mapper.selectById(id);
    }

    public void get(String id, String password) {
        mapper.selectByIdAndPassword(id, password);
    }


}
