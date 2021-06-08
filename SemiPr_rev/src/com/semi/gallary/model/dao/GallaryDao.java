package com.semi.gallary.model.dao;


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


import com.semi.gallary.model.vo.Gallary;



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
	public int selectGallaryCount(Connection conn){
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectGallaryCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return result;
	
	}
	public List<Gallary> selectGallaryList(Connection conn, int cPage, int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Gallary> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectGallaryList"));
			pstmt.setInt(1, (cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Gallary g=new Gallary();
				g.setGalNo(rs.getInt("gal_no"));
				g.setGallaryDate(rs.getDate("gallary_date"));
				g.setMemberId(rs.getString("member_id"));
				g.setWriter(rs.getString("writer"));
				g.setContent(rs.getString("content"));
				g.setShareCheck(rs.getString("share_check"));
				g.setImgName(rs.getString("img_name"));
				list.add(g);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
}
	
	
	public Gallary getNoonList(Connection conn, int galNo) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Gallary g =null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("getNoonList"));
			pstmt.setInt(1, galNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				g=new Gallary();
				g.setGalNo(rs.getInt("gal_no"));
				g.setContent(rs.getString("content"));
				g.setImgName(rs.getString("img_name"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return g;
	}
	
	
	public int deleteImg(Connection conn, int galNo) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt =conn.prepareStatement(prop.getProperty("deleteImg"));
			pstmt.setInt(1, galNo);
			result=pstmt.executeUpdate();
	}catch(SQLException e) {
		e.printStackTrace();
		
	}finally {
		close(pstmt);
	}
	return result;
	}

	
	public int deleteGallary(Connection conn, int galNo) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt =conn.prepareStatement(prop.getProperty("deleteGallary"));
				pstmt.setInt(1, galNo);
				result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public Gallary selectGallary(Connection conn, int galNo) {
			PreparedStatement pstmt=null;
			ResultSet rs =null;
			Gallary g = null;			
			try {
				pstmt=conn.prepareStatement(prop.getProperty("selectGallary"));
				pstmt.setInt(1,galNo);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					g=new Gallary();
					g.setGalNo(rs.getInt("gal_no"));
					g.setGallaryDate(rs.getDate("gallary_date"));
					g.setMemberId(rs.getString("member_id"));
					g.setWriter(rs.getString("writer"));
					g.setContent(rs.getString("content"));
					g.setShareCheck(rs.getString("share_check"));
					g.setImgName(rs.getString("img_name"));
					
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}return g;
		
	}
	public int updateGallary(Connection conn, Gallary g) {
		PreparedStatement pstmt=null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateGallary"));
			System.out.println("dao : "+g.getContent());
			System.out.println("galno : "+g.getGalNo());
			pstmt.setString(1, g.getContent());
			pstmt.setInt(2, g.getGalNo());
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	public int updateImg(Connection conn, Gallary g) {
		PreparedStatement pstmt=null;
		int result =0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("updateImg"));
			pstmt.setString(1, g.getImgName());
			pstmt.setInt(2, g.getGalNo());
			result=pstmt.executeUpdate();			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	


}

