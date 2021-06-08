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
 * Servlet implementation class MemberFindPwEndServlet
 */
@WebServlet("/member/findPwEnd")
public class MemberFindPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		EmailAuthentication emailAuth = new EmailAuthentication();
		String authNum=emailAuth.connectEmail(email);
		String name = request.getParameter("name");
		String userId = request.getParameter("id");
		System.out.println("야이거나오냐");
		System.out.println(userId);
		System.out.println(name);
		System.out.println(email);
		System.out.println(authNum);
		Member m  = new MemberService().findPw(userId,name,email);
		String msg="";
		String msg2="";
		if(m!=null) {
			msg="success";
			request.setAttribute("msg2", authNum);
			request.setAttribute("Pw", m);
		}else {
			 msg="fail";
			 
		
			
			
		}
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(msg);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
