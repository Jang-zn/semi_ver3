package com.semi.member.model.service;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;


import com.semi.exc.model.dao.ExcDao;

import com.semi.member.daily.model.vo.DailyExercise;
import com.semi.member.daily.model.vo.DailyMenu;
import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.menu.model.vo.Menu;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;



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
		Exercise ex= new ExcDao().getExcInfo(conn,excid);

		close(conn);		
		return ex;
		
	}
	public Menu selectMenu(String menuid) {
		Connection conn = getConnection();
		Menu m= dao.selectMenu(conn,menuid);
		m.setImgpath(dao.selectMenuimg(conn,menuid));
		close(conn);		
		return m;
	}
	public int MemberexclistDelete(int excno) {
		Connection conn =getConnection();
		int result =dao.MemberexclistDelete(conn,excno);
		if(result>0) commit(conn);
		else rollback(conn);		
		return result;
	}
	public int MembermenulistDelete(int menuno) {
		Connection conn =getConnection();
		int result =dao.MembermenulistDelete(conn,menuno);
		if(result>0) commit(conn);
		else rollback(conn);		
		return result;
	}
	public MemberExcList selectExercisebyno(int no) {
		Connection conn = getConnection();
		MemberExcList mel= dao.selectExercisebyno(conn,no);
		close(conn);		
		return mel;
	}
	public int updateExcrcise(MemberExcList mel) {
		Connection conn =getConnection();
		int result =dao.updateExcrcise(conn,mel);
		if(result>0) commit(conn);
		else rollback(conn);		
		return result;
	}
	public MemberMenuList selectMenubyno(int no) {
		Connection conn = getConnection();
		MemberMenuList mml= dao.selectMenubyno(conn,no);
		close(conn);		
		return mml;
	}
	public int updateMenu(MemberMenuList mml) {
		Connection conn =getConnection();
		int result =dao.updateMenu(conn,mml);
		if(result>0) commit(conn);
		else rollback(conn);		
		return result;
	}
	public List<MemberExcList> SelectMemberExcDailyList(String dayval) {
		Connection conn = getConnection();
		List<MemberExcList> list= dao.SelectMemberExcDailyList(conn,dayval);
		close(conn);		
		return list;
	}
	public List<MemberMenuList> SelectMemberMenuDailyList(String dayval) {
		Connection conn = getConnection();
		List<MemberMenuList> list= dao.SelectMemberMenuDailyList(conn,dayval);
		close(conn);		
		return list;
	}
	public int insertExcDaliylog() {
		Connection conn =getConnection();
		int result =dao.insertExcDaliylog(conn);
		if(result>0) commit(conn);
		else rollback(conn);		
		return result;
	}
	public int insertMenuDaliylog() {
		Connection conn =getConnection();
		int result =dao.insertMenuDaliylog(conn);
		if(result>0) commit(conn);
		else rollback(conn);		
		return result;
	}
	public List<DailyExercise> selectMemberDailyExcercise() {
		Connection conn =getConnection();
		List<DailyExercise> list =dao.selectMemberDailyExcercise();
		close(conn);
		return list;
	}
	public List<DailyMenu> selectMemberDailyMenu() {
		Connection conn =getConnection();
		List<DailyMenu> list =dao.selectMemberDailyMenu();
		close(conn);
		return list;
	}
	public MemberExcList selectmel(String admin) {
		Connection conn =getConnection();
		MemberExcList mel =dao.selectmel(conn,admin);
		close(conn);
		return mel;
	}



	public int insertMember(Member m) {
		Connection conn = getConnection();
		int result = dao.insertMember(conn, m);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	public Member login(String userId, String password) {
		Connection conn = getConnection();
		Member m = dao.login(conn, userId,password);
		close(conn);
		return m;
	}
	public int emailDuplication(String email) {
		Connection conn = getConnection();
		int result = dao.emailDuplication(conn,email);
		close(conn);
		return result;
	}
	public int userIdDuplication(String userId) {
		Connection conn = getConnection();
		int result = dao.userIdDuplication(conn,userId);
		close(conn);
		return result;
	}
	public int nickNameDuplication(String nickName) {
		Connection conn = getConnection();
		int result = dao.nickNameDuplication(conn, nickName);
		close(conn);
		return result;
	}
	public Member findId(String name, String email) {
		Connection conn = getConnection();
		Member m = dao.findId(conn, name, email);
		close(conn);
		return m;
		
	}
	

	
	
}
