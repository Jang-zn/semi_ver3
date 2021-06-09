package com.semi.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.member.daily.model.vo.DailyRecordCheck;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class DailyExcRecordAjaxServlet
 */
@WebServlet("/ajax/dailyrecord")
public class DailyExcRecordAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyExcRecordAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		String memberid=m.getMemberId();
	
		List<DailyRecordCheck> list=new MemberService().dailyRecord(memberid);
		int exccheck=0;
		int menucheck=0;
		for(DailyRecordCheck drc:list) {			
			if(drc.getExcYN().equals("N")) {
				break;
			}
			++exccheck;
		}
		
		
		List<DailyRecordCheck> list2=new MemberService().dailyRecordmenu(memberid);
		for(DailyRecordCheck drc:list2) {			
			if(drc.getMenuYN().equals("N")) {
				break;
			}
			++menucheck;
		}
		int[] checkarr=new int[2];
		checkarr[0]=exccheck;
		checkarr[1]=menucheck;
		
		
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(checkarr,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
