package com.semi.member.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.common.PageBar;
import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.model.service.MemberService;

/**
 * Servlet implementation class MemberExcPlanServlet
 */
@WebServlet("/member/excPlan")
public class MemberExcPlanServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberExcPlanServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sort = request.getParameter("excSort");
		if(sort==null) {
			sort="상체";
		}
		int totalData = new MemberService().getExcListCount(sort);
		
		PageBar p = new PageBar(request, totalData, 4, "/member/excPlan");
		int cPage = p.getCPage();
		int numPerpage = p.getNumPerpage();
		String pageBar = p.getPageBar();
		List<Exercise> list = new MemberService().getExcList(sort, cPage, numPerpage); //Exercise List
		
		
		
		request.setAttribute("excList", list);
		request.setAttribute("pageBar", pageBar);
		request.getRequestDispatcher("/views/member/plan/memberExcPlan.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
