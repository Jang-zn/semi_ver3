package com.semi.member.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.common.*;
import com.oreilly.servlet.*;
import com.semi.member.model.vo.*;

/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/memberSignup")
public class MemberSignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberSignUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String userId=request.getParameter("userId");
//		String password = request.getParameter("password");
//		String email =request.getParameter("email");
//		String name = request.getParameter("name");
//		String nickName = request.getParameter("nickName");
//		String yy =request.getParameter("yy");
//		String mm =request.getParameter("mm");
//		String dd = request.getParameter("dd");
//		String gender = request.getParameter("gender");
//		String phone = request.getParameter("phone");
//		double height = Double.parseDouble(request.getParameter("height"));
//		double weight = Double.parseDouble(request.getParameter("weight"));
		
//		String path=getServletContext().getRealPath("/upload/board/");
//		MultipartRequest mr=new MultipartRequest(request, path,
//				1024*1024*200,"utf-8",new MyRenameFile());
		Member m = new Member();
		m.setMemberId(request.getParameter("userId"));
		m.setMemberPw(request.getParameter("password"));
		m.setEmail(request.getParameter("email"));
		m.setName(request.getParameter("name"));
		m.setNickname(request.getParameter("nickName"));
	
		m.setMemberId(request.getParameter("gender"));
		m.setMemberId(request.getParameter("userId"));
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
