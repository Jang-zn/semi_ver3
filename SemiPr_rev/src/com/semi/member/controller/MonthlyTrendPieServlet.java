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
 * Servlet implementation class MonthlyTrendPieServlet
 */
@WebServlet("/member/monthlyTrend/piecall")
public class MonthlyTrendPieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MonthlyTrendPieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String date = request.getParameter("yymm01");
		int length = Integer.parseInt(request.getParameter("length"));
		HttpSession session = request.getSession(false);
		Member m = (Member)session.getAttribute("logged");
		String memberId = "";
		
		
		String msg="";
		if(session==null||m==null) {
			msg = "로그인이 필요한 서비스입니다.";
			request.setAttribute("msg",msg);
			request.setAttribute("loc",request.getContextPath());
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			memberId = m.getMemberId();
		}
		
		Map[] liste = new ExcService().reasonE(memberId, date, length);
		Map[] listm = new MenuService().reasonM(memberId, date, length);
		
		
		Map[][] list = new Map[2][];
		list[0] = liste;
		list[1] = listm;
		
		
		new Gson().toJson(list,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
