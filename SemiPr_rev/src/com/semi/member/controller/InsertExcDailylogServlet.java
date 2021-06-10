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
 * Servlet implementation class InsertExcDailylogServlet
 */
@WebServlet("/daily/insertexcdaily")
public class InsertExcDailylogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertExcDailylogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		String memberid=m.getMemberId();
		String exc=request.getParameter("excArr");
		String[] excarr=exc.split(",");		
		String sysdate=new MemberService().selectSysdate(memberid);
		System.out.println(sysdate+"여기체크");
		String msg="";
		String loc="";
		if(sysdate.equals("C")) {
			new MemberService().updateExcDaliylog(memberid);
			msg="일지를 등록했습니다.";
			loc="/member/dailyLog";
		}else {
			msg="이미 일지를 등록하셨습니다.";
			loc="/member/dailyLog";
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
