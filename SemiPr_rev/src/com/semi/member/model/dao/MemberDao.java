package com.semi.member.model.dao;

import static com.semi.common.JdbcTemplate.close;



import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.semi.member.daily.model.vo.DailyExercise;
import com.semi.member.daily.model.vo.DailyMenu;
import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.menu.model.vo.Menu;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;




public class MemberDao {
  
  public MemberDao () {}
	
	private Properties p = new Properties();
	
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
				mel.setExcNo(rs.getInt("exc_no"));
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
				mml.setMenuNo(rs.getInt("menu_no"));
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
				ex.setExcName(rs.getString("exc_name"));
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
			    m.setMenuName(rs.getString("menu_name"));
				m.setCh(rs.getInt("ch"));
				m.setFat(rs.getInt("fat"));
				m.setKcal(rs.getInt("kcal"));
				m.setNa(rs.getInt("na"));
				m.setMenuManual(rs.getString("menu_manual"));
				m.setMenuVideo(rs.getString("menu_video"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
     close(rs);
     close(pstmt);
    }
		return m;
	}

  
  
  

	public int MemberexclistDelete(Connection conn, int excno) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		int result=0;
		String sql="DELETE FROM MEM_E_LIST WHERE EXC_NO=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, excno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
     close(pstmt);
    }
		
		return result;
	}

  
  
	public int MembermenulistDelete(Connection conn, int menuno) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		int result=0;
		String sql="DELETE FROM MEM_M_LIST WHERE MENU_NO=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, menuno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
     close(pstmt);
    }
		return result;
	}

  
  
  //fileList로 수정하셔야될겁니다
	public String selectExceriseimg(Connection conn, String excid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String imgpath="";
		String sql="SELECT * FROM E_FILE WHERE EXC_ID=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, excid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				imgpath=rs.getString("img_name");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
     close(rs);
     close(pstmt);
    }
		
		return imgpath;
	}

  
  
    //fileList로 수정하셔야될겁니다
	public String selectMenuimg(Connection conn, String menuid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String imgpath="";
		String sql="SELECT * FROM MENU_FILE WHERE MENU_ID=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, menuid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				imgpath=rs.getString("img_name");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
      close(rs);
     close(pstmt);
    }
		
		return imgpath;
	}

  
  
	public MemberExcList selectExercisebyno(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEM_E_LIST WHERE EXC_NO=?";
		MemberExcList  mel=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mel =new MemberExcList();
				mel.setExcNo(rs.getInt("exc_no"));
				mel.setReps(rs.getInt("reps"));
				mel.setSets(rs.getInt("sets"));
				mel.setWeight(rs.getDouble("weight"));
				mel.setExcWeek(rs.getString("exc_week"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
      close(rs);
     close(pstmt);
    }
		return mel;
	}

  
	public int updateExcrcise(Connection conn, MemberExcList mel) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="UPDATE MEM_E_LIST SET REPS=?,SETS=?,WEIGHT=?,EXC_WEEK=? WHERE exc_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mel.getReps());
			pstmt.setInt(2, mel.getSets());
			pstmt.setDouble(3, mel.getWeight());
			pstmt.setString(4, mel.getExcWeek());
			pstmt.setInt(5, mel.getExcNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
     close(pstmt);
    }
		
		return result;
	}

  
  
	public MemberMenuList selectMenubyno(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="SELECT * FROM MEM_M_LIST WHERE MENU_NO=?";
		MemberMenuList  mml=null;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mml =new MemberMenuList();
				mml.setAmount(rs.getInt("amount"));
				mml.setMenuDaytime(rs.getString("menu_daytime"));
				mml.setMenuWeek(rs.getString("menu_week"));
				mml.setMenuNo(rs.getInt("menu_no"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
      close(rs);
     close(pstmt);
    }
		
		return mml;
	}

  
  
	public int updateMenu(Connection conn, MemberMenuList mml) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="UPDATE MEM_M_LIST SET AMOUNT=?,MENU_WEEK=?,MENU_DAYTIME=? WHERE menu_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mml.getAmount());
			pstmt.setString(2, mml.getMenuWeek());
			pstmt.setString(3, mml.getMenuDaytime());
			pstmt.setInt(4, mml.getMenuNo());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
     close(pstmt);
    }
		
		return result;
	}

  
  
	public List<MemberExcList> SelectMemberExcDailyList(Connection conn, String dayval) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberExcList> list=new ArrayList();
		String sql="SELECT * FROM MEM_E_LIST WHERE EXC_WEEK=?";
		try {
			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, m.getMemberId());
			pstmt.setString(1, dayval);;
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberExcList mel=new MemberExcList();
				mel.setExcNo(rs.getInt("exc_no"));
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

  
  
	public List<MemberMenuList> SelectMemberMenuDailyList(Connection conn, String dayval) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberMenuList> list=new ArrayList();
		String sql="SELECT * FROM MEM_M_LIST WHERE menu_WEEK=?";
		try {
			pstmt=conn.prepareStatement(sql);
//			pstmt.setString(1, m.getMemberId());
			pstmt.setString(1, dayval);;
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberMenuList mml=new MemberMenuList();
				mml.setMenuNo(rs.getInt("menu_no"));
				mml.setAmount(rs.getInt("amount"));
				mml.setMenuId(rs.getString("menu_id"));
				mml.setMenuDaytime(rs.getString("menu_daytime"));
				list.add(mml);
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

  
  
	public int insertExcDaliylog(Connection conn) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO DAILY_E (E_LOG_NO,EXC_DATE,EXC_PLAN_CHECK,REASON) VALUES(SEQ_E_LOG_NO.NEXTVAL,TO_CHAR(SYSDATE,'YYYY-MM-DD'),NULL,NULL)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
     close(pstmt);
    }
		
		return result;
	}

  
  
	public int insertMenuDaliylog(Connection conn) {
		PreparedStatement pstmt=null;
		int result=0;
		String sql="INSERT INTO DAILY_M (M_LOG_NO,MENU_DATE,MENU_PLAN_CHECK,REASON) VALUES(SEQ_M_LOG_NO.NEXTVAL,TO_CHAR(SYSDATE,'YYYY-MM-DD'),NULL,NULL)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}

  
  
	public List<DailyExercise> selectMemberDailyExcercise() {

		return null;
	}

  
  
	public List<DailyMenu> selectMemberDailyMenu() {
		// TODO Auto-generated method stub
		return null;
	}

	public MemberExcList selectmel(Connection conn, String admin) {
		// TODO Auto-generated method stub
		return null;
	}

}
