package com.semi.member.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.member.model.service.*;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberMyexclistDeleteServlet
 */
@WebServlet("/member/myexclistdelete")
public class MemberMyexclistDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyexclistDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("어ㅏㅁ엉너멍");
		int excno = Integer.parseInt(request.getParameter("excno"));
		System.out.println(excno);

		int result =new MemberService().MemberexclistDelete(excno);
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제성공";
			loc="/member/myList";
		}else {
			msg="삭제 실패";
			loc="/member/myList";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
