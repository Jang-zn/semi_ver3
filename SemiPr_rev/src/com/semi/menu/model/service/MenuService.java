package com.semi.menu.model.service;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.semi.exc.model.dao.ExcDao;
import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.menu.model.vo.MemberMenu;
import com.semi.member.menu.model.vo.Menu;
import com.semi.menu.model.dao.MenuDao;

public class MenuService {
	MenuDao dao = new MenuDao();
	
	public MenuService() {
		// TODO Auto-generated constructor stub
	}
	
	public List<Menu> getMenuList(String sort, int cPage, int numPerpage) {
		Connection conn = getConnection();
		List<Menu> list = dao.getMenuList(conn, sort, cPage, numPerpage);
		close(conn);		
		return list;
	}
	public int getMenuListCount(String sort) {
		Connection conn = getConnection();
		int result = dao.getMenuListCount(conn, sort);
		close(conn);		
		return result;
	}
	public Menu getMenuInfo(String menuName) {
		Connection conn = getConnection();
		Menu result = dao.getMenuInfo(conn, menuName);
		close(conn);		
		return result;
	}
	public int insertMemberMenu(MemberMenu me) {
		Connection conn = getConnection();
		int result = dao.insertMemberMenu(conn, me);
		if(result!=0) {
			commit(conn);
			close(conn);
		}else {
			rollback(conn);
			close(conn);
		}
		return result;
		
	}
	public Map[] planCountMenu(String memberId, String date, int length){
		Connection conn = getConnection();
		Map[] result = dao.planCountMenu(conn, memberId, date, length);
		close(conn);		
		return result;
		
	}
	
	
}
