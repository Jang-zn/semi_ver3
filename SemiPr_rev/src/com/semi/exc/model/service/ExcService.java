package com.semi.exc.model.service;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.semi.exc.model.dao.ExcDao;
import com.semi.member.exc.model.vo.Exercise;

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
	
	
	
	
}
