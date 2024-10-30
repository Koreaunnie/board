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

    public void edit(Member member) {
        // 회원을 데이터베이스에서 수정
        mapper.update(member);
    }

    public void delete(String id, String password) {
        // 회원을 데이터베이스에서 삭제
        mapper.deleteByIdAndPassword(id, password);
    }

    public Member get(String id, String password) {
        // id, password 에 맞는 회원정보 조회
        Member member = mapper.selectByIdAndPassword(id, password);

        if (member == null) {
            // 로그인 실패
            // 회원 정보가 없으면 null 반환
            return null;
        } else {
            // 로그인 성공
            // 회원 정보 반환
            return member;
        }
    }


}
