package com.semi.statistic.model.service;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.rollback;

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
	public int excUpdate(String memberId) {
		Connection conn = getConnection();
		int result=dao.excUpdate(conn, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public int menuUpdate(String memberId) {
		Connection conn = getConnection();
		int result=dao.menuUpdate(conn, memberId);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
}
