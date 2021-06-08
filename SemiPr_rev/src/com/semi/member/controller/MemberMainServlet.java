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
 * Servlet implementation class MemberMainServlet
 */
@WebServlet("/member/main")
public class MemberMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		
		//로그인 처리 분기
		
		if(m==null) {
			//로그인 페이지 이동 로직
			String msg="회원만 이용가능합니다";
			String loc="/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			String memberid=m.getMemberId();
			Member minfo= new MemberService().selectMemberinfo(memberid);
			String[] galimg =new String[4];
			galimg= new MemberService().selcetGallaryimg(memberid);
			String[] exclist = new MemberService().exclist(memberid);
			String[] menulist = new MemberService().menulist(memberid);
			
			

			
		request.setAttribute("menulist", menulist);
		request.setAttribute("exclist", exclist);
		request.setAttribute("galimg", galimg);
		request.setAttribute("memberinfo", minfo);
		request.getRequestDispatcher("/views/member/memberMain.jsp").forward(request, response);
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
