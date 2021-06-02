package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;

/**
 * Servlet implementation class EmailDuplication
 */
@WebServlet("/member/emailDuplication")
public class EmailDuplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailDuplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	String email = request.getParameter("email");
	
	
	
	int result = new MemberService().emailDuplication(email);
	System.out.println(result);
	String msg="";
	if(result>0) {
			//중복
			msg="이미 등록된 이메일입니다.";
			
		}else {
			//노중복 & null
			msg="사용 가능한 이메일입니다.";
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
