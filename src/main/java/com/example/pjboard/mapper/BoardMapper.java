package com.example.pjboard.mapper;

import com.example.pjboard.dto.Board;
import org.apache.ibatis.annotations.*;

import java.util.List;

@Mapper
public interface BoardMapper {

    @Insert("""
            INSERT INTO Board 
            (title, content, writer) 
            VALUES (#{title}, #{content}, #{writer})
            """)
    @Options(useGeneratedKeys = true, keyProperty = "id")
    int insert(Board board);

    @Select("""
            SELECT *
            FROM Board
            ORDER BY modified DESC, created DESC
            """)
    List<Board> selectAll();

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
                writer = #{writer}, 
                modified = NOW()
            WHERE id = #{id}
            """)
    int update(Board board);

    @Delete("""
            DELETE FROM Board
            WHERE id = #{id}
            """)
    int deleteById(Integer id);
}
