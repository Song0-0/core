package com.study.dao;

import com.study.connection.ConnectionTest;
import com.study.dto.BoardDTO;

import java.sql.*;
import java.util.ArrayList;

public class BoardDAO {
    private static BoardDAO dao;

    public BoardDAO() {

    }

    public synchronized static BoardDAO getDao() {
        if (dao == null) {
            dao = new BoardDAO();
        }
        return dao;
    }

    //게시물 전체 조회
    public ArrayList<BoardDTO> list() {
        ArrayList<BoardDTO> arrBoard = new ArrayList<>();

        StringBuffer sql = new StringBuffer();
        sql.append("select category, title, reg_name, views, reg_dt, mod_dt from board order by reg_dt desc");
//join문
//        "select c.name, b.title, b.reg_name, b.views, b.reg_dt, b.mod_dt" +
//                "from board b" +
//                "inner join category c" +
//                "on c.id = b.category" +
//                "order by reg_dt desc"

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ConnectionTest.getConnection();
            pstmt = con.prepareStatement(sql.toString());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                BoardDTO dto = new BoardDTO();
                dto.setCategory(rs.getInt("category"));
                dto.setTitle(rs.getString("title"));
                dto.setRegName(rs.getString("reg_name"));
                dto.setViews(rs.getInt("views"));
                dto.setRegDt(rs.getString("reg_dt"));
                dto.setModDt(rs.getString("mod_dt"));
                arrBoard.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrBoard;
    }
}
