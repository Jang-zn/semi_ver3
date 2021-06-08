package com.semi.member.controller;

import java.io.*;
import java.text.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.google.gson.*;
import com.semi.member.model.service.*;
import com.semi.member.model.vo.*;

/**
 * Servlet implementation class MemberexcDailylistAjaxServlet
 */
@WebServlet("/ajax/excdailylist")
public class MemberexcDailylistAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberexcDailylistAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String excday=request.getParameter("excday");
		System.out.println(excday);	
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");	
		String memberid=m.getMemberId();
		int[] excarr =new MemberService().selectExcno(excday,memberid);
		List<MemberExcList> list=new MemberService().selectMemberExcListbyno(excarr); 
		
		
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
