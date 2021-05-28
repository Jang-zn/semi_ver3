package com.semi.board.model.service;
import static com.semi.common.JdbcTemplate.*;

import java.sql.*;

import com.semi.board.model.dao.*;
public class BoardService {

	private BoardDao dao = new BoardDao();
	
	
	public int boardListCount() {
		Connection conn = getConnection();
		int result = dao.boardListCount(conn);
		close(conn);
		return result;
	}

}
