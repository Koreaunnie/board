package com.example.pjboard.service;

import com.example.pjboard.dto.Member;
import com.example.pjboard.mapper.BoardMapper;
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
    private final BoardMapper boardMapper;

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

    public boolean delete(String id, String password) {
        // 회원 정보 조회
        Member member = mapper.selectById(id);

        // 회원 삭제 성공 여부
        // (성공하면 삭제된 행이 1개르모 cnt 에 1이 들어가고, 실패하면 삭제된 행이 없으므로 그대로 0)
        int cnt = 0;
        // 비밀번호 확인 후 같은 경우에만 삭제 (다르면 false 반환)
        if (member.getPassword().equals(password)) {
            // 게시물 (board) 먼저 삭제
            boardMapper.deleteByMemberId(id);
            // id, password 를 만족하는 회원을 데이터베이스에서 삭제 후 삭제된 행의 개수를 cnt 에 반환
            cnt = mapper.deleteByIdAndPassword(id, password);
        }
        // cnt 가 1이면 (삭제가 성공한 경우) true를 반환하여 삭제 성공
        return cnt == 1;
    }

    // 로그인
    public Member get(String id, String password) {
        // id, password 를 만족하는 회원정보 조회
        Member member = mapper.selectByIdAndPassword(id, password);

        if (member == null) {
            // 로그인 실패
            // 회원 정보가 없으면 null 반환
            return null;
        } else {
            // 로그인 성공
            List<String> authList = mapper.selectAuthById(id);
            member.setAuthorization(authList);

            // 회원 정보 반환
            return member;
        }
    }

    public boolean hasAccess(String id, Member member) {
        return id.equals(member.getId());
    }
}
