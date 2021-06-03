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
				DailyMenu dm=new DailyMenu();				
				dm.setMenuPlanCheck(rs.getString("menuPlanCheck"));
				result=dm.getMenuPlanCheck();
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
		//List<AchieveCheck> list=new ArrayList();
		int count=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("excAchieveCount"));
			pstmt.setString(1, "test1");	//아이디 대신 test1 넣었음	
			//해당 회원의 운동일지 Y/N을 시간순으로 받아옴
			
			rs=pstmt.executeQuery();

			AchieveCheck ac=new AchieveCheck();

			here:
			while(rs.next()) {				
				ac.setAchieveDate(rs.getDate("exc_date"));//날짜
				ac.setAchieveCheck(rs.getString("exc_plan_check")); //달성여부
				
				//list.add(ac);	//날짜, 달성 여부를 list로 저장	
//				System.out.println(ac.getAchieveDate()+" : "+ac.getAchieveCheck()); //데이터 확인용
				
				//하루에 AchieveCheck 결과가 하나만 있다고 가정함.
				//현재 DB에는 각 운동에 대한 AchieveCheck이 다르게 설정되어 있음.
				//이 부분에 대한 확인 필요
				
				if(ac.getAchieveCheck().equals("Y")) {//받아온 결과가 Y이면 연속 일자에 포함
					count++;
				}else {//null 또는 N이면 count 중단
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
			//해당 회원의 운동일지 Y/N을 시간순으로 받아옴
			
			rs=pstmt.executeQuery();

			AchieveCheck ac=new AchieveCheck();

			here:
			while(rs.next()) {				
				ac.setAchieveDate(rs.getDate("menu_date"));//날짜
				ac.setAchieveCheck(rs.getString("menu_plan_check")); //달성여부			
				//하루에 AchieveCheck 결과가 하나만 있다고 가정함.
				//현재 DB에는 각 운동에 대한 AchieveCheck이 다르게 설정되어 있음.
				//이 부분에 대한 확인 필요
				
				if(ac.getAchieveCheck().equals("Y")) {//받아온 결과가 Y이면 연속 일자에 포함
					count++;
				}else {//null 또는 N이면 count 중단
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
