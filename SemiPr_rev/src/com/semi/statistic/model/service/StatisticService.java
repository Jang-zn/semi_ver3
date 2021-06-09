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
	
	public List<MemberExcList> TodayMemberExcList(String memberId){
		Connection conn = getConnection();
		List<MemberExcList> list01 = dao.TodayMemberExcList(conn, memberId);
		close(conn);		
		return list01;
	}
	public List<MemberMenuList> TodayMemberMenuList(String memberId){
		Connection conn = getConnection();
		List<MemberMenuList> list02 = dao.TodayMemberMenuList(conn, memberId);
		close(conn);		
		return list02;
	}
	

//	//excId로 정보를 조회해오기
//	public ExcInfo excInfo(String excId){
//		Connection conn=getConnection();
//		ExcInfo excInfo = dao.excInfo(conn, excId);
//		close(conn);
//		//System.out.println(excInfo.getExcName());
//		return excInfo;
//	}
//	
//	//menuId로 정보를 조회해오기
//		public MenuInfo menuInfo(String menuId){
//			Connection conn=getConnection();
//			MenuInfo menuInfo = dao.menuInfo(conn, menuId);
//			close(conn);
//			return menuInfo;
//		}
	
	
	public String weekExcCheck(String weekCheck, String memberId) {
		Connection conn = getConnection();
		String result = dao.weekExcCheck(conn, weekCheck, memberId);
		close(conn);	
		return result;
	}
	
	public String weekMenuCheck(String weekCheck, String memberId) {
		Connection conn = getConnection();
		String result = dao.weekMenuCheck(conn, weekCheck, memberId);
		close(conn);	
		return result;
	}
	
	public int ExcAchieveCount(String memberId) {
		Connection conn = getConnection();
		int count=dao.excAchieveCount(conn, memberId);
		close(conn);
		return count;
	}
	
	public int MenuAchieveCount(String memberId) {
		Connection conn = getConnection();
		int count=dao.menuAchieveCount(conn, memberId);
		close(conn);
		return count;
	}

	
	public List<ExcInfo> ExcStatistic(String memberId){
		Connection conn = getConnection();
		List<ExcInfo> list=dao.excStatistic(conn, memberId);
		close(conn);
		return list;
	}
	public MenuInfo MenuStatistic(String memberId) {
		Connection conn = getConnection();
		MenuInfo menuStatistic=dao.menuStatistic(conn, memberId);
		close(conn);
		return menuStatistic;
	}
	

}
