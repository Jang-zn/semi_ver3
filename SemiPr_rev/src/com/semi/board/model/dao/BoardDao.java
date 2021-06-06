package com.semi.board.model.dao;

import static com.semi.common.JdbcTemplate.*;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.semi.board.model.vo.*;
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
	
	public List<Board> boardList(Connection conn, int cPage, int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b = new Board();
				b.setContentNo(rs.getInt("content_no"));
				b.setMemberId(rs.getString("member_id"));
				b.setTitle(rs.getString("title"));
				b.setCategory(rs.getString("category"));
				b.setContent(rs.getString("content"));
				b.setWriter(rs.getString("writer"));
				b.setReadCount(rs.getInt("read_count"));
				b.setWriteDate(rs.getDate("write_date"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	

	public List<Board> boardsearch(Connection conn, String searchType, String searchKeyword, int cPage,
			int numPerpage) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		String sql="";
		if(searchType.equals("titlecontent")) {
			sql = prop.getProperty("titlecontent");
			
			try {
				pstmt = conn.prepareStatement(sql.replace("#", "title").replace("^", "content"));
				pstmt.setString(1, "%"+searchKeyword+"%");
				pstmt.setString(2, "%"+searchKeyword+"%");
				pstmt.setInt(3, (cPage-1)*numPerpage+1);
				pstmt.setInt(4, cPage*numPerpage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Board b = new Board();
					b.setContentNo(rs.getInt("content_no"));
					b.setMemberId(rs.getString("member_id"));
					b.setTitle(rs.getString("title"));
					b.setCategory(rs.getString("category"));
					b.setContent(rs.getString("content"));
					b.setWriter(rs.getString("writer"));
					b.setReadCount(rs.getInt("read_count"));
					b.setWriteDate(rs.getDate("write_date"));
					list.add(b);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
		}else {
			sql =prop.getProperty("boardSearch");
			try {
				pstmt = conn.prepareStatement(sql.replace("#", searchType));
				pstmt.setString(1, "%"+searchKeyword+"%");
				pstmt.setInt(2, (cPage-1)*numPerpage+1);
				pstmt.setInt(3, cPage*numPerpage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Board b = new Board();
					b.setContentNo(rs.getInt("content_no"));
					b.setMemberId(rs.getString("member_id"));
					b.setTitle(rs.getString("title"));
					b.setCategory(rs.getString("category"));
					b.setContent(rs.getString("content"));
					b.setWriter(rs.getString("writer"));
					b.setReadCount(rs.getInt("read_count"));
					b.setWriteDate(rs.getDate("write_date"));
					list.add(b);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
		}
		
		return list;
	}

	public int boardSearchCount(Connection conn, String searchType, String searchKeyword) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		String sql ="";
		if(searchType.equals("titlecontent")) {
			sql = prop.getProperty("titlecontentcount");
			try {
				pstmt = conn.prepareStatement(sql.replace("#", "title").replace("^", "content"));
				pstmt.setString(1, "%"+searchKeyword+"%");
				pstmt.setString(2, "%"+searchKeyword+"%");
				rs=pstmt.executeQuery();
				if(rs.next()) result = rs.getInt(1);
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(conn);
			}
		}else {
			sql = prop.getProperty("boardSearchCount");
			try {
				pstmt=conn.prepareStatement(sql.replace("#", searchType));
				pstmt.setString(1, "%"+searchKeyword+"%");
				rs=pstmt.executeQuery();
				if(rs.next()) result = rs.getInt(1);
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(conn);
			}
		}
		
	
		
		return result;
	}

	public Board boardContent(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board b = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardContent"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				b = new Board();
				b.setContentNo(rs.getInt("content_no"));
				b.setMemberId(rs.getString("member_id"));
				b.setTitle(rs.getString("title"));
				b.setCategory(rs.getString("category"));
				b.setContent(rs.getString("content"));
				b.setWriter(rs.getString("writer"));
				b.setReadCount(rs.getInt("read_count"));
				b.setWriteDate(rs.getDate("write_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		
		
		return b;
	}

	public int updateReadCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateReadCount"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertBoard"));
			pstmt.setString(1, b.getMemberId());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getCategory());
			pstmt.setString(4, b.getContent());
			pstmt.setString(5, b.getWriter());
			result = pstmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int boardfile(int contentNo,String file,Connection conn) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt =conn.prepareStatement(prop.getProperty("boardfile"));
			pstmt.setInt(1, contentNo);
			pstmt.setString(2, file);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		
		return result;
	}

	public int boardContentNo(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cNo =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("boardContentNo"));
			rs=pstmt.executeQuery();
			if(rs.next()) cNo = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(conn);
		}
		
		return cNo;
	}

	public String[] selectBoardFile(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] list = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardFile"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			list = new String[5];
			int count=0;
			while(rs.next()) {
				list[count++] = rs.getString(3);
			}
			
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return list;
	}

	public int fileyumu(Connection conn, int contentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		try {
			pstmt =conn.prepareStatement(prop.getProperty("fileyumu"));
			pstmt.setInt(1, contentNo);
			rs=pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateBoard"));
			pstmt.setString(1, b.getCategory());
			pstmt.setString(2, b.getTitle());
			pstmt.setString(3, b.getContent());
			pstmt.setInt(4, b.getContentNo());
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int deleteFile(Connection conn, String parameter) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteFile"));
			pstmt.setString(1, parameter);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertComment(Connection conn, Reply re) {
		PreparedStatement pstmt =null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertComment"));
			pstmt.setInt(1, re.getContentNo());
			pstmt.setString(2, re.getWriter());
			pstmt.setString(3, re.getReplyContent());
			pstmt.setInt(4, re.getReplyLevel());
			pstmt.setString(5, re.getReplyNoRef()==0?null:String.valueOf(re.getReplyNoRef()));
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public List<Reply> commentList(Connection conn, int no) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reply nc = null;
		List<Reply> list = new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("commentList"));
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				nc=new Reply();
				nc.setReplyNo(rs.getInt("reply_no"));
				nc.setContentNo(rs.getInt("content_no"));
				nc.setWriter(rs.getString("writer"));
				nc.setReplyContent(rs.getString("reply_content"));
				nc.setReplyDate(rs.getDate("reply_date"));
				nc.setReplyLevel(rs.getInt("reply_level"));
				nc.setReplyNoRef(rs.getInt("reply_no_ref"));
				list.add(nc);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int commentCount(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("commentCount"));
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if(rs.next()) result = rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public int commentDelete(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("commentDelete"));
			pstmt.setInt(1, no);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int boardDelete(Connection conn, int boardNo) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("boardDelete"));
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int fileDelete(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("fileDelete"));
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public String[] filesName(Connection conn, int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] list = null;
		
		try {
			pstmt=conn.prepareStatement(prop.getProperty("filesName"));
			pstmt.setInt(1, boardNo);
			rs=pstmt.executeQuery();
			list = new String[5];
			int count=0;
			while(rs.next()) {
				list[count++] = rs.getString(1);
			}
		
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int updateComment(Connection conn, int commentNo, String updateContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt =conn.prepareStatement(prop.getProperty("updateComment"));
			pstmt.setString(1, updateContent);
			pstmt.setInt(2, commentNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public List<Board> sortBoardList(Connection conn, String type,int cPage, int numPerpage) {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		List<Board> list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("sortBoardList"));
			pstmt.setString(1, type);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board b = new Board();
				b.setContentNo(rs.getInt("content_no"));
				b.setMemberId(rs.getString("member_id"));
				b.setTitle(rs.getString("title"));
				b.setCategory(rs.getString("category"));
				b.setContent(rs.getString("content"));
				b.setWriter(rs.getString("writer"));
				b.setReadCount(rs.getInt("read_count"));
				b.setWriteDate(rs.getDate("write_date"));
				list.add(b);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public int sortBoardListCount(Connection conn, String type) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("sortBoardListCount"));
			pstmt.setString(1, type);
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
