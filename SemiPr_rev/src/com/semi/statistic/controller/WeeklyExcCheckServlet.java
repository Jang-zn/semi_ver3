package com.semi.statistic.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.semi.member.model.vo.Member;
import com.semi.statistic.model.service.StatisticService;

/**
 * Servlet implementation class WeeklyExcCheckServlet
 */
@WebServlet("/ajax/weeklyExcCheck")
public class WeeklyExcCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeeklyExcCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setContentType("application/jason;charset=utf-8");
			
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		
		if(m==null) {
			String msg="회원 전용 기능입니다.";
			String loc="/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			String memberId=m.getMemberId();
			String weekCheck=request.getParameter("weekCheck");
			String result=new StatisticService().weekExcCheck(weekCheck, memberId);
			
			JSONObject jo=new JSONObject();
			
			jo.put("weekCheck", result);
			
			response.getWriter().print(jo);
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
