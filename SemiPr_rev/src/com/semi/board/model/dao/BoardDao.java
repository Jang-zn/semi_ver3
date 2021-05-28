package com.semi.board.model.dao;

import java.io.*;
import java.sql.*;
import java.util.*;
import static com.semi.common.JdbcTemplate.close;
public class BoardDao {
	
	
	private Properties prop = new Properties();
	
	public BoardDao() {
		String path = BoardDao.class.getResource("/sql/board_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int boardListCount(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("boardListCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(conn);
		}
		
		return result;
	}
	 
}
