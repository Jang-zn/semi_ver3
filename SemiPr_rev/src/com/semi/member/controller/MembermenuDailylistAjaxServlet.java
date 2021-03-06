package com.semi.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.member.daily.model.vo.DailyMenuList;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;

/**
 * Servlet implementation class MembermenuDailylistAjaxServlet
 */
@WebServlet("/ajax/menudailylist")
public class MembermenuDailylistAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MembermenuDailylistAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String menuday=request.getParameter("menuday");
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");	
		String memberid=m.getMemberId();
		String daytime="아침";
		int[] menuarr =new MemberService().selectmenuno(menuday,memberid,daytime);
		List<DailyMenuList> list=new MemberService().selectMemberMenuListbyno(menuarr); 
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
