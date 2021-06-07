package com.semi.exc.model.dao;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.rollback;
import static com.semi.common.JdbcTemplate.commit;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class InsertDBEListClolling {

		   
	   public static void main(String[] args) {   
	    for(int i=100; i<200; i++) {
		   newsCrawling("https://100.daum.net/encyclopedia/view/191XXXXXXX"+Integer.toString(i));
	      }
	   }
	   
	   public static void newsCrawling(String url) {
	      //Document에는 페이지의 모든소스가 들어감
		   Document doc=null;
	         try {
		         doc=Jsoup.connect(url).get();
		      }catch(IOException e) {
		         e.printStackTrace();
		      }
		      
		      Elements element=doc.select("div#daumContent");
		      
		      Iterator<Element> title=element.select("h3.tit_desc").iterator();
		      Iterator<Element> content=element.select("p.desc_section").iterator();
		      Iterator<Element> a=element.select("iframe").iterator();
		      Iterator<Element> i=element.select("img").iterator();
		      while(content.hasNext()&&a.hasNext()&&title.hasNext()&&i.hasNext()) {  
		        String t = title.next().text();
		         String c = content.next().text();
		         String h = a.next().absUrl("src");
		         String im = i.next().absUrl("src");
		         insertEList(t,h,c,im);
	      }
	   }
	   
	   	public static void insertEList(String t,String h,String c,String im) {
	   		Connection conn = getConnection();
	   		PreparedStatement pstmt = null;
	   		PreparedStatement pstmt2 = null;
	   		int result = 0;
	   		int result2 =0;
	   		try {
	   			String sql = "insert into e_list values(concat('E',SEQ_EXC_ID.NEXTVAL),'상체',?,?,?)";
	   			pstmt=conn.prepareStatement(sql);
	   			pstmt.setString(1, t);
	   			pstmt.setString(2, c);
	   			pstmt.setString(3, h);
	   			result = pstmt.executeUpdate();
	   		}catch(SQLException e) {
	   			e.printStackTrace();
	   		}
	   		if(result>0) {
	   			commit(conn);
	   			System.out.println("elist 삽입 성공!");
	   		}else {
	   			rollback(conn);
	   			System.out.println("elsit 삽입 실패!");
	   		}
	   		try {
	   			String sql2="INSERT INTO E_FILE VALUES(SEQ_IMG_E.NEXTVAL,concat('E',SEQ_EXC_ID.CURRVAL),?)";
	   			pstmt2=conn.prepareStatement(sql2);
	   			pstmt2.setString(1, im);
	   			result2 = pstmt2.executeUpdate();
	   		}catch(SQLException e) {
	   			e.printStackTrace();
	   		}finally {
	   			close(pstmt);
	   		}
	   		if(result2>0) {
	   			commit(conn);
	   			System.out.println("efile 삽입 성공");
	   		}else {
	   			rollback(conn);
	   			System.out.println("efile 삽입 실패!");
	   		}
	   	}
	   	
	   	  
	   
	   
	   
	   
   }
