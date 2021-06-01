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
//		HttpSession session=request.getSession();
//		Member m=(Member)session.getAttribute("member");
//		
//		//로그인 처리 분기
//		
//		if(m==null) {
//			//로그인 페이지 이동 로직
//			
//		}else {
			//아니면 마이 리스트 페이지 이동
		///운동 목록 리스트 페이징 처리
		
		//요일을 클릭하면 그 값을 가져오고 그냥 처음에 들어갔을땐 현재 요일에 대한 정보를 가져옴
		
		String time=request.getParameter("time");
		if(time==null) {time="아침";}
		//아침,점심,저녁을 가져옴	
		String dayval = request.getParameter("val");
		if(dayval==null) {
	        Calendar calendar = Calendar.getInstance(); 
	        String []days = {"일","월","화","수","목","금","토"};
	        dayval=days[calendar.get(Calendar.DAY_OF_WEEK)-1];
		}
		
		System.out.println(dayval);
		int totalData=new MemberService().SelectMemberExcListCount(dayval);
		System.out.println(totalData);

		PageBar pb =new PageBar(request,totalData,5,"/member/myList?val="+dayval);
		//list가져올때 memeberid 와 요일을 같이 넘겨줌.
		System.out.println(pb.getCPage()+" "+pb.getNumPerpage());
		
		List<MemberExcList> list =new MemberService().SelectMemberExcList(pb.getCPage(),pb.getNumPerpage(),dayval);	
		//식단 목록 리시트 페이지 처리
		/* ~~~~~~~~~~~~~~~~~~~~~~~~~
		 * 
		 * 
		 */
		int totalData2=new MemberService().SelectMemberMenuListCount(dayval);
		
		PageBar pb2 =new PageBar(request,totalData2,5,"/member/myList?val="+dayval+"&time="+time);
		//memberid,요일,시간을 넘겨줌 
		List<MemberMenuList> list2 =new MemberService().SelectMemberMenuList(pb2.getCPage(),pb.getNumPerpage(),dayval,time);
	
		request.setAttribute("time", time);
		request.setAttribute("today", dayval);
		request.setAttribute("pageBar", pb.getPageBar());
		request.setAttribute("pageBar2", pb2.getPageBar());
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		
		
		request.getRequestDispatcher("/views/member/plan/memberMyList.jsp").forward(request, response);
		}
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
