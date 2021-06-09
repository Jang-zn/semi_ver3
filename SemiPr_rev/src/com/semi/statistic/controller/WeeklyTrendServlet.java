package com.semi.statistic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.member.model.vo.Member;
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

		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		
		//로그인 처리 분기
		if(m==null) {
			String msg="회원 전용 기능입니다.";
			String loc="/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			String memberId=m.getMemberId();
			List<MemberExcList> list01=new StatisticService().TodayMemberExcList(memberId);			
			request.setAttribute("list01", list01);
			List<MemberMenuList> list02=new StatisticService().TodayMemberMenuList(memberId);
			request.setAttribute("list02", list02);	
			
			int excAchieve=new StatisticService().ExcAchieveCount(memberId);
			request.setAttribute("excAchieve", excAchieve);
			int menuAchieve=new StatisticService().MenuAchieveCount(memberId);
			request.setAttribute("menuAchieve", menuAchieve);
			

			List<ExcInfo> excStatistic=new StatisticService().ExcStatistic(memberId);
			request.setAttribute("excStatistic", excStatistic);
			System.out.println(excStatistic.get(0).getExcName());
			
			MenuInfo menuStatistic=new StatisticService().MenuStatistic(memberId);
			request.setAttribute("menuStatistic", menuStatistic);

			request.getRequestDispatcher("/views/member/weeklyTrend.jsp").forward(request, response);
		
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
