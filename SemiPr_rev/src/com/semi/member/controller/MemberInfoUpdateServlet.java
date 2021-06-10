package com.semi.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.common.AESEncrypt;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberInfoUpdateServlet
 */
@WebServlet("/member/memberinfoupdate")
public class MemberInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInfoUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String memberid = request.getParameter("memberid");
		
		Member m= new MemberService().selectmemberinfo(memberid);
		try {
			m.setEmail(AESEncrypt.decrypt(m.getEmail()));
			m.setPhone(AESEncrypt.decrypt(m.getPhone()));
			m.setMemberPw(AESEncrypt.decrypt(m.getMemberPw()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(m);
		request.setAttribute("m", m);
		request.getRequestDispatcher("/views/member/memberupdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
