package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class PasswordEmailAuthServlet
 */
@WebServlet("/member/passwordEmailAuth")
public class PasswordEmailAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PasswordEmailAuthServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailAuth = request.getParameter("emailAuth");
		String email = request.getParameter("email");
		String name = request.getParameter("name");
		String userId = request.getParameter("id");
		System.out.println(userId);
		HttpSession session = request.getSession();
		String authNum = (String)session.getAttribute("AuthenticationKey");
		String msg = "";
		Member m = new MemberService().findPw(userId,name,email);
		System.out.println(emailAuth);
		System.out.println(authNum);
		if(emailAuth.equals(authNum)) {
			msg="success";
			session.removeAttribute("AuthenticationKey");
			session.setAttribute("m", m);
			
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
