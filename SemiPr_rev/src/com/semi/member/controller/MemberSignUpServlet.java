package com.semi.member.controller;

import java.io.*;
import java.text.*;

import java.sql.Date;


import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.member.model.service.*;
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
		String memberAgeyy=request.getParameter("yy");
		String memberAgemm=request.getParameter("mm");
		String memberAgedd=request.getParameter("dd");
		
		
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy/mm/dd");
		java.util.Date memberAge=null;
		try {
			memberAge=sdf.parse(memberAgeyy+"/"+memberAgemm+"/"+memberAgedd);
			
		}catch(ParseException e) {
			e.printStackTrace();
		}
		Member m = new Member();
		m.setMemberId(request.getParameter("userId"));
		m.setMemberPw(request.getParameter("password"));
		m.setEmail(request.getParameter("email"));
		m.setName(request.getParameter("name"));
		m.setNickname(request.getParameter("nickName"));
		m.setBirth(memberAge);
		m.setGender(request.getParameter("gender"));
		m.setPhone(request.getParameter("phone"));
		m.setHeight(Double.parseDouble(request.getParameter("height")));
		m.setWeight(Double.parseDouble(request.getParameter("height")));
		int result = new MemberService().insertMember(m);
		
		String msg="";
		String loc="";
		if(result>0) {
			msg="회원가입을 성공했습니다.";
			loc="/views/member/memberLogin.jsp";
		}else {
			msg="회원가입을 실패하였습니다.";
			loc="/views/member/memberSignup.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/views/common.msg.jsp").forward(request, response);
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
