package com.semi.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;


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

//		String path=getServletContext().getRealPath("/upload/board/");
//		MultipartRequest mr=new MultipartRequest(request, path,
//				1024*1024*200,"utf-8",new MyRenameFile());
		
		
		String memberAgeyy=request.getParameter("yy");
		String memberAgemm=request.getParameter("mm");
		String memberAgedd=request.getParameter("dd");
		
		
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy/MM/dd");
		Date memberAge=null;
		try {
			memberAge=sdf.parse(memberAgeyy+"/"+memberAgemm+"/"+memberAgedd);
			
		}catch(ParseException e) {
			e.printStackTrace();
		}
		System.out.println(memberAge);
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
		m.setWeight(Double.parseDouble(request.getParameter("weight")));
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
