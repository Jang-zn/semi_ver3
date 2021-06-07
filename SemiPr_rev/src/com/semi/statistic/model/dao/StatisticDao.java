package com.semi.statistic.model.dao;

import static com.semi.common.JdbcTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;
import com.semi.statistic.model.service.StatisticService;
import com.semi.statistic.model.vo.ExcInfo;
import com.semi.statistic.model.vo.MenuInfo;



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
				m.setExcId_c(rs.getString("exc_name"));			
				m.setSets(rs.getInt("sets"));
				m.setReps(rs.getInt("reps"));
				m.setWeight(rs.getInt("weight"));
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
			//결과 보기 위해서 SYSDATE를 SYSDATE-n로 두었음. SQL문 수정할 것
			pstmt=conn.prepareStatement(prop.getProperty("todayMenuList"));
			pstmt.setString(1, "test1"); //아이디 대신 test1 넣었음
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberMenuList m=new MemberMenuList();		
				m.setMenuId_c(rs.getString("menu_name"));
				m.setAmount(rs.getInt("amount"));
				m.setMenuId(rs.getString("menu_id"));
				m.setMenuDaytime(rs.getString("menu_daytime"));
				
//				//menuId_c를 menuName으로 대치시킴 String menuName=new
//				 StatisticService().menuInfo(rs.getString("menu_id")).getMenuName();
//				 m.setMenuId_c(menuName);
//				 
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
	
//	//excId로 정보 조회해오기
//	public ExcInfo excInfo(Connection conn, String excId){
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//
//		ExcInfo eInfo=new ExcInfo();	
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("excInfo"));
//			pstmt.setString(1, excId); 
//			rs=pstmt.executeQuery();
//			while(rs.next()) {		
//				eInfo.setExcName(rs.getString("exc_name"));
//			}
//					
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}catch(NullPointerException e){
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return eInfo;
//	}
//	
//	//menuId로 정보 조회해오기
//	public MenuInfo menuInfo(Connection conn, String menuId){
//		PreparedStatement pstmt=null;
//		ResultSet rs=null;
//
//		MenuInfo mInfo=new MenuInfo();	
//		try {
//			pstmt=conn.prepareStatement(prop.getProperty("menuInfo"));
//			pstmt.setString(1, menuId); 
//			rs=pstmt.executeQuery();
//			while(rs.next()) {		
//				mInfo.setMenuName(rs.getString("menu_name"));
//			}
//					
//		}catch(SQLException e) {
//			e.printStackTrace();
//		}catch(NullPointerException e){
//			e.printStackTrace();
//		}finally {
//			close(rs);
//			close(pstmt);
//		}return mInfo;
//	}
	
	public String weekExcCheck(Connection conn, String weekCheck) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		
		Calendar today=Calendar.getInstance();
		int su=today.get(Calendar.DAY_OF_WEEK)-1;
		int weekNum=0;
		switch(weekCheck){
			case "월": weekNum=1; break;
			case "화": weekNum=2; break;
			case "수": weekNum=3; break;
			case "목": weekNum=4; break;
			case "금": weekNum=5; break;
			case "토": weekNum=6; break;
			case "일": weekNum=7; break;
		}
		
		try {
			
			if(weekNum==su) { //오늘날짜 조회시
				pstmt=conn.prepareStatement(prop.getProperty("todayExcCheck"));
				pstmt.setString(1, "test1"); //아이디 대신 test1 넣었음		
				rs=pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getString("max(exc_plan_check)")==null) {
						result="0";
					}else {
						result=rs.getString("max(exc_plan_check)");							
					}
				}
				
			}else {
				pstmt=conn.prepareStatement(prop.getProperty("weekExcCheck"));
				pstmt.setString(1, weekCheck);
				pstmt.setString(2, "test1");	//아이디 대신 test1 넣었음		
				rs=pstmt.executeQuery();
				while(rs.next()) {
					result=rs.getString("exc_plan_check");
				}
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
		
	public String weekMenuCheck(Connection conn, String weekCheck) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String result="";
		
		Calendar today=Calendar.getInstance();
		int su=today.get(Calendar.DAY_OF_WEEK)-1;
		int weekNum=0;
		switch(weekCheck){
			case "월": weekNum=1; break;
			case "화": weekNum=2; break;
			case "수": weekNum=3; break;
			case "목": weekNum=4; break;
			case "금": weekNum=5; break;
			case "토": weekNum=6; break;
			case "일": weekNum=7; break;
		}
		try {
			
			if(weekNum==su) { //오늘날짜 조회시
				pstmt=conn.prepareStatement(prop.getProperty("todayMenuCheck"));
				pstmt.setString(1, "test1"); //아이디 대신 test1 넣었음		
				rs=pstmt.executeQuery();
				while(rs.next()) {
					if(rs.getString("max(menu_plan_check)")==null) {
						result="0";
					}else {
						result=rs.getString("max(menu_plan_check)");							
					}
				}
				
			}else {
				pstmt=conn.prepareStatement(prop.getProperty("weekMenuCheck"));
				pstmt.setString(1, weekCheck);
				pstmt.setString(2, "test1");	//아이디 대신 test1 넣었음		
				rs=pstmt.executeQuery();
				while(rs.next()) {
					result=rs.getString("menu_plan_check");
				}
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
	
	
	//주간 식단 %
	public MenuInfo menuStatistic(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		MenuInfo menuStatistic=new MenuInfo(); //return할 형태
		int ch=0;
		int prot=0;
		int fat=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("weeklyMenu")); //1주일간 영양 합계를 받아올거임
			pstmt.setString(1, "test1");	//아이디 대신 test1 넣었음			
			rs=pstmt.executeQuery();
			while(rs.next()) {	
				ch=rs.getInt("sum(ch)");
				prot=rs.getInt("sum(prot)");
				fat=rs.getInt("sum(fat)");
				
				menuStatistic.setCh(ch);
				menuStatistic.setProt(prot);
				menuStatistic.setFat(fat);				
			}	
			
		}catch(SQLException e) {
			e.printStackTrace();
		}catch(NullPointerException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}

		return menuStatistic;
	}
}
