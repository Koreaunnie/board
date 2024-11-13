package com.example.pjboard.mapper;

import com.example.pjboard.dto.Board;
import com.example.pjboard.dto.Member;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            INSERT INTO Board
            (title, content, writer, pinned)
            VALUES (#{board.title}, #{board.content}, #{member.id}, #{board.pinned})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "board.id")
    int insert(Board board, Member member);

    @Select("""
            <script>
                SELECT b.id, 
                       b.title, 
                       m.nickname AS writerNickname, 
                       b.created, 
                       b.pinned
                FROM Board b JOIN Member m 
                    ON b.writer = m.id
                <trim prefix="WHERE" prefixOverrides="OR">
                    <if test="search == 'all' or search == 'title'">
                        b.title LIKE CONCAT('%', #{keyword}, '%')
                    </if>
            
                    <if test="search == 'all' or search == 'content'">
                        OR b.content LIKE CONCAT('%', #{keyword}, '%')
                    </if>
            
                    <if test="search == 'all' or search == 'writer'">
                        OR m.nickname LIKE CONCAT('%', #{keyword}, '%')
                    </if>
                </trim>
                ORDER BY pinned DESC, modified DESC, created DESC
                LIMIT #{offset}, 10
            </script>
            """)
    List<Board> selectAllPaging(Integer offset, String search, String keyword);

    @Select("""
            <script>
                SELECT COUNT(*)
                FROM Board b JOIN Member m
                    ON b.writer = m.id
                <trim prefix="WHERE" prefixOverrides="OR">
                    <if test="search == 'all' or search == 'title'">
                        b.title LIKE CONCAT('%', #{keyword}, '%')
                    </if>
            
                    <if test="search == 'all' or search == 'content'">
                        OR b.content LIKE CONCAT('%', #{keyword}, '%')
                    </if>
            
                    <if test="search == 'all' or search == 'writer'">
                        OR m.nickname LIKE CONCAT('%', #{keyword}, '%')
                    </if>
                </trim>
            </script>
            """)
    int countAll();

    @Select("""
            SELECT b.id, b.title, b.writer, m.nickname AS writerNickname, b.created, b.content
            FROM Board b JOIN Member m
                ON b.writer = m.id
            WHERE b.id = #{id}
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
