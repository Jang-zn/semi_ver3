package com.semi.exc.model.dao;

import static com.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Calendar;

import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.exc.model.vo.MemberExercise;
import com.semi.member.model.dao.MemberDao;

public class ExcDao {

	public ExcDao() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Exercise> getExcList(Connection conn, String sort, int cPage, int numPerpage) {
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		Exercise exc=null;
		List<Exercise> list = new ArrayList();
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
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
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			
			for(Exercise e : list) {
				pstmt2=conn.prepareStatement(p.getProperty("getExcFileList"));
				pstmt2.setString(1,e.getExcId());
				rs2=pstmt2.executeQuery();
				
				List<String> fileList = new ArrayList();
				
				while(rs2.next()) {
					String f =rs2.getString(3);
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
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
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
	
	public Exercise getExcInfo(Connection conn, String excName) {
		PreparedStatement pstmt=null;
		PreparedStatement pstmt2=null;
		ResultSet rs=null;
		ResultSet rs2=null;
		Exercise exc=new Exercise();
		List<Exercise> list = new ArrayList();
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("getExcInfo"));
			pstmt.setString(1, excName);
			rs=pstmt.executeQuery();
			if(rs.next()) {
			    exc.setExcId(rs.getString(1));
			    exc.setExcSort(rs.getString(2));
			    exc.setExcName(rs.getString(3));
			    exc.setExcManual(rs.getString(4));
			    exc.setExcVideo(rs.getString(5));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//file List 가져옴
		try {
			String path = MemberDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt2=conn.prepareStatement(p.getProperty("getExcFileList"));
			pstmt2.setString(1,exc.getExcId());
			rs2=pstmt2.executeQuery();
			List<String> fileList = new ArrayList();
			while(rs2.next()) {
				String f =rs2.getString(3);
				fileList.add(f);
			}
				exc.setFileList(fileList);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			close(rs);
			close(rs2);
			close(pstmt);
			close(pstmt2);
			
		}
		return exc;
	}
	
	
	public int insertMemberExc(Connection conn, MemberExercise me) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("insertMemberExc"));
			pstmt.setString(1, me.getMemberId());
			pstmt.setString(2, me.getExcId());
			pstmt.setString(3, me.getExcId_c());
			pstmt.setInt(4, me.getReps());
			pstmt.setInt(5, me.getSets());
			pstmt.setInt(6, me.getWeight());
			pstmt.setString(7, me.getExcWeek());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public Map[] planCountExc (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = ExcDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("planCountExc").replace("<L>", ""+length);
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
	
	public Map[] reasonE (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = ExcDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("reasonE").replace("<L>", ""+length);
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
	
	public Map[] planCountExcforChart (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = ExcDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("planCountExcforChart").replace("<L>", ""+length);
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
							String trashD = (String)list[length-1].get("date"); //
						    SimpleDateFormat format1 = new SimpleDateFormat("MM-dd");
						    Date trashDate = format1.parse(trashD);			    
						    Calendar cal = Calendar.getInstance();
						    cal.setTime(trashDate);
						    cal.add(Calendar.DATE,-period);
						    String res = format1.format(cal.getTime());
						    map.put("date", res);
							list[i]= map;
							period--;
						}catch(Exception e){
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
			
		}finally {
			close(rs);
			close(pstmt);
			
		}
		return list;
	}
	
	public Map[] planStackExcTotal (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		Map[] list = new Map[length];
		try {
			String path = ExcDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("planStackExcTotal").replace("<L>", ""+length);
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
			    map.put("repset", rs.getInt(3));
			    map.put("repsetwei", rs.getInt(4));
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
	
	public int checkDupExc (Connection conn, MemberExercise me){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("checkDupExc"));
			pstmt.setString(1, me.getMemberId());
			pstmt.setString(2, me.getExcId());
			pstmt.setString(3, me.getExcWeek());
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
	
	public int updateMemberExc(Connection conn, MemberExercise me) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("updateMemberExc"));
			pstmt.setInt(1, me.getReps());
			pstmt.setInt(2, me.getSets());
			pstmt.setInt(3, me.getWeight());
			pstmt.setString(4, me.getMemberId());
			pstmt.setString(5, me.getExcId());
			pstmt.setString(6, me.getExcWeek());
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public List<MemberExercise> getWlist(Connection conn, String memberId, String date){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberExercise> wlist = new ArrayList();
		MemberExercise mem = null;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("getWlist"));
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, date.split(",")[1]); //요일만 떼서 검색
			rs=pstmt.executeQuery();
			while(rs.next()) {
				mem=new MemberExercise();
				mem.setExcNo(rs.getInt(1));
				mem.setMemberId(rs.getString(2));
				mem.setExcId(rs.getString(3));
				mem.setReps(rs.getInt(5));
				mem.setSets(rs.getInt(6));
				mem.setWeight(rs.getInt(7));
				mem.setExcWeek(rs.getString(8));
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
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
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
			
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}
	
	public int setMonthlyPlan(Connection conn, List<MemberExercise> wlist, String date) {
		PreparedStatement pstmt=null;
		int result=0;
		int count = 0;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("setMonthlyPlan"));
			for(MemberExercise me:wlist) {
				pstmt.setInt(1, me.getExcNo());
				pstmt.setString(2, date.split(",")[0]);
				result=pstmt.executeUpdate();
				if(result!=0) {
					count++;
				}
			}
		} catch (Exception e) {
			
		}finally {
			close(pstmt);
		}
		
		return count;
	}
	
	public int todayCheck(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("todayCheck"));
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public int autoN(Connection conn, String memberId) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			pstmt=conn.prepareStatement(p.getProperty("autoN"));
			pstmt.setString(1, memberId);
			result=pstmt.executeUpdate();
			
		} catch (Exception e) {
			
		}finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int reasonUpdate(Connection conn, String memberId, String date, int reason) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			String path = ExcDao.class.getResource("/sql/excList_sql.properties").getPath();
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
	
	
}
