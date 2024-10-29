package com.example.pjboard.mapper;

import com.example.pjboard.dto.Member;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MemberMapper {
    @Insert("""
            INSERT INTO Member
            (id, password, name, introduction)
            VALUES (#{id}, #{password}, #{name}, #{introduction})
            """)
    int insert(Member member);

    @Select("""
            SELECT *
            FROM Member
            WHERE joined DESC
            """)
    List<Member> selectAll();


    @Select("""
            SELECT *
            FROM Member
            WHERE id = #{id}
            """)
    Member selectById(String id);

    @Select("""
            SELECT *
            FROM Member
            WHERE id = #{id}
                AND password = #{password}
            """)
    int selectByIdAndPassword(String id, String password);


}
