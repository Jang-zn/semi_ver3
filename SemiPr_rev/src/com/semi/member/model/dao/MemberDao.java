package com.semi.member.model.dao;

import static com.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.menu.model.vo.Menu;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;

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

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<Exercise> getExcList(Connection conn, String sort, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		Exercise exc=null;
		List<Exercise> list = new ArrayList();
		try {
			String path = MemberDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			int pageNo = (cPage-1)*numPerpage+1;
			int pageEnd = cPage*numPerpage;
			pstmt=conn.prepareStatement(p.getProperty("getExcList"));
			pstmt.setString(1, sort);
			pstmt.setInt(2, pageNo);
			pstmt.setInt(3, pageEnd);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				exc=new Exercise();
			    exc.setExcId(rs.getString(2));
			    exc.setExcSort(rs.getString(3));
			    exc.setExcName(rs.getString(4));
			    exc.setExcManual(rs.getString(5));
			    exc.setExcVideo(rs.getString(6));
			    list.add(exc);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//file List 가져옴
		try {
			String path = MemberDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			
			for(Exercise e : list) {
				pstmt2=conn.prepareStatement(p.getProperty("getExcFileList"));
				pstmt2.setString(1,e.getExcId());
				System.out.println(e.getExcId());
				rs2=pstmt2.executeQuery();
				
				List<String> fileList = new ArrayList();
				
				while(rs2.next()) {
					String f =rs2.getString(3);
					System.out.println(f);
					fileList.add(f);
				}
				e.setFileList(fileList);
				close(pstmt2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(rs2);
			close(pstmt);
		}
		
		
		return list;
	}
	
	public int getExcListCount(Connection conn, String sort) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			String path = MemberDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("getExcListCount"));
			pstmt.setString(1, sort);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	

	
	
}
