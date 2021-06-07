package com.semi.member.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.common.*;
import com.semi.member.model.service.*;
import com.semi.member.model.vo.*;

/**
 * Servlet implementation class MemberMyListServlet
 */
@WebServlet("/member/myList")
public class MemberMyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		String time=request.getParameter("time");
		if(time==null) {time="아침";}
		//기본값으로 아침,요일가져옴
		String dayval = request.getParameter("val");
		if(dayval==null) {
	        Calendar calendar = Calendar.getInstance(); 
	        String []days = {"일","월","화","수","목","금","토"};
	        dayval=days[calendar.get(Calendar.DAY_OF_WEEK)-1];
		}
		
		System.out.println(dayval);
		int totalData=new MemberService().SelectMemberExcListCount(dayval,memberid);
		System.out.println(totalData);
		int cPage2;
		try {
			cPage2 = Integer.parseInt(request.getParameter("cPage2"));
		} catch (NumberFormatException e) {
			cPage2 = 1;
		}
		PageBar pb =new PageBar(request,totalData,5,"/member/myList","val="+dayval+"&memberid="+memberid+"&cPage2="+cPage2);
		//list id값
		
		List<MemberExcList> list =new MemberService().SelectMemberExcList(pb.getCPage(),pb.getNumPerpage(),dayval,memberid);	
		//식단 리스트
		/* ~~~~~~~~~~~~~~~~~~~~~~~~~
		 * 
		 * 
		 */
		int totalData2=new MemberService().SelectMemberMenuListCount(dayval,memberid);
		
		PageBar2 pb2 =new PageBar2(request,totalData2,5,"/member/myList","val="+dayval+"&time="+time+"&memberid="+memberid+"&cPage="+pb.getCPage());
		pb2.getCPage();
		List<MemberMenuList> list2 =new MemberService().SelectMemberMenuList(pb2.getCPage(),pb.getNumPerpage(),dayval,time,memberid);
	
		request.setAttribute("time", time);
		request.setAttribute("today", dayval);
		request.setAttribute("pageBar", pb.getPageBar());
		request.setAttribute("pageBar2", pb2.getPageBar());
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		
		
		request.getRequestDispatcher("/views/member/plan/new_memberMyList.jsp").forward(request, response);
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
