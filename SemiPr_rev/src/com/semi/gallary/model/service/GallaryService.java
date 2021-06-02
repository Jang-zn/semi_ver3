package com.semi.gallary.model.service;


import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.rollback;

import java.sql.*;

import com.semi.gallary.model.dao.*;
import com.semi.gallary.model.vo.*;

public class GallaryService {
	
	private GallaryDao dao = new GallaryDao();
	
	public int insertGallary(Gallary g) {
		Connection conn=getConnection();
		int result = dao.insertGallary(conn,g);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;		
	}
	public int insertGFile(String file) {
		Connection conn = getConnection();
		int result = dao.insertGFile(conn,file);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;	
	}
	
}
