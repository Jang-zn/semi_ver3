package com.semi.member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.member.daily.model.vo.*;
import com.semi.member.model.service.*;

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
		String sysdate =new MemberService().selectSysdate();		
		int[] excno = new MemberService().selectExcno();
		System.out.println(excno[1]);
		System.out.println(Arrays.toString(excno));
		if(sysdate==null||sysdate.equals("")) {
			for(int i=0;i<excno.length;i++) {
				if(excno[i]!=0) {new MemberService().insertDailylog(excno[i]);}
			}
			
		}
		System.out.println("오지?");
		List<DailyExercise> list = new MemberService().selectMemberDailyExcercise();
		System.out.println("오지?");
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/member/daily/new_dailyLog.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
