package com.example.pjboard.mapper;

import com.example.pjboard.dto.Board;
import com.example.pjboard.dto.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            INSERT INTO Board 
            (title, content, writer) 
            VALUES (#{board.title}, #{board.content}, #{member.id})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "board.id")
    int insert(Board board, Member member);

    @Select("""
            SELECT *
            FROM Board ORDER BY modified DESC, created DESC
            LIMIT #{offset}, 10
            """)
    List<Board> selectAllPaging(Integer offset);

    @Select("""
            SELECT COUNT(*)
            FROM Board
            """)
    int countAll();

    @Select("""
            SELECT *
            FROM Board
            WHERE id = #{id}
            """)
    Board selectById(Integer id);

    @Update("""
            UPDATE Board
            SET title = #{title},
                content = #{content},
                modified = NOW()
            WHERE id = #{id}
            """)
    int update(Board board);

    @Delete("""
            DELETE FROM Board
            WHERE id = #{id}
            """)
    int deleteById(Integer id);

    @Delete("""
            DELETE FROM Board
            WHERE writer = #{memberId}
            """)
    int deleteByMemberId(String memberId);
}
