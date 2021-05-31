package com.semi.member.model.dao;

import static com.semi.common.JdbcTemplate.*;

import java.sql.*;
import java.sql.Date;
import java.util.*;

import com.semi.member.exc.model.vo.*;
import com.semi.member.menu.model.vo.*;
import com.semi.member.model.vo.*;

public class MemberDao {

	public int SelectMemberExcListCount(Connection conn, String dayval) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
//		 MEMBER_ID=? AND EXC_WEEK=?
		String sql="SELECT COUNT(*) FROM MEM_E_LIST WHERE EXC_WEEK=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
//			pstmt.setString(1, memberId);
			pstmt.setString(1, dayval);;
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1); 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return result;
	}

	public List<MemberExcList> SelectMemberExcList(Connection conn, int cPage, int numPerpage, String dayval) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberExcList> list=new ArrayList();
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM MEM_E_LIST WHERE EXC_WEEK=?)A) WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, m.getMemberId());
			pstmt.setString(1, dayval);;
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberExcList mel=new MemberExcList();
				
				mel.setSets(rs.getInt("sets"));
				mel.setReps(rs.getInt("reps"));
				mel.setWeight(rs.getInt("weight"));
				mel.setExcId(rs.getString("exc_id"));
				list.add(mel);
				
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	public List<MemberMenuList> SelectMemberMenuList(Connection conn, int cPage2, int numPerpage2, String dayval, String time) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberMenuList> list=new ArrayList();
		String sql="SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM MEM_M_LIST WHERE MENU_WEEK=? AND MENU_DAYTIME=?)A) WHERE RNUM BETWEEN ? AND ?";
		try {
			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, m.getMemberId());
			pstmt.setString(1, dayval);
			pstmt.setString(2, time);
			pstmt.setInt(3, (cPage2-1)*numPerpage2+1);
			pstmt.setInt(4, cPage2*numPerpage2);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberMenuList mml=new MemberMenuList();
				mml.setAmount(rs.getInt("amount"));
				mml.setMenuId(rs.getString("menu_id"));
				list.add(mml);

			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

	public int SelectMemberMenuListCount(Connection conn, String dayval) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
//		 MEMBER_ID=? AND EXC_WEEK=?
		String sql="SELECT COUNT(*) FROM MEM_M_LIST WHERE MENU_WEEK=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, memberId);
			pstmt.setString(1, dayval);;
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1); 
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return result;
	}

	public Exercise selectExceriseinfo(Connection conn, String excid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM E_LIST WHERE EXC_ID=?";
		Exercise ex =null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, excid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ex =new Exercise();
				ex.setExcManual(rs.getString("exc_manual"));
				ex.setExcVideo(rs.getString("exc_video"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return ex;
	}

	public Menu selectMenu(Connection conn, String menuid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM M_LIST WHERE MENU_ID=?";
		Menu m=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, menuid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			    m =new Menu();
				m.setCh(rs.getInt("ch"));
				m.setFat(rs.getInt("fat"));
				m.setKcal(rs.getInt("kcal"));
				m.setNa(rs.getInt("na"));
				m.setMenuManual(rs.getString("menu_manual"));
				m.setMenuVideo(rs.getString("menu_video"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return m;
	}

	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="INSERT INTO VALUES(?,?,?,?,?,?,?,?,?,?,SYSDATE,NULL)";
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getName());
			pstmt.setString(5, m.getNickname());
			pstmt.setString(6, m.getPhone());
			pstmt.setDate(7, (Date) m.getBirth());
			pstmt.setDouble(8, m.getHeight());
			pstmt.setDouble(9, m.getWeight());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
