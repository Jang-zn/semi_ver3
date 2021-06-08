package com.semi.statistic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;
import com.semi.statistic.model.service.StatisticService;
import com.semi.statistic.model.vo.ExcInfo;
import com.semi.statistic.model.vo.MenuInfo;

/**
 * Servlet implementation class WeeklyTrendServlet
 */
@WebServlet("/member/weeklyTrend")
public class WeeklyTrendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WeeklyTrendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<MemberExcList> list01=new StatisticService().TodayMemberExcList();			
		request.setAttribute("list01", list01);
		List<MemberMenuList> list02=new StatisticService().TodayMemberMenuList();
		request.setAttribute("list02", list02);	
		
		int excAchieve=new StatisticService().ExcAchieveCount();
		request.setAttribute("excAchieve", excAchieve);
		int menuAchieve=new StatisticService().MenuAchieveCount();
		request.setAttribute("menuAchieve", menuAchieve);
		
		List<ExcInfo> excStatistic=new StatisticService().ExcStatistic();
		request.setAttribute("excStatistic", excStatistic);
		System.out.println(excStatistic.get(0).getExcName());
		
		MenuInfo menuStatistic=new StatisticService().MenuStatistic();
		request.setAttribute("menuStatistic", menuStatistic);
		
		request.getRequestDispatcher("/views/member/weeklyTrend.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
