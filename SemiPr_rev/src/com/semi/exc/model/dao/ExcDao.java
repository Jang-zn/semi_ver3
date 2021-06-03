package com.semi.exc.model.dao;

import static com.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

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
	
	
	public List<Map> planCountExc (Connection conn, String memberId, String date, int length){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Map map = null;
		List<Map> list = new ArrayList();
		try {
			String path = ExcDao.class.getResource("/sql/monthly_sql.properties").getPath();
			Properties p = new Properties();
			p.load(new FileReader(path));
			String sql = p.getProperty("planCountExc").replace("<L>", ""+length);
			System.out.println(sql);
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, date);
			pstmt.setString(3, date);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			    map = new HashMap();
			    System.out.println(rs.getString(2));
			    int d = Integer.parseInt(rs.getString(2).substring(7));
			    map.put("count", rs.getInt(1));
			    map.put("date", d);
			    map.put("check", rs.getString(3));
			    list.add(d-1, map);
			}
			if(list.size()<length) {
				for(int i=0;i<length;i++) {
					if(list.get(i)==null) {
						map = new HashMap();
						list.add(i, map);
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

	
}
