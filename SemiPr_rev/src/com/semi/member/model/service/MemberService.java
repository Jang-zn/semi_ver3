package com.semi.member.model.service;

import static com.semi.common.JdbcTemplate.*;

import java.sql.*;
import java.util.*;

import com.semi.member.exc.model.vo.*;
import com.semi.member.menu.model.vo.*;
import com.semi.member.model.dao.*;
import com.semi.member.model.vo.*;

public class MemberService {
	private MemberDao dao= new MemberDao();
	public List<MemberExcList> SelectMemberExcList(int cPage, int numPerpage, String dayval) {
		Connection conn = getConnection();
		List<MemberExcList> list = dao.SelectMemberExcList(conn,cPage,numPerpage,dayval);
		close(conn);		
		return list;
	}
	public int SelectMemberExcListCount(String dayval) {
		Connection conn = getConnection();
		int result= dao.SelectMemberExcListCount(conn,dayval);
		close(conn);		
		return result;
	}
	public List<MemberMenuList> SelectMemberMenuList(int cPage2, int numPerpage2, String dayval, String time) {
		Connection conn = getConnection();
		List<MemberMenuList> list2 = dao.SelectMemberMenuList(conn,cPage2,numPerpage2,dayval,time);
		close(conn);		
		return list2;
	}
	public int SelectMemberMenuListCount(String dayval) {
		Connection conn = getConnection();
		int result= dao.SelectMemberMenuListCount(conn,dayval);
		close(conn);		
		return result;
	}
	public Exercise selectExceriseinfo(String excid) {
		Connection conn = getConnection();
		Exercise ex= dao.selectExceriseinfo(conn,excid);
		close(conn);		
		return ex;
		
	}
	public Menu selectMenu(String menuid) {
		Connection conn = getConnection();
		Menu m= dao.selectMenu(conn,menuid);
		close(conn);		
		return m;
	}

}
