package com.semi.exc.model.dao;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.rollback;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class InsertDBMListClolling {

	
	 public static void main(String[] args) {   
		    for(int i=250; i<400; i++) {
		 		newsCrawling("https://www.nongsaro.go.kr/portal/ps/psz/psza/contentSub.ps?menuId=PS00152&pageIndex=1&pageSize=10&pageUnit=12&cntntsNo=89"+Integer.toString(i)+"&dietSeCode=254002");
		      }
		    System.out.println("완료");
		   }
		   
		   public static void newsCrawling(String url) {
		      //Document에는 페이지의 모든소스가 들어감
			   Document doc=null;
		         try {
			         doc=Jsoup.connect(url).get();
			      }catch(IOException e) {
			         e.printStackTrace();
			      }
			      
			      Elements element=doc.select("div.tit_bg");
			      
			      Iterator<Element> title=element.select("div.sub_tit+div strong").iterator();
			      Iterator<Element> content=element.select("div.sub_tit+div p.w-350").iterator();
			      Iterator<Element> content2=element.select("div.sub_tit+div p.w-300").iterator();
			      Iterator<Element> i=element.select("div.sub_tit+div img").iterator();
			     
			     
			      while(title.hasNext()&&content.hasNext()&&content2.hasNext()&&i.hasNext()) {  
			        String t = title.next().text();
			        String c = content.next().text();
			        String c2 = content2.next().text();
			        String[] c3 = c2.split(",");
			        String z ="";
			        for(int j=0; j<c3.length; j++) {
			        	if(j!=c3.length) {
			        		z += c3[j].replaceAll("[^0-9]", "")+",";
			        	}else {
			        		z += c3[j].replaceAll("[^0-9]", "");
			        	}
			        }
			        String[] zz = z.split(",");
			     
			        int[] iarr = new int[zz.length];
			        for(int g=0; g<zz.length; g++) {
			        	iarr[g] = Integer.parseInt(zz[g]);
			        }
			    	String im = i.next().absUrl("src");
			        insertEList(t,iarr,c,im);
			      }
			      
		   }
		   
		   	public static void insertEList(String t,int[] iarr,String c,String im) {
		   		Connection conn = getConnection();
		   		PreparedStatement pstmt = null;
		   		PreparedStatement pstmt2 = null;
		   		int result = 0;
		   		int result2 =0;
		   		try {
		   			String sql = "insert into m_list values(CONCAT('M',SEQ_MENU_ID.NEXTVAL),'고기',?,?,?,?,?,null,?,?)";
		   			pstmt=conn.prepareStatement(sql);
		   			pstmt.setString(1, t);
		   			pstmt.setInt(2,iarr[0]);
		   			pstmt.setInt(3, iarr[1]);
		   			pstmt.setInt(4, iarr[2]);
		   			try {
		   				pstmt.setInt(5, iarr[3]);
		   			}catch(Exception e){
		   				pstmt.setInt(5, 0);
		   			}
		   			pstmt.setString(6, c);
		   			pstmt.setString(7, im);
		   			result = pstmt.executeUpdate();
		   		}catch(SQLException e) {
		   			e.printStackTrace();
		   		}
		   		if(result>0) {
		   			commit(conn);
		   			System.out.println("mlist 삽입 성공!");
		   		}else {
		   			rollback(conn);
		   			System.out.println("mlsit 삽입 실패!");
		   		}
		   		try {
		   			String sql2="INSERT INTO MENU_FILE VALUES(SEQ_IMG_M.NEXTVAL,concat('M',SEQ_MENU_ID.CURRVAL),?)";
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
		   			System.out.println("mfile 삽입 성공");
		   		}else {
		   			rollback(conn);
		   			System.out.println("mfile 삽입 실패!");
		   		}
		   	}
}

