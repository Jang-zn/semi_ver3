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
//		//濡쒓렇�씤 泥섎━ 遺꾧린
//		
//		if(m==null) {
//			//濡쒓렇�씤 �럹�씠吏� �씠�룞 濡쒖쭅
//			
//		}else {
			//�븘�땲硫� 留덉씠 由ъ뒪�듃 �럹�씠吏� �씠�룞
		///�슫�룞 紐⑸줉 由ъ뒪�듃 �럹�씠吏� 泥섎━
		
		//�슂�씪�쓣 �겢由��븯硫� 洹� 媛믪쓣 媛��졇�삤怨� 洹몃깷 泥섏쓬�뿉 �뱾�뼱媛붿쓣�븧 �쁽�옱 �슂�씪�뿉 ���븳 �젙蹂대�� 媛��졇�샂
		
		String time=request.getParameter("time");
		if(time==null) {time="�븘移�";}
		//�븘移�,�젏�떖,���뀅�쓣 媛��졇�샂	
		String dayval = request.getParameter("val");
		if(dayval==null) {
	        Calendar calendar = Calendar.getInstance(); 
	        String []days = {"�씪","�썡","�솕","�닔","紐�","湲�","�넗"};
	        dayval=days[calendar.get(Calendar.DAY_OF_WEEK)-1];
		}
		
		System.out.println(dayval);
		int totalData=new MemberService().SelectMemberExcListCount(dayval);
		System.out.println(totalData);


		PageBar pb =new PageBar(request,totalData,5,"/member/myList?val="+dayval);
		//list媛��졇�삱�븣 memeberid �� �슂�씪�쓣 媛숈씠 �꽆寃⑥쨲.

		System.out.println(pb.getCPage()+" "+pb.getNumPerpage());
		
		List<MemberExcList> list =new MemberService().SelectMemberExcList(pb.getCPage(),pb.getNumPerpage(),dayval);	

		/* ~~~~~~~~~~~~~~~~~~~~~~~~~
		 * 
		 * 
		 */
		int totalData2=new MemberService().SelectMemberMenuListCount(dayval);
		

		PageBar pb2 =new PageBar(request,totalData2,5,"/member/myList?val="+dayval+"&time="+time);
		//memberid,�슂�씪,�떆媛꾩쓣 �꽆寃⑥쨲 

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
