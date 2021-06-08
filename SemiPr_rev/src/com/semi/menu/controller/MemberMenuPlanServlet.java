package com.semi.menu.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.common.PageBar;
import com.semi.member.menu.model.vo.Menu;
import com.semi.menu.model.service.MenuService;

/**
 * Servlet implementation class MemberExcPlanServlet
 */
@WebServlet("/member/menuPlan")
public class MemberMenuPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMenuPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("menuSort");
		if(sort==null) {
			sort="고기";
		}
		int totalData = new MenuService().getMenuListCount(sort);
		
		PageBar p = new PageBar(request, totalData, 4, "/member/menuPlan");
		int cPage = p.getCPage();
		int numPerpage = p.getNumPerpage();
		String pageBar = p.getPageBar();
		List<Menu> list = new MenuService().getMenuList(sort, cPage, numPerpage); //Menu List
		
		
		request.setAttribute("menuList", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/member/plan/memberMenuPlan.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
