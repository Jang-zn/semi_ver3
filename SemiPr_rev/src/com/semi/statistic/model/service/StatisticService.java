package com.semi.statistic.model.service;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;
import com.semi.statistic.model.dao.StatisticDao;
import com.semi.statistic.model.vo.ExcInfo;
import com.semi.statistic.model.vo.MenuInfo;

public class StatisticService {
	private StatisticDao dao= new StatisticDao();
	
	public List<MemberExcList> TodayMemberExcList(){
		Connection conn = getConnection();
		List<MemberExcList> list01 = dao.TodayMemberExcList(conn);
		close(conn);		
		return list01;
	}
	public List<MemberMenuList> TodayMemberMenuList(){
		Connection conn = getConnection();
		List<MemberMenuList> list02 = dao.TodayMemberMenuList(conn);
		close(conn);		
		return list02;
	}
	
	//excId로 정보를 조회해오기
	public ExcInfo excInfo(String excId){
		Connection conn=getConnection();
		ExcInfo excInfo = dao.excInfo(conn, excId);
		close(conn);
		//System.out.println(excInfo.getExcName());
		return excInfo;
	}
	
	//menuId로 정보를 조회해오기
		public MenuInfo menuInfo(String menuId){
			Connection conn=getConnection();
			MenuInfo menuInfo = dao.menuInfo(conn, menuId);
			close(conn);
			return menuInfo;
		}
	
	
	public String weekExcCheck(String weekCheck) {
		Connection conn = getConnection();
		String result = dao.weekExcCheck(conn, weekCheck);
		close(conn);	
		return result;
	}
	
	public String weekMenuCheck(String weekCheck) {
		Connection conn = getConnection();
		String result = dao.weekMenuCheck(conn, weekCheck);
		close(conn);	
		return result;
	}
	
	public int ExcAchieveCount() {
		Connection conn = getConnection();
		int count=dao.excAchieveCount(conn);
		close(conn);
		return count;
	}
	
	public int MenuAchieveCount() {
		Connection conn = getConnection();
		int count=dao.menuAchieveCount(conn);
		close(conn);
		return count;
	}

}
