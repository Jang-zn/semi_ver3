package com.semi.member.controller;

import java.io.File;
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
import com.semi.common.filter.EncryptWrapper;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberInfoUpdateEndServlet
 */
@WebServlet("/member/memberinfoupdateEnd")
public class MemberInfoUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "개인정보 수정실패[form:enctype]");
			request.setAttribute("loc", "/member/main");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path=getServletContext().getRealPath("/upload/profile");
		MultipartRequest mr=new MultipartRequest(request,path,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());
		
		Member m=new Member();
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
		m.setMemberId(mr.getParameter("memberid"));
		
		m.setMemberPw(EncryptWrapper.getSHA512(mr.getParameter("password_")));
		if(mr.getParameter("password_").length()<1) {
			m.setMemberPw(EncryptWrapper.getSHA512(mr.getParameter("password")));
		}
		m.setEmail(mr.getParameter("email"));
		m.setName(mr.getParameter("name"));
		m.setNickname(mr.getParameter("nickName"));
		m.setBirth(memberAge);
		m.setGender(mr.getParameter("gender"));
		m.setPhone(mr.getParameter("phone"));
		m.setHeight(Double.parseDouble(mr.getParameter("height")));
		m.setWeight(Double.parseDouble(mr.getParameter("weight")));

		
		//이전 파일 삭제 로직
		String fileName=mr.getFilesystemName("userProfile");
		File f=mr.getFile("userProfile");
		if(f!=null&&f.length()>0) {
			File del=new File(path+"/"+mr.getParameter("old_file"));
			del.delete();
		}else {
			fileName=mr.getParameter("old_file");
			
		}
			m.setProfileImg(fileName);
		
	

		System.out.println(m);
		int result=new MemberService().updateMember(m);
		String msg="";
		String loc="";
		if(result>0) {
			msg="수정 성공";
			loc="/member/main";
		}else {
			msg="수정 실패";
			loc="/member/memberinfoupdateEnd";
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
