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

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.semi.common.AESEncrypt;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;


/**
 * Servlet implementation class MemberEnrollServlet
 */
@WebServlet("/member/memberSignup")
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

		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg","[form:enctype] 관리자에게 문의");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path= getServletContext().getRealPath("/upload/profile");
	
		
		int maxSize = 2*1024*1024; //2mb
		String encode="UTF-8"; //인코딩값
		FileRenamePolicy policy =new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,encode,policy);
		Member m = new Member();
		
		String memberAgeyy=mr.getParameter("yy");
		String memberAgemm=mr.getParameter("mm");
		String memberAgedd=mr.getParameter("dd");
		
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy/MM/dd");
		Date memberAge=null;
		try {
			memberAge=sdf.parse(memberAgeyy+"/"+memberAgemm+"/"+memberAgedd);
			
		}catch(ParseException e) {
			e.printStackTrace();
		}
		
		m.setMemberId(mr.getParameter("userId"));
		m.setMemberPw(mr.getParameter("password"));
		//m.setEmail(mr.getParameter("email"));
		String email = mr.getParameter("email");
		try {
			email=AESEncrypt.encrypt(email);
		}catch(Exception e) {
			e.printStackTrace();
		}
		m.setEmail(email);
		m.setName(mr.getParameter("name"));
		m.setNickname(mr.getParameter("nickName"));
		m.setBirth(memberAge);
		m.setGender(mr.getParameter("gender"));
		//m.setPhone(mr.getParameter("phone"));
		String phone = mr.getParameter("phone");
		try {
			phone=AESEncrypt.encrypt(phone);
		}catch(Exception e) {
			e.printStackTrace();
		}
		m.setPhone(phone);
		m.setHeight(Double.parseDouble(mr.getParameter("height")));
		m.setWeight(Double.parseDouble(mr.getParameter("weight")));
		m.setProfileImg(mr.getFilesystemName("userProfile"));
		System.out.println(m);
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
