package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.*;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberMymenulistDeleteServlet
 */
@WebServlet("/member/mymenulistdelete")
public class MemberMymenulistDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMymenulistDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int menuno = Integer.parseInt(request.getParameter("menuno"));
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		String memberid=m.getMemberId();
		int result =new MemberService().MembermenulistDelete(menuno,memberid);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="삭제 성공";
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
