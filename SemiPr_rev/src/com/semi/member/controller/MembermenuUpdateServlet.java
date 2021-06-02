package com.semi.member.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.member.model.service.*;
import com.semi.member.model.vo.*;

/**
 * Servlet implementation class MembermenuUpdateServlet
 */
@WebServlet("/member/mymenulistupdate")
public class MembermenuUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MembermenuUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int no=Integer.parseInt(request.getParameter("no"));
		System.out.println(no);
		String menuid=request.getParameter("menuid");
		
		MemberMenuList mml = new MemberService().selectMenubyno(no);
		request.setAttribute("menu", mml);
		
		request.getRequestDispatcher("/views/member/plan/membermenuMylistUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
