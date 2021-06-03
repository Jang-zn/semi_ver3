package com.semi.statistic.model.dao;

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

import com.semi.member.daily.model.vo.DailyMenu;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;
import com.semi.statistic.model.vo.AchieveCheck;



public class StatisticDao {	
	
	private Properties prop=new Properties();
	
	public StatisticDao() {
		String path=StatisticDao.class.getResource("/sql/statistics_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<MemberExcList> TodayMemberExcList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberExcList> list=new ArrayList();
		try {
			//결과 보기 위해서 SYSDATE를 SYSDATE-1로 두었음. SQL문 수정할 것
			pstmt=conn.prepareStatement(prop.getProperty("todayExcList"));
			pstmt.setString(1, "test1"); //아이디 대신 test1 넣었음
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberExcList m=new MemberExcList();				
				m.setSets(rs.getInt("sets"));
				m.setReps(rs.getInt("reps"));
				m.setWeight(rs.getInt("weight"));
				m.setExcId(rs.getString("exc_id"));
				list.add(m);				
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(NullPointerException e){
			e.printStackTrace();
		}finally {
		
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public List<MemberMenuList> TodayMemberMenuList(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<MemberMenuList> list=new ArrayList();
		try {
			//결과 보기 위해서 SYSDATE를 SYSDATE-1로 두었음. SQL문 수정할 것
			pstmt=conn.prepareStatement(prop.getProperty("todayMenuList"));
			pstmt.setString(1, "test1"); //아이디 대신 test1 넣었음
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberMenuList m=new MemberMenuList();				
				m.setAmount(rs.getInt("amount"));
				m.setMenuId(rs.getString("menu_id"));
				m.setMenuDaytime(rs.getString("menu_daytime"));
				list.add(m);				
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(NullPointerException e){
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public String weekMenuCheck(Connection conn, String weekCheck) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		try {
			pstmt=conn.prepareStatement(prop.getProperty("weekMenuCheck"));
			pstmt.setString(1, weekCheck);
			pstmt.setString(2, "test1");	//아이디 대신 test1 넣었음		
			rs=pstmt.executeQuery();
			while(rs.next()) {
				result=rs.getString("menu_plan_check");
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(NullPointerException e){
			e.printStackTrace();
			result="";
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
		
	}
	
	public int excAchieveCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("excAchieveCount"));
			pstmt.setString(1, "test1");	//아이디 대신 test1 넣었음			
			rs=pstmt.executeQuery();
			here:
			while(rs.next()) {	
				if(rs.getString("max(exc_plan_check)").equals("Y")){
					count++;
				}else {
					break here;
				}
			}			
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch(NullPointerException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return count;	//count를 반환
		
	}
	
	public int menuAchieveCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("menuAchieveCount"));
			pstmt.setString(1, "test1");	//아이디 대신 test1 넣었음			
			rs=pstmt.executeQuery();
			here:
			while(rs.next()) {	
				if(rs.getString("max(menu_plan_check)").equals("Y")){
					count++;
				}else {
					break here;
				}
			}			
			
		}catch(SQLException e){
			e.printStackTrace();
		}catch(NullPointerException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}		
		return count;	//count를 반환
		
	}
	
	
}
