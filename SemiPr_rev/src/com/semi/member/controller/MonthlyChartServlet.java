package com.semi.member.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.exc.model.service.ExcService;
import com.semi.member.model.vo.Member;
import com.semi.menu.model.service.MenuService;

/**
 * Servlet implementation class MonthlyChartServlet
 */
@WebServlet("/member/monthlyChart")
public class MonthlyChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonthlyChartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String key = request.getParameter("key");
		String date = request.getParameter("sysdate");
		int length = Integer.parseInt(request.getParameter("length"));
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("logged");
		String memberId = m.getMemberId();
		
		
		switch(key) {
		case "monthlyExc":
			Map[] elist = new ExcService().planCountExcforChart(memberId, date, length);
			new Gson().toJson(elist, response.getWriter());
			break;
		case "monthlyMenu":
			Map[] mlist = new MenuService().planCountMenuforChart(memberId, date, length);
			new Gson().toJson(mlist, response.getWriter());
			break;
		case "stackReps":  
			
			break;
		case "stackKcals":
			
			break;
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
