package com.semi.member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.member.daily.model.vo.*;
import com.semi.member.model.service.*;
import com.semi.member.model.vo.*;

/**
 * Servlet implementation class DailyExcServlet
 */
@WebServlet("/member/dailyLog")
public class DailyLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//오늘 데일리로그 만들기 유니크 제약조건 걸어버림
	//	String admin="admin";
		//MemberExcList mel= new MemberService().selectmel(admin);
		
		int result =new MemberService().insertExcDaliylog(); 
		if(result>0) System.out.println("운동 로그 등록됨");
		else System.out.println("운동하루안지남");
		//오늘 식단 데일로 로그
		result =new MemberService().insertMenuDaliylog(); 
		if(result>0) System.out.println("메뉴 로그 등록됨");
		else System.out.println("메뉴하루안지남");
		
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);	
		String dayval = request.getParameter("val");
		if(dayval==null) {
	        Calendar calendar = Calendar.getInstance(); 
	        String []days = {"일","월","화","수","목","금","토"};
	        dayval=days[calendar.get(Calendar.DAY_OF_WEEK)-1];
		}
		String today =year+"/"+month+"/"+day+"/"+dayval;
		//회원 아이디 도 같이 보내줌 ..
		List<MemberExcList> list = new MemberService().SelectMemberExcDailyList(dayval);	
		List<MemberMenuList> list2 = new MemberService().SelectMemberMenuDailyList(dayval);
//		List<DailyExercise> list3 = new MemberService().selectMemberDailyExcerciseList();
	//	List<DailyMenu> list4 = new MemberService().selectMemberDailyMenuList();
	
	
		
		
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("today", today);
		request.getRequestDispatcher("/views/member/daily/dailyLog.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
