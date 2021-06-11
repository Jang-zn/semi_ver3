package com.semi.gallary.model.service;



import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.rollback;


import java.sql.Connection;
import java.util.List;


import com.semi.gallary.model.dao.GallaryDao;
import com.semi.gallary.model.vo.Gallary;


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
	
	public int selectGallaryCount(String memberId) {
		Connection conn=getConnection();
		int result=dao.selectGallaryCount(conn, memberId);
		close(conn);
		return result;
	}
	public List<Gallary> selectGallaryList(String memberId,int cPage, int numPerpage){
		Connection conn=getConnection();
		List<Gallary> list=dao.selectGallaryList(conn,memberId,cPage,numPerpage);
		close(conn);
		return list;
	}
	public Gallary getNoonList(int galNo) {
		Connection conn=getConnection();
		Gallary g =dao.getNoonList(conn, galNo);
		close(conn);
		return g;
		
	}
	
	public int deleteImg(int galNo) {
		Connection conn = getConnection();
		int result =dao.deleteGallary(conn,galNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	public int deleteGallary(int galNo) {
		Connection conn = getConnection();
		int result =dao.deleteGallary(conn,galNo);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	public Gallary selectGallary(int galNo) {
		Connection conn = getConnection();
		Gallary g =dao.selectGallary(conn,galNo);
		close(conn);
		return g;
	}
	
	public int updateGallary(Gallary g) {
		Connection conn= getConnection();
		int result = dao.updateGallary(conn,g);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;

	}
	public int updateImg(Gallary g) {
	Connection conn= getConnection();
	int result = dao.updateImg(conn,g);
	if(result>0) commit(conn);
	else rollback(conn);
	close(conn);
	return result;

	}
	
	public List<Gallary> selectSearchGallary(int cPage, int numPerpage,String keyword){
		Connection conn=getConnection();
		List<Gallary> list=dao.selectSearchGallary(conn,cPage,numPerpage,keyword);
		close(conn);
		return list;
		
	}
	
	public int selectSearchGallaryCount(String keyword) {
		Connection conn=getConnection();
		int result=dao.selectSearchGallaryCount(conn,keyword);
		close(conn);
		return result;
	}
	
}