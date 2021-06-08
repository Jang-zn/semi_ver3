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
 * Servlet implementation class InsertMenuDailylogServlet
 */
@WebServlet("/daily/insertmenudaily")
public class InsertMenuDailylogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMenuDailylogServlet() {
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
		String menu=request.getParameter("menuArr");
		String[] menuarr=menu.split(",");		
		String sysdate=new MemberService().selectmenuSysdate(memberid);
		System.out.println(sysdate+"여기체크");
		String msg="";
		String loc="";
		if(sysdate==null||sysdate.equals("")) {
		for(int i=1;i<menuarr.length;i++) {
			new MemberService().insertMenuDaliylog(menuarr[i]);
		}
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
