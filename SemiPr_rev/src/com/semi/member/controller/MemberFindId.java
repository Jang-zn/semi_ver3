package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindId
 */
@WebServlet("/member/findId")
public class MemberFindId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindId() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("forgot_name");
		String email = request.getParameter("forgot_email");
		
		Member m  = new MemberService().findId(name,email);
		String msg="";
		String loc="";
		if(m!=null) {
			request.setAttribute("id", m);
			loc="/views/member/findId.jsp";
			RequestDispatcher rd = request.getRequestDispatcher(loc);
			rd.forward(request, response);
		}else {
			 msg="입력한 정보와 일치하는 아이디가 존재하지 않습니다.";
			 loc="/views/member/findId.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			
			RequestDispatcher rd = request.getRequestDispatcher(loc);
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
