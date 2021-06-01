package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.*;
import com.semi.member.model.vo.*;

/**
 * Servlet implementation class MembermenuUpdateEndServlet
 */
@WebServlet("/member/mymenulistupdateEnd")
public class MembermenuUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MembermenuUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberMenuList mml = new MemberMenuList();
		request.setCharacterEncoding("utf-8");
		mml.setMenuNo(Integer.parseInt(request.getParameter("no")));
		mml.setAmount(Integer.parseInt(request.getParameter("amount")));
		mml.setMenuDaytime(request.getParameter("daytime"));
		mml.setMenuWeek(request.getParameter("week"));
	
		int result = new MemberService().updateMenu(mml);
		String msg="";
		
		if(result>0) {
			msg="수정 성공";
		
		}else {
			msg="수정 실패";
		
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/views/common/openmsg.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
