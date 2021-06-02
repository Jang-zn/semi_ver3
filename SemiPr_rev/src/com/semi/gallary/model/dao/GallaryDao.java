package com.semi.gallary.model.dao;

import static com.semi.common.JdbcTemplate.*;

import java.io.*;
import java.sql.*;
import java.util.*;

import com.semi.gallary.model.vo.*;

public class GallaryDao {
	
	private Properties prop = new Properties();
	
	public GallaryDao() {
		String path=GallaryDao.class.getResource("/sql/gallary_sql.properties").getPath();
		try {
			prop.load(new FileReader(path));			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertGallary(Connection conn, Gallary g) {
		PreparedStatement pstmt=null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertGallary"));
			pstmt.setString(1,"TEST04");
			pstmt.setString(2,"TEST04");
			pstmt.setString(3,g.getContent());
			result = pstmt.executeUpdate();
		}catch(SQLException e ) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertGFile(Connection conn, String file) {
		PreparedStatement pstmt=null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("insertGfile"));
			pstmt.setString(1, file);
			result=pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);		
		}
		return result;				
	}
	
	

}
