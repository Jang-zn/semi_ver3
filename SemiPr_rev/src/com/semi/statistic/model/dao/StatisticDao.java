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

import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;



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
			pstmt=conn.prepareStatement(prop.getProperty("todayExcList"));
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
			pstmt=conn.prepareStatement(prop.getProperty("todayMenuList"));
			rs=pstmt.executeQuery();
			while(rs.next()) {
				MemberMenuList m=new MemberMenuList();				
				m.setAmount(rs.getInt("amount"));
				m.setMenuId(rs.getString("menuId"));
				m.setMenuDaytime(rs.getString("menuDaytime"));
				list.add(m);				
			}
					
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
}
