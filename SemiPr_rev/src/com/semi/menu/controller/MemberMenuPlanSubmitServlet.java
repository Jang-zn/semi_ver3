package com.semi.menu.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.exc.model.service.ExcService;
import com.semi.member.menu.model.vo.MemberMenu;
import com.semi.member.menu.model.vo.Menu;
import com.semi.member.model.vo.Member;
import com.semi.menu.model.service.MenuService;

/**
 * Servlet implementation class MemberExcPlanSubmitServlet
 */
@WebServlet("/member/menuPlan/submit")
public class MemberMenuPlanSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMenuPlanSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("logged");
		String memberId = "";
		if(m==null) {

		}else {
			memberId = m.getMemberId();
		}
		Menu me = new MenuService().getMenuInfo(request.getParameter("menuName"));
		MemberMenu mm = new MemberMenu();
		mm.setMenuId(me.getMenuId());
		mm.setMemberId(memberId);
		mm.setMenuWeek(request.getParameter("week"));
		mm.setMenuDayTime(request.getParameter("dayTime"));
		
		//중복체크 - 중복이면 암것도 안함 새거면 등록
				int result = new MenuService().checkDupMenu(mm);				
				if(result>0) {
					String msg ="이미 등록된 메뉴입니다.";
					String location = "/member/menuPlan?numPerpage=6";
					request.setAttribute("msg", msg);
					request.setAttribute("loc", location);
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
					
				}else {
					int resultF = new MenuService().insertMemberMenu(mm);
					String msg ="";
					if(resultF>0) {
						msg="등록성공";
					}else {
						msg="등록실패";
					}
					String location = "/member/menuPlan?numPerpage=6";
					request.setAttribute("msg", msg);
					request.setAttribute("loc", location);
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
