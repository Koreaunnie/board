package com.example.pjboard.mapper;

import com.example.pjboard.dto.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface MemberMapper {
    @Insert("""
            INSERT INTO Member
            (id, password, nickname, introduction)
            VALUES (#{id}, #{password}, #{nickname}, #{introduction})
            """)
    int insert(Member member);

    @Select("""
            SELECT *
            FROM Member
            ORDER BY joined DESC
            """)
    List<Member> selectAll();

    @Select("""
            SELECT *
            FROM Member
            WHERE id = #{id}
            """)
    Member selectById(String id);

    @Update("""
            UPDATE Member
            SET password = #{password}, nickname = #{nickname}, introduction = #{introduction}
            WHERE id = #{id}
            """)
    int update(Member member);

    @Select("""
            SELECT *
            FROM Member
            WHERE id = #{id}
                AND password = #{password}
            """)
    int selectByIdAndPassword(String id, String password);


    @Delete("""
            DELETE FROM Member
            WHERE id = #{id}
                AND password = #{password}
            """)
    int deleteByIdAndPassword(String id, String password);


}
