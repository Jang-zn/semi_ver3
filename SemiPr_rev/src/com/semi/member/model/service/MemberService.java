package com.semi.member.model.service;

import static com.semi.common.JdbcTemplate.close;
import static com.semi.common.JdbcTemplate.commit;
import static com.semi.common.JdbcTemplate.getConnection;
import static com.semi.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;



import com.semi.exc.model.dao.ExcDao;

import com.semi.member.daily.model.vo.DailyExercise;
import com.semi.member.daily.model.vo.DailyMenu;
import com.semi.member.daily.model.vo.DailyMenuList;
import com.semi.member.daily.model.vo.DailyExercise;
import com.semi.member.daily.model.vo.DailyMenu;
import com.semi.member.daily.model.vo.DailyRecordCheck;

import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.menu.model.vo.Menu;
import com.semi.member.model.dao.MemberDao;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;



public class MemberService {
	private MemberDao dao= new MemberDao();
	public List<MemberExcList> SelectMemberExcList(int cPage, int numPerpage, String dayval, String memberid) {
		Connection conn = getConnection();
		List<MemberExcList> list = dao.SelectMemberExcList(conn,cPage,numPerpage,dayval,memberid);
		close(conn);		
		return list;
	}
	public int SelectMemberExcListCount(String dayval, String memberid) {
		Connection conn = getConnection();
		int result= dao.SelectMemberExcListCount(conn,dayval,memberid);
		close(conn);		
		return result;
	}
	public List<MemberMenuList> SelectMemberMenuList(int cPage2, int numPerpage2, String dayval, String time, String memberid) {
		Connection conn = getConnection();
		List<MemberMenuList> list2 = dao.SelectMemberMenuList(conn,cPage2,numPerpage2,dayval,time,memberid);
		close(conn);		
		return list2;
	}
	public int SelectMemberMenuListCount(String dayval, String memberid) {
		Connection conn = getConnection();
		int result= dao.SelectMemberMenuListCount(conn,dayval,memberid);
		close(conn);		
		return result;
	}
	public Exercise selectExceriseinfo(String excid) {
		Connection conn = getConnection();
		Exercise ex= dao.selectExceriseinfo(conn,excid);
		ex.setFileList(dao.selectExceriseimg(conn,excid));
		close(conn);		
		return ex;
		
	}
	public Menu selectMenu(String menuid) {
		Connection conn = getConnection();
		Menu m= dao.selectMenu(conn,menuid);
		m.setFileList(dao.selectMenuimg(conn,menuid));
		close(conn);		
		return m;
	
	}
	public int MemberexclistDelete(int excno) {
		Connection conn =getConnection();
		dao.excDailyDeleteno(conn,excno);
		int result =dao.MemberexclistDelete(conn,excno);
		if(result>0) commit(conn);
		else rollback(conn);		
		return result;
	}
	public int MembermenulistDelete(int menuno, String memberid) {
		Connection conn =getConnection();
		//fkdaily_e부터 먼저 삭제
		dao.menuDailyDeleteno(conn,menuno);
		int result =dao.MembermenulistDelete(conn,menuno,memberid);
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

	public List<DailyMenuList> selectDailymenulist(String dayval,String memberid, String daytime) {
		Connection conn = getConnection();
		List<DailyMenuList> list= dao.selectDailymenulist(conn,dayval,memberid,daytime);
		close(conn);		
		return list;
	}
	public int insertExcDaliylog(String[] excarr) {
		Connection conn =getConnection();
		int result=0;
		for(int i=1;i<excarr.length;i++) {
		result =dao.insertExcDaliylog(conn,excarr[i]);
		if(result>0) commit(conn);
		else rollback(conn);		
		}
		return result;
	}
	public int insertMenuDaliylog(String[] menuarr) {
		Connection conn =getConnection();
		int result=0;
		for(int i=1;i<menuarr.length;i++) {
		result =dao.insertMenuDaliylog(conn,menuarr[i]);
		if(result>0) commit(conn);
		else rollback(conn);		
		}
		return result;
	}

	////////////////////////////////////////////daliy log 
	
	
	
	public String selectSysdate(String memberid) {
		Connection conn =getConnection();
		String sysdate =dao.selectSysdate(conn,memberid);
		close(conn);
		return sysdate;
	}
	public int[] selectExcno(String excday, String memberid) {
		Connection conn =getConnection();
		int[] excno =dao.selectExcno(conn,excday,memberid);
		close(conn);
		return excno;
	}
//	public void insertDailylog(int i) {
//		Connection conn=getConnection();
//		dao.insertExcDaliylog(conn,i);
//		commit(conn);
//	}
//
//
	public List<DailyExercise> selectMemberDailyExcercise(String memberid, int i, int j) {
		Connection conn =getConnection();
		List<DailyExercise> list =dao.selectMemberDailyExcercise(conn,memberid,i,j);
		close(conn);
		return list;
	}
	public List<MemberExcList> selectExceriseinfo2(String excday, String memberid) {
		Connection conn = getConnection();
		List<MemberExcList> list = dao.selectExceriseinfo2(conn,excday,memberid);
		close(conn);		
		return list;
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
	public Member findPw(String userId, String name, String email) {
		Connection conn = getConnection();
		Member m =dao.findPw(conn,userId,name,email);
		close(conn);
		return m;
	}
	

	public List<MemberExcList> selectDailyExclist(String dayval, String memberid) {
		Connection conn = getConnection();
		List<MemberExcList> list = dao.selectDailyExclist(conn,dayval,memberid);
		close(conn);		
		return list;
	}
	public List<MemberExcList> selectMemberExcListbyno(int[] excarr) {
		Connection conn = getConnection();
		List<MemberExcList> list=new ArrayList();
		for(int i=0;i<excarr.length;i++) {
			if(excarr[i]!=0) {
				MemberExcList mel = dao.selectMemberExcListbyno(conn,excarr[i]);
				list.add(mel);
			}
		}
		close(conn);	
		return list;
		
	}
	public String selectmenuSysdate(String memberid) {
		Connection conn =getConnection();
		String sysdate =dao.selectmenuSysdate(conn,memberid);
		close(conn);
		return sysdate;
	}
	public List<DailyMenu> selectMemberDailyMenu(String memberid, int i, int j) {
		Connection conn =getConnection();
		List<DailyMenu> list =dao.selectMemberDailyMenu(conn,memberid,i,j);
		close(conn);
		return list;
	}
	public int[] selectmenuno(String menuday, String memberid, String daytime) {
		Connection conn =getConnection();
		int[] menuno =dao.selectmenuno(conn,menuday,memberid,daytime);
		close(conn);
		return menuno;
	}
	public List<DailyMenuList> selectMemberMenuListbyno(int[] menuarr) {
		Connection conn = getConnection();
		List<DailyMenuList> list = new ArrayList();
		for(int i=0;i<menuarr.length;i++) {
		if(menuarr[i]!=0) {
			DailyMenuList dml = dao.selectMemberMenuListbyno(conn,menuarr[i]);
		
		list.add(dml);
			}
		}
		close(conn);
		return list;
	}
	public int selectDailyexclistCount(String memberid) {
		Connection conn = getConnection();
		int total = dao.selectDailyexclistCount(conn,memberid);
		close(conn);	
		return total;
	}
	public int selectDailymenulistCount(String memberid) {
		Connection conn = getConnection();
		int total = dao.selectDailymenulistCount(conn,memberid);
		close(conn);	
		return total;

	}
	public int[] YNCheckAll(String excdate, String memberid) {
		int[] check = new int[2];
		Connection conn = getConnection();
		check [0] = dao.YNCheckAll(conn,excdate,memberid);
		check [1] = dao.YNCheck(conn,excdate,memberid);
		close(conn);	
		return check;
	}
	public List<DailyRecordCheck> dailyRecord(String memberid) {
		Connection conn = getConnection();
		List<DailyRecordCheck> list=dao.dailyRecord(conn,memberid);
		close(conn);	
		return list;
		
	}
	public List<DailyRecordCheck> dailyRecordmenu(String memberid) {
		Connection conn = getConnection();
		List<DailyRecordCheck> list=dao.dailyRecordmenu(conn,memberid);
		close(conn);	
		return list;
	}
	public int[] YNmenuCheckAll(String menudate, String memberid) {
		int[] check = new int[2];
		Connection conn = getConnection();
		check [0] = dao.YNmenuCheckAll(conn,menudate,memberid);
		check [1] = dao.YNmenuChseck(conn,menudate,memberid);
		close(conn);	
		return check;
	}

	public Member selectMemberinfo(String memberid) {
		Connection conn =getConnection();
		Member m =dao.selectMemberinfo(conn,memberid);
		close(conn);
		return m;
	}
	public String[] selcetGallaryimg(String memberid) {
		Connection conn =getConnection();
		String[] gal =new String[2];
		gal=dao.selcetGallaryimg(conn,memberid);
		close(conn);
		return gal;
	}
	public String[] exclist(String memberid) {
		Connection conn =getConnection();
		String[] exclist=dao.exclist(conn,memberid);
		close(conn);
		return exclist;
	}
	public String[] menulist(String memberid) {
		Connection conn =getConnection();
		String[] menulist=dao.menulist(conn,memberid);
		close(conn);
		return menulist;
	}
	
	public int SelectMemberMenuListCount(String dayval, String memberid, String time) {
		Connection conn = getConnection();
		int result= dao.SelectMemberMenuListCount(conn,dayval,memberid,time);
		close(conn);		
		return result;
	}
}
