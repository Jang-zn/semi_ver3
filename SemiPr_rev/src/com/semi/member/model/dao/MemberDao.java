package com.semi.member.model.dao;

import static com.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import com.semi.member.daily.model.vo.DailyExercise;
import com.semi.member.daily.model.vo.DailyMenu;
import com.semi.member.daily.model.vo.DailyMenuList;
import com.semi.member.daily.model.vo.DailyRecordCheck;

import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.menu.model.vo.Menu;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;




public class MemberDao {
  
  public MemberDao () {}
	
	private Properties p = new Properties();
	
	public int SelectMemberExcListCount(Connection conn, String dayval, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("SelectMemberExcListCount"));		
			pstmt.setString(1, memberid);
			pstmt.setString(2, dayval);;
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

  
  
  
	public List<MemberExcList> SelectMemberExcList(Connection conn, int cPage, int numPerpage, String dayval, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberExcList> list=new ArrayList();
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {	
			pstmt=conn.prepareStatement(p.getProperty("SelectMemberExcList"));
			pstmt.setString(1, dayval);;
			pstmt.setString(2, memberid);
			pstmt.setInt(3, (cPage-1)*numPerpage+1);
			pstmt.setInt(4, cPage*numPerpage);
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


  
  
	public List<MemberMenuList> SelectMemberMenuList(Connection conn, int cPage2, int numPerpage2, String dayval, String time, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberMenuList> list=new ArrayList();
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("SelectMemberMenuList"));
			pstmt.setString(1, memberid);
			pstmt.setString(2, dayval);
			pstmt.setString(3, time);
			pstmt.setInt(4, (cPage2-1)*numPerpage2+1);
			pstmt.setInt(5, cPage2*numPerpage2);
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

  
  
  
	public int SelectMemberMenuListCount(Connection conn, String dayval, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("SelectMemberMenuListCount"));
			pstmt.setString(1, memberid);
			pstmt.setString(2, dayval);;
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
		Exercise ex =null;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectExceriseinfo"));
			pstmt.setString(1, excid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				ex =new Exercise();
				ex.setExcId(rs.getString("exc_id"));
				ex.setExcName(rs.getString("exc_name"));
				ex.setExcManual(rs.getString("exc_manual"));
				ex.setExcVideo(rs.getString("exc_video"));
			}
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally{
		     close(rs);
		     close(pstmt);
		    }
		
		return ex;
	}

  
  
  
	public Menu selectMenu(Connection conn, String menuid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Menu m=null;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}			
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectMenu"));
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
		PreparedStatement pstmt=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}
		try {
			pstmt=conn.prepareStatement(p.getProperty("MemberexclistDelete"));
			pstmt.setInt(1, excno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
     close(pstmt);
    }
		
		return result;
	}

  
  
	public int MembermenulistDelete(Connection conn, int menuno, String memberid) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}
		try {
			pstmt=conn.prepareStatement(p.getProperty("MembermenulistDelete"));
			pstmt.setInt(1, menuno);
			pstmt.setString(2, memberid);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
     close(pstmt);
    }
		return result;
	}
	public int excDailyDeleteno(Connection conn, int excno) {
		System.out.println(excno+"여까진 오냐?");
		PreparedStatement pstmt=null;
		int su=0;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}
		try {
			pstmt=conn.prepareStatement(p.getProperty("excDailyDeleteno"));
			pstmt.setInt(1, excno);
			su=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				close(pstmt);
		}
		return su;
	}




	public void menuDailyDeleteno(Connection conn, int menuno) {
		PreparedStatement pstmt=null;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}
		try {
			pstmt=conn.prepareStatement(p.getProperty("menuDailyDeleteno"));
			pstmt.setInt(1, menuno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
				close(pstmt);
		}
		
	}

  
  
  //fileList로 수정하셔야될겁니다
	public List<String> selectExceriseimg(Connection conn, String excid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> list =new ArrayList();
		String imgpath="";
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectExceriseimg"));
			pstmt.setString(1, excid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				imgpath=rs.getString("img_name");
				list.add(imgpath);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
     close(rs);
     close(pstmt);
    }
		
		return list;
	}

  
  
    //fileList로 수정하셔야될겁니다
	public List<String> selectMenuimg(Connection conn, String menuid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<String> list = new ArrayList();
		String imgpath="";
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}			
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectMenuimg"));
			pstmt.setString(1, menuid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				imgpath=rs.getString("img_name");
				list.add(imgpath);
			
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally{
      close(rs);
     close(pstmt);
    }		
		return list;
	}

  
  
	public MemberExcList selectExercisebyno(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberExcList  mel=null;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectExercisebyno"));
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
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("updateExcrcise"));
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
		MemberMenuList  mml=null;
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectMenubyno"));
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
		String path=MemberDao.class.getResource("/sql/mylist_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("updateMenu"));
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


  
	////수정라인
  
  

	public List<DailyMenuList> selectDailymenulist(Connection conn, String dayval,String memberid, String daytime) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DailyMenuList> list=new ArrayList();
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectDailymenulist"));
			pstmt.setString(1, memberid);
			pstmt.setString(2, dayval);;
//			pstmt.setString(3, daytime);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DailyMenuList dml=new DailyMenuList();
				dml.setMenuNo(rs.getInt("menu_no"));
				dml.setAmount(rs.getInt("amount"));
				dml.setMenuId(rs.getString("menu_id"));
				dml.setMenuDaytime(rs.getString("menu_daytime"));
				dml.setMenuName(rs.getString("menu_name"));
				dml.setCh(rs.getInt("ch"));
				dml.setFat(rs.getInt("fat"));
				dml.setKcal(rs.getInt("kcal"));
				dml.setNa(rs.getInt("na"));
				dml.setProt(rs.getInt("prot"));
				list.add(dml);
			
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}

  
  ////////////////////////////////////////////
  ////사용~~~~~~~~~~~~~~~~~~~~~~~~~
  
	public int insertMenuDaliylog(Connection conn, String menuarr) {
		PreparedStatement pstmt=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}			
		try {
			pstmt=conn.prepareStatement(p.getProperty("insertMenuDaliylog"));
			pstmt.setString(1, menuarr);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
  
  

///////////////////////////////////daliy log ����
	public String selectSysdate(Connection conn, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		String sysdate="";
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectSysdate"));
			pstmt.setString(1, memberid);
			rs=pstmt.executeQuery();
			if(rs.next()) sysdate=rs.getString("exc_date");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return sysdate;
	}
	
	//////////////////////////////////사용 1

	public int[] selectExcno(Connection conn, String excday, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		int[] excno=new int[100];
		int index=0;
		String sql="SELECT DISTINCT(EXC_NO) FROM MEM_E_LIST JOIN DAILY_E USING(EXC_NO) WHERE MEMBER_ID=? AND EXC_WEEK=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			pstmt.setString(2, excday);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				excno[index]=rs.getInt("exc_no");
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return excno;
	}

	public int insertExcDaliylog(Connection conn, String excarr) {
		PreparedStatement pstmt=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}			
		try {
			pstmt=conn.prepareStatement(p.getProperty("insertExcDaliylog"));
			pstmt.setString(1, excarr);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
		
		
	}
	


	public List<MemberExcList> selectExceriseinfo2(Connection conn, String excday,String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberExcList> list=new ArrayList();
		String sql="SELECT * FROM MEM_E_LIST JOIN DAILY_E USING(EXC_NO) WHERE MEMBER_ID=? AND EXC_WEEK=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			pstmt.setString(2, excday);;
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberExcList mel=new MemberExcList();
				mel.setExcNo(rs.getInt("exc_no"));
				mel.setSets(rs.getInt("sets"));
				mel.setReps(rs.getInt("reps"));
				mel.setWeight(rs.getInt("weight"));
				mel.setExcId(rs.getString("exc_id"));
				mel.setExcName(rs.getString("exc_name"));
				list.add(mel);
				
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}




	



	public int emailDuplication(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs= null;
		int result =0;
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
	
		try {
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("emailDuplication"));
			pstmt.setString(1, email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
				result=rs.getInt(1);
				System.out.println(rs.getInt(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
  		return result;
	}  
  
  
  
    
    	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt=null;
		//String sql="INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,?,SYSDATE,NULL)";
		int result=0;
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			p.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		try {
			
			
			pstmt=conn.prepareStatement(p.getProperty("insertMember"));
			pstmt.setString(1, m.getMemberId());
			pstmt.setString(2, m.getMemberPw());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getName());
			pstmt.setString(5, m.getNickname());
			pstmt.setDate(6,new java.sql.Date((m.getBirth()).getTime()));
//			pstmt.setString(6, new SimpleDateFormat("yy/MM/dd").format(m.getBirth()));
			pstmt.setString(7, m.getPhone());
			pstmt.setDouble(8, m.getHeight());
			pstmt.setDouble(9, m.getWeight());
			pstmt.setString(10,m.getGender());
			pstmt.setString(11, m.getProfileImg());
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}




	public Member login(Connection conn, String userId, String password) {
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		Member m =null;
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			p.load(new FileReader(path));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		try {
			pstmt=conn.prepareStatement(p.getProperty("login"));
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m=new Member();
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberPw(rs.getString("MEMBER_PW"));
				m.setEmail(rs.getString("EMAIL"));
				m.setName(rs.getString("NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setBirth(rs.getDate("BIRTH"));
				m.setPhone(rs.getString("PHONE"));
				m.setHeight(rs.getDouble("HEIGHT"));
				m.setWeight(rs.getDouble("WEIGHT"));
				m.setGender(rs.getString("GENDER"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				m.setProfileImg(rs.getString("PROFILE_IMG"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
 		return m;

	}





	public int userIdDuplication(Connection conn, String userId) {
		PreparedStatement pstmt =null;
		int result=0;
		ResultSet rs =null;
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("userIdDuplication"));
			pstmt.setString(1, userId);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
				result=rs.getInt(1);
				System.out.println(rs.getInt(1));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}




	public int nickNameDuplication(Connection conn, String nickName) {
		PreparedStatement pstmt =null;
		int result=0;
		ResultSet rs =null;
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("nickNameDuplication"));
			pstmt.setString(1, nickName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}




	public Member findId(Connection conn, String name, String email) {
		PreparedStatement pstmt =null;
		Member m =null;
		ResultSet rs = null;
		String path=MemberDao.class.getResource("/sql/member_sql.properties").getPath();
		try {
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("findId"));
			pstmt.setString(1,name);
			pstmt.setString(2,email);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m= new Member();
				m.setMemberId(rs.getString("MEMBER_ID"));
				m.setMemberPw(rs.getString("MEMBER_PW"));
				m.setEmail(rs.getString("EMAIL"));
				m.setName(rs.getString("NAME"));
				m.setNickname(rs.getString("NICKNAME"));
				m.setBirth(rs.getDate("BIRTH"));
				m.setPhone(rs.getString("PHONE"));
				m.setHeight(rs.getDouble("HEIGHT"));
				m.setWeight(rs.getDouble("WEIGHT"));
				m.setGender(rs.getString("GENDER"));
				m.setEnrollDate(rs.getDate("ENROLL_DATE"));
				m.setProfileImg(rs.getString("PROFILE_IMG"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return m;
	}   
    




	public List<MemberExcList> selectDailyExclist(Connection conn,String dayval,String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberExcList> list=new ArrayList();
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {	
			pstmt=conn.prepareStatement(p.getProperty("selectDailyExclist"));
			pstmt.setString(1, memberid);
			pstmt.setString(2, dayval);		
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberExcList mel=new MemberExcList();
				mel.setExcNo(rs.getInt("exc_no"));
				mel.setSets(rs.getInt("sets"));
				mel.setReps(rs.getInt("reps"));
				mel.setWeight(rs.getInt("weight"));
				mel.setExcId(rs.getString("exc_id"));
				mel.setExcName(rs.getString("exc_name"));
				list.add(mel);
				
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}


	
	
	public List<DailyExercise> selectMemberDailyExcercise(Connection conn, String memberid, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DailyExercise> list=new ArrayList();
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectMemberDailyExcercise"));
			pstmt.setString(1, memberid);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DailyExercise de=new DailyExercise();
				de.seteLogNo(rs.getInt("rnum"));
				de.setExcDate(rs.getDate("exc_date"));
				System.out.println(de.getExcDate());
				list.add(de);			
			}					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}




	public MemberExcList selectMemberExcListbyno(Connection conn, int i) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MemberExcList mel=null;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {	
			pstmt=conn.prepareStatement(p.getProperty("selectMemberExcListbyno"));
			pstmt.setInt(1, i);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				mel=new MemberExcList();
				mel.setExcNo(rs.getInt("exc_no"));
				mel.setSets(rs.getInt("sets"));
				mel.setReps(rs.getInt("reps"));
				mel.setWeight(rs.getInt("weight"));
				mel.setExcId(rs.getString("exc_id"));
				mel.setExcName(rs.getString("exc_name"));			
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return mel;
	}




	public String selectmenuSysdate(Connection conn, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		String sysdate="";
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectmenuSysdate"));
			pstmt.setString(1, memberid);
			rs=pstmt.executeQuery();
			if(rs.next()) sysdate=rs.getString(1);
			System.out.println(sysdate);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return sysdate;
	}




	public List<DailyMenu> selectMemberDailyMenu(Connection conn, String memberid, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DailyMenu> list=new ArrayList();
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectMemberDailyMenu"));
			pstmt.setString(1, memberid);
			pstmt.setInt(2, (cPage-1)*numPerpage+1);
			pstmt.setInt(3, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				DailyMenu dm=new DailyMenu();
				dm.setmLogNo(rs.getInt("rnum"));
				dm.setMenuDate(rs.getDate("menu_date"));
				list.add(dm);			
			}					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}




	public int[] selectmenuno(Connection conn, String menuday, String memberid, String daytime) {
		PreparedStatement pstmt=null;
		ResultSet rs =null;
		int[] menuno=new int[300];
		int index=0;
		String sql="SELECT DISTINCT(MENU_NO) FROM MEM_M_LIST JOIN DAILY_M USING(MENU_NO) WHERE MEMBER_ID=? AND MENU_WEEK=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberid);
			pstmt.setString(2, menuday);
			//pstmt.setString(3, daytime);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				menuno[index]=rs.getInt("menu_no");
				index++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return menuno;
	}




	public DailyMenuList selectMemberMenuListbyno(Connection conn, int i) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		DailyMenuList dml=null;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}	
		try {	
			pstmt=conn.prepareStatement(p.getProperty("selectMemberMenuListbyno"));
			pstmt.setInt(1, i);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dml=new DailyMenuList();
				dml.setMenuNo(rs.getInt("menu_no"));
				dml.setAmount(rs.getInt("amount"));
				dml.setMenuId(rs.getString("menu_id"));
				dml.setMenuDaytime(rs.getString("menu_daytime"));
				dml.setMenuName(rs.getString("menu_name"));
				dml.setCh(rs.getInt("ch"));
				dml.setFat(rs.getInt("fat"));
				dml.setKcal(rs.getInt("kcal"));
				dml.setNa(rs.getInt("na"));
				dml.setProt(rs.getInt("prot"));

			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return dml;
	}




	public int selectDailyexclistCount(Connection conn, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectDailyexclistCount"));
			pstmt.setString(1, memberid);
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




	public int selectDailymenulistCount(Connection conn, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("selectDailymenulistCount"));
			pstmt.setString(1, memberid);
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




	public int YNCheck(Connection conn, String excdate, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("YCheck"));
			pstmt.setString(1, excdate);
			pstmt.setString(2, memberid);
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




	public int YNCheckAll(Connection conn, String excdate, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("YNCheckAll"));
			pstmt.setString(1, excdate);
			pstmt.setString(2, memberid);
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




	public List<DailyRecordCheck> dailyRecord(Connection conn, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DailyRecordCheck> list=new ArrayList();
		DailyRecordCheck drc=null;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("dailyRecord"));
			pstmt.setString(1, memberid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				drc=new DailyRecordCheck();
				drc.setExcYN(rs.getString(2));
				list.add(drc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return list;
	}




	public List<DailyRecordCheck> dailyRecordmenu(Connection conn, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<DailyRecordCheck> list=new ArrayList();
		DailyRecordCheck drc=null;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("dailyRecordmenu"));
			pstmt.setString(1, memberid);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				drc=new DailyRecordCheck();
				drc.setMenuYN(rs.getString(2));
				list.add(drc);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return list;
	}




	public int YNmenuCheckAll(Connection conn, String menudate, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("YNmenuCheckAll"));
			pstmt.setString(1, menudate);
			pstmt.setString(2, memberid);
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




	public int YNmenuChseck(Connection conn, String menudate, String memberid) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		String path=MemberDao.class.getResource("/sql/daily_sql.properties").getPath();
		try {
			p.load(new FileReader(path));		
		}catch(IOException e) {
			e.printStackTrace();
		}		
		try {
			pstmt=conn.prepareStatement(p.getProperty("YmenuCheck"));
			pstmt.setString(1, menudate);
			pstmt.setString(2, memberid);
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


}












