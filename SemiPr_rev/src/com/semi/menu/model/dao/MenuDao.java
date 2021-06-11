package com.semi.menu.model.dao;

import static com.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.semi.exc.model.dao.ExcDao;
import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.exc.model.vo.MemberExercise;
import com.semi.member.menu.model.vo.MemberMenu;
import com.semi.member.menu.model.vo.Menu;
import com.semi.member.model.dao.MemberDao;

public class MenuDao {

	public MenuDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Menu> getMenuList(Connection conn, String sort, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		Menu m=null;
		List<Menu> list = new ArrayList();
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			int pageNo = (cPage-1)*numPerpage+1;
			int pageEnd = cPage*numPerpage;
			pstmt=conn.prepareStatement(p.getProperty("getMenuList"));
			pstmt.setString(1, sort);
			pstmt.setInt(2, pageNo);
			pstmt.setInt(3, pageEnd);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				m=new Menu();
			    m.setMenuId(rs.getString(2));
			    m.setMenuSort(rs.getString(3));
			    m.setMenuName(rs.getString(4));
			    m.setKcal(rs.getInt(5));
			    m.setCh(rs.getInt(6));
			    m.setProt(rs.getInt(7));
			    m.setFat(rs.getInt(8));
			    m.setNa(rs.getInt(9));
			    m.setMenuManual(rs.getString(10));
			    m.setMenuVideo(rs.getString(11));
			    list.add(m);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//file List 가져옴
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			
			for(Menu mn : list) {
				pstmt2=conn.prepareStatement(p.getProperty("getMenuFileList"));
				pstmt2.setString(1,mn.getMenuId());
				rs2=pstmt2.executeQuery();
				
				List<String> fileList = new ArrayList();
				
				while(rs2.next()) {
					String f =rs2.getString(3);
					fileList.add(f);
				}
				mn.setFileList(fileList);
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
	
	public int getMenuListCount(Connection conn, String sort) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("getMenuListCount"));
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
	
	public Menu getMenuInfo(Connection conn, String menuName) {
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		Menu m=new Menu();
		List<Exercise> list = new ArrayList();
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("getMenuInfo"));
			pstmt.setString(1, menuName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				m.setMenuId(rs.getString(1));
			    m.setMenuSort(rs.getString(2));
			    m.setMenuName(rs.getString(3));
			    m.setKcal(rs.getInt(4));
			    m.setCh(rs.getInt(5));
			    m.setProt(rs.getInt(6));
			    m.setFat(rs.getInt(7));
			    m.setNa(rs.getInt(8));
			    m.setMenuManual(rs.getString(9));
			    m.setMenuVideo(rs.getString(10));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//file List 가져옴
		try {
			String path = MemberDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt2=conn.prepareStatement(p.getProperty("getMenuFileList"));
			pstmt2.setString(1,m.getMenuId());
			rs2=pstmt2.executeQuery();
			List<String> fileList = new ArrayList();
			while(rs2.next()) {
				String f =rs2.getString(3);
				fileList.add(f);
			}
				m.setFileList(fileList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(rs2);
			close(pstmt);
			close(pstmt2);
			
		}
		return m;
	}
	
	
	public int insertMemberMenu(Connection conn, MemberMenu mm) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("insertMemberMenu"));
			pstmt.setString(1, mm.getMenuId());
			pstmt.setString(2, mm.getMenuId_c());
			pstmt.setString(3, mm.getMemberId());
			pstmt.setInt(4, 1);
			pstmt.setString(5, mm.getMenuWeek());
			pstmt.setString(6, mm.getMenuDayTime());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Map[] planCountMenu (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = MenuDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("planCountMenu").replace("<L>", ""+length);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, date);
			pstmt.setString(3, date);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			    map = new HashMap();
			    int d = Integer.parseInt(rs.getString(2).substring(8,10));
			    map.put("count", rs.getInt(1));
			    map.put("date", d);
			    map.put("check", rs.getString(3));
			    list[d-1]= map;
			}
			for(int i=0;i<length;i++) {
				if(list[i]!=null) {
					
				}else {
					map = new HashMap();
					list[i]= map;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return list;
	}

	public Map[] reasonM (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = MenuDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("reasonM").replace("<L>", ""+length);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, date);
			pstmt.setString(3, date);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			    map = new HashMap();
			    int d = Integer.parseInt(rs.getString(2).substring(8,10));
			    map.put("count", rs.getInt(1));
			    map.put("date", d);
			    map.put("check", rs.getString(3));
			    map.put("reason", rs.getString(4));
			    list[d-1]= map;
			}
			for(int i=0;i<length;i++) {
				if(list[i]!=null) {
					
				}else {
					map = new HashMap();
					list[i]= map;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return list;
	}
	
	
	public Map[] planCountMenuforChart (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = MenuDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("planCountMenuforChart").replace("<L>", ""+length);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, date);
			pstmt.setString(3, date);
			rs=pstmt.executeQuery();
			int count =length-1;
			while(rs.next()) {
			    map = new HashMap();
			    String day = rs.getString(2).substring(5,10);
			    map.put("count", rs.getInt(1));
			    map.put("date", day);
			    map.put("check", rs.getString(3));
			    list[count--]= map;
			}
			int period=length-1;
			for(int i=0;i<length;i++) {
				if(list[i]!=null) {
					
				}else {
					try {
						map = new HashMap();
						String trashD = (String)list[length-1].get("date");
					    SimpleDateFormat format1 = new SimpleDateFormat("MM-dd");
					    Date trashDate = format1.parse(trashD);			    
					    Calendar cal = Calendar.getInstance();
					    cal.setTime(trashDate);
					    cal.add(Calendar.DATE,-period);
					    String res = format1.format(cal.getTime());
					    map.put("date", res);
						list[i]= map;
						period--;
					}catch(Exception e) {
						map = new HashMap();
						Calendar cal = Calendar.getInstance();
						int last = cal.getActualMaximum(cal.DAY_OF_MONTH);  //월 길이 (mm/ dd부분에 사용)
						int m = cal.get(cal.MONTH);
						String month="";		//MM
						if(m>10) {
							month=""+(m+1);
						}else {
							month="0"+(m+1);
						}						
						String trashD = month+"-"+last;
						
						//몬가..몬가 된거같음
						SimpleDateFormat format1 = new SimpleDateFormat("MM-dd");
					    Date trashDate = format1.parse(trashD);			    
					    Calendar calR = Calendar.getInstance();
					    calR.setTime(trashDate);
					    calR.add(Calendar.DATE,-period);
					    String res = format1.format(cal.getTime());
					    map.put("date", res);
						list[i]= map;
						period--;
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return list;
	}
	
	
	public Map[] planStackMenuTotal (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = MenuDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("planStackMenuTotal").replace("<L>", ""+length);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, date);
			pstmt.setString(3, date);
			rs=pstmt.executeQuery();
			int count =length-1;
			while(rs.next()) {
			    map = new HashMap();
			    String day = rs.getString(1).substring(5,10);
			    map.put("date", day);
			    map.put("check", rs.getString(2));
			    map.put("kcal", rs.getInt(3));
			    map.put("ch", rs.getInt(4));
			    map.put("prot", rs.getInt(5));
			    map.put("fat", rs.getInt(6));
			    list[count--]= map;
			    
			}
			int period=length-1;
			for(int i=0;i<length;i++) {
				if(list[i]!=null) {
					
				}else {
					try {
						map = new HashMap();
						String trashD = (String)list[length-1].get("date");
					    SimpleDateFormat format1 = new SimpleDateFormat("MM-dd");
					    Date trashDate = format1.parse(trashD);			    
					    Calendar cal = Calendar.getInstance();
					    cal.setTime(trashDate);
					    cal.add(Calendar.DATE,-period);
					    String res = format1.format(cal.getTime());
					    map.put("date", res);
						list[i]= map;
						period--;
					}catch(Exception e) {
						map = new HashMap();
						Calendar cal = Calendar.getInstance();
						int last = cal.getActualMaximum(cal.DAY_OF_MONTH);  //월 길이 (mm/ dd부분에 사용)
						int m = cal.get(cal.MONTH);
						String month="";		//MM
						if(m>10) {
							month=""+(m+1);
						}else {
							month="0"+(m+1);
						}						
						String trashD = month+"-"+last;
						
						//몬가..몬가 된거같음
						SimpleDateFormat format1 = new SimpleDateFormat("MM-dd");
					    Date trashDate = format1.parse(trashD);			    
					    Calendar calR = Calendar.getInstance();
					    calR.setTime(trashDate);
					    calR.add(Calendar.DATE,-period);
					    String res = format1.format(cal.getTime());
					    map.put("date", res);
						list[i]= map;
						period--;
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return list;
	}
	
	
	public int checkDupMenu (Connection conn, MemberMenu mm){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("checkDupMenu"));
			pstmt.setString(1, mm.getMemberId());
			pstmt.setString(2, mm.getMenuId());
			pstmt.setString(3, mm.getMenuWeek());
			pstmt.setString(4, mm.getMenuDayTime());
			rs=pstmt.executeQuery();
			if(rs.next()) {
			    result=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return result;
	}
	
	
	public List<MemberMenu> getWlist(Connection conn, String memberId, String date){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberMenu> wlist = new ArrayList();
		MemberMenu mem = null;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("getWlist"));
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, date.split(",")[1]); //요일만 떼서 검색
			rs=pstmt.executeQuery();
			while(rs.next()) {
				mem=new MemberMenu();
				mem.setMenuNo(rs.getInt(1));
				mem.setMenuId(rs.getString(3));
				mem.setMemberId(rs.getString(4));
				mem.setMenuWeek(rs.getString(6));
				wlist.add(mem);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return wlist;
	}
	
	public int getPlanCheck(Connection conn, String memberId, String date) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("getPlanCheck"));
			pstmt.setString(1, memberId);
			pstmt.setString(2, date.split(",")[0]);
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
	
	public int setMonthlyPlan(Connection conn, List<MemberMenu> wlist, String date) {
		PreparedStatement pstmt=null;
		int result=0;
		int count = 0;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("setMonthlyPlan"));
			for(MemberMenu me:wlist) {
				pstmt.setInt(1, me.getMenuNo());
				pstmt.setString(2, date.split(",")[0]);
				result=pstmt.executeUpdate();
				if(result!=0) {
					count++;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return count;
	}
	
	public int todayCheck(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("todayCheck"));
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int autoN(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = MenuDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("autoN"));
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int reasonUpdate(Connection conn, String memberId, String date, int reason) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = ExcDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("reasonUpdate"));
			pstmt.setInt(1, reason);
			pstmt.setString(2, memberId);
			pstmt.setString(3, date);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deletePlan(Connection conn, String memberId, String date) {
		PreparedStatement pstmt=null;
		int result=0;
		
		try {
			String path = ExcDao.class.getResource("/sql/menuList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("deleteMonthlyPlan"));
			pstmt.setString(1, memberId);
			pstmt.setString(2,date);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
