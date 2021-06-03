package com.semi.statistic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.semi.statistic.model.service.StatisticService;

/**
 * Servlet implementation class WeeklyCheckServlet
 */
@WebServlet("/ajax/weeklyCheck")
public class WeeklyCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeeklyCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
//		request.getRequestDispatcher("weeklyTrend.jsp").forward(request, response);
//		
		String weekCheck=request.getParameter("weekCheck");
		String result=new StatisticService().weekMenuCheck(weekCheck);
		
		JSONObject jo=new JSONObject();
		jo.put("weekCheck", result);
		
		response.setContentType("application/jason;charset=utf-8");
		response.getWriter().print(jo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
