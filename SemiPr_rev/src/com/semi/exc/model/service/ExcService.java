package com.semi.exc.model.service;

import static com.semi.common.JdbcTemplate.rollback;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.semi.exc.model.dao.ExcDao;
import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.exc.model.vo.MemberExercise;

public class ExcService {
	ExcDao dao = new ExcDao();
	
	public ExcService() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Exercise> getExcList(String sort, int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<Exercise> list = dao.getExcList(conn, sort, cPage, numPerpage);
		close(conn);		
		return list;
	}
	
	public int getExcListCount(String sort) {
		Connection conn = getConnection();
		int result = dao.getExcListCount(conn, sort);
		close(conn);		
		return result;
	}
	
	public Exercise getExcInfo(String excName) {
		Connection conn = getConnection();
		Exercise result = dao.getExcInfo(conn, excName);
		close(conn);		
		return result;
	}
	
	public int insertMemberExc(MemberExercise me) {
		Connection conn = getConnection();
		int result = dao.insertMemberExc(conn, me);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
		
	}
	
	public Map[] planCountExc(String memberId, String date, int length){
		Connection conn = getConnection();
		Map[] result = dao.planCountExc(conn, memberId, date, length);
		close(conn);		
		return result;
		
	}
	
	public Map[] planCountExcforChart(String memberId, String date, int length){
		Connection conn = getConnection();
		Map[] result = dao.planCountExcforChart(conn, memberId, date, length);
		close(conn);		
		return result;
		
	}
	
	public Map[] planStackExcTotal(String memberId, String date, int length){
		Connection conn = getConnection();
		Map[] result = dao.planStackExcTotal(conn, memberId, date, length);
		close(conn);		
		return result;
		
	}
	
	public Map[] reasonE(String memberId, String date, int length){
		Connection conn = getConnection();
		Map[] result = dao.reasonE(conn, memberId, date, length);
		close(conn);		
		return result;
		
	}
	
	public int checkDupExc(MemberExercise me) {
		Connection conn = getConnection();
		int result = dao.checkDupExc(conn, me);
		close(conn);
		return result;
	}
	
	public int updateMemberExc(MemberExercise me) {
		Connection conn = getConnection();
		int result = dao.updateMemberExc(conn, me);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	public List<MemberExercise> getWlist(String memberId, String date){
		Connection conn = getConnection();
		List<MemberExercise> wlist = dao.getWlist(conn, memberId, date);
		close(conn);		
		return wlist;
	}
	
	public int getPlanCheck(String memberId, String date) {
		Connection conn = getConnection();
		int result = dao.getPlanCheck(conn, memberId, date);
		close(conn);
		return result;
	}
	
	public int setMonthlyPlan(List<MemberExercise> wlist, String date) {
		Connection conn = getConnection();
		int result = dao.setMonthlyPlan(conn, wlist, date);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	public int todayCheck(String memberId) {
		Connection conn = getConnection();
		int result = dao.todayCheck(conn, memberId);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	public int autoN(String memberId) {
		Connection conn = getConnection();
		int result = dao.autoN(conn, memberId);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
	
	public int reasonUpdate(String memberId, String date, int reason) {
		Connection conn = getConnection();
		int result = dao.reasonUpdate(conn, memberId, date, reason);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
		
	}
	
	public int updateMonthlyPlan(String memberId, List<MemberExercise> wlist, String date) {
		Connection conn = getConnection();
		int dResult = dao.deletePlan(conn, memberId, date.split(",")[0]);
		int result = dao.setMonthlyPlan(conn, wlist, date);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
	}
}
