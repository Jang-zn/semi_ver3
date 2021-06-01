package com.semi.board.model.service;
import static com.semi.common.JdbcTemplate.*;

import java.sql.*;
import java.util.*;

import com.semi.board.model.dao.*;
import com.semi.board.model.vo.*;
public class BoardService {

	private BoardDao dao = new BoardDao();
	
	
	public int boardListCount() {
		Connection conn = getConnection();
		int result = dao.boardListCount(conn);
		close(conn);
		return result;
	}
	
	public List<Board> boardList(int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<Board> list = dao.boardList(conn,cPage,numPerpage);
		close(conn);
		return list;
	}


	public List<Board> boardsearch(String searchType, String searchKeyword, int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<Board> list = dao.boardsearch(conn,searchType,searchKeyword,cPage,numPerpage);
		close(conn);
		return list;
	}

	public int boardSearchCount(String searchType, String searchKeyword) {
		Connection conn = getConnection();
		int result = dao.boardSearchCount(conn,searchType,searchKeyword);
		close(conn);
		return result;
	}

	public Board boardContent(int no, boolean readFlag) {
		Connection conn = getConnection();
		Board b = dao.boardContent(conn,no);
		if(b!=null&&!readFlag) {
			int result = dao.updateReadCount(conn,no);
			if(result>0) {
				commit(conn);
				b.setReadCount((b.getReadCount()+1));
			}
			else rollback(conn);
		}
		close(conn);
		return b;
	}

	public int insertBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.insertBoard(conn,b);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}

	public int boardfile(int contentNo,String file) {
		Connection conn = getConnection();
		int result = dao.boardfile(contentNo,file,conn);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int boardContentNo() {
		Connection conn = getConnection();
		int cNo = dao.boardContentNo(conn);
		close(conn);
		return cNo;
	}

	public String[] selectBoardfile(int no) {
		Connection conn = getConnection();
		String[] list = dao.selectBoardFile(conn,no);
		close(conn);
		return list;
	}

	public int fileyumu(int contentNo) {
		Connection conn = getConnection();
		int result = dao.fileyumu(conn,contentNo);
		close(conn);
		return result;
	}

	public Board boardNoInf(int no) {
		Connection conn = getConnection();
		Board b = dao.boardContent(conn,no);
		close(conn);
		return b;
	}

	public int updateBoard(Board b) {
		Connection conn = getConnection();
		int result = dao.updateBoard(conn,b);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteFile(String parameter) {
		Connection conn = getConnection();
		int result = dao.deleteFile(conn,parameter);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int insertComment(Reply re) {
		Connection conn = getConnection();
		int result = dao.insertComment(conn,re);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public List<Reply> commentList(int no) {
		Connection conn = getConnection();
		List<Reply> list = dao.commentList(conn,no);
		close(conn);
		return list;
	}

	public int commentCount(int no) {
		Connection conn = getConnection();
		int result = dao.commentCount(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int commentDelete(int no) {
		Connection conn = getConnection();
		int result = dao.commentDelete(conn,no);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int boardDelete(int boardNo) {
		Connection conn = getConnection();
		int result = dao.boardDelete(conn,boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int fileDelete(int boardNo) {
		Connection conn = getConnection();
		int result = dao.fileDelete(conn,boardNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public String[] filesName(int boardNo) {
		Connection conn = getConnection();
		String[] file = dao.filesName(conn,boardNo);
		close(conn);
		return file;
	}

	public int updateComment(int commentNo, String updateContent) {
		Connection conn = getConnection();
		int result = dao.updateComment(conn,commentNo,updateContent);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}




	


	

}
