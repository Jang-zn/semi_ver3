package com.semi.member.controller;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.common.PageBar;
import com.semi.common.PageBar2;
import com.semi.member.daily.model.vo.DailyExercise;
import com.semi.member.daily.model.vo.DailyMenu;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;
import com.semi.member.model.vo.MemberExcList;
import com.semi.member.model.vo.MemberMenuList;

/**
 * Servlet implementation class DailyExcServlet
 */
@WebServlet("/member/dailyLog")
public class DailyLogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailyLogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String sysdate =new MemberService().selectSysdate();		
//		int[] excno = new MemberService().selectExcno();
//		System.out.println(excno[1]);
//		System.out.println(Arrays.toString(excno));
//		if(sysdate==null||sysdate.equals("")) {
//			for(int i=0;i<excno.length;i++) {
//				if(excno[i]!=0) {new MemberService().insertDailylog(excno[i]);}
//			}
//			
//		}
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		
		//로그인 처리 분기
		
		if(m==null) {
			//로그인 페이지 이동 로직
			String msg="회원만 이용가능합니다";
			String loc="/member/login";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			//아니면 마이 리스트 페이지 이동
		///운동 목록 리스트 페이징 처리
		String memberid=m.getMemberId();
		//기본값으로 아침,요일가져옴
		String dayval = request.getParameter("val");
		if(dayval==null) {
	        Calendar calendar = Calendar.getInstance(); 
	        String []days = {"일","월","화","수","목","금","토"};
	        dayval=days[calendar.get(Calendar.DAY_OF_WEEK)-1];
		}
		int cPage2;
		try {
			cPage2 = Integer.parseInt(request.getParameter("cPage2"));
		} catch (NumberFormatException e) {
			cPage2 = 1;
		}
		List<MemberExcList> list= new MemberService().selectDailyExclist(dayval,memberid);
		int totaldata= new MemberService().selectDailyexclistCount(memberid);
		System.out.println(totaldata);
		PageBar pb =new PageBar(request, totaldata, 5,"/member/dailyLog","cPage="+cPage2);
		List<DailyExercise> list2 = new MemberService().selectMemberDailyExcercise(memberid,pb.getCPage(),pb.getNumPerpage()+7);
		
		
		List<MemberMenuList> list3 =new MemberService().selectDailymenulist(dayval,memberid);
		
		int totaldata2= new MemberService().selectDailymenulistCount(memberid);
		PageBar2 pb2 =new PageBar2(request, totaldata, 5,"/member/dailyLog","cPage2="+pb.getCPage());
		List<DailyMenu> list4 =new MemberService().selectMemberDailyMenu(memberid,pb2.getCPage(),pb2.getNumPerpage()+7);
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		request.setAttribute("list3", list3);
		request.setAttribute("list4", list4);
		request.setAttribute("pageBar", pb.getPageBar());
		request.setAttribute("pageBar2", pb2.getPageBar());
		request.getRequestDispatcher("/views/member/daily/new_dailyLog.jsp").forward(request, response);
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
