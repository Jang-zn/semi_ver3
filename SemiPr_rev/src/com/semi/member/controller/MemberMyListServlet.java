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
//		//�α��� ó�� �б�
//		
//		if(m==null) {
//			//�α��� ������ �̵� ����
//			
//		}else {
			//�ƴϸ� ���� ����Ʈ ������ �̵�
		///� ��� ����Ʈ ����¡ ó��
		
		//������ Ŭ���ϸ� �� ���� �������� �׳� ó���� ������ ���� ���Ͽ� ���� ������ ������
		
		String time=request.getParameter("time");
		if(time==null) {time="��ħ";}
		//��ħ,����,������ ������	
		String dayval = request.getParameter("val");
		if(dayval==null) {
	        Calendar calendar = Calendar.getInstance(); 
	        String []days = {"��","��","ȭ","��","��","��","��"};
	        dayval=days[calendar.get(Calendar.DAY_OF_WEEK)-1];
		}
		
		System.out.println(dayval);
		int totalData=new MemberService().SelectMemberExcListCount(dayval);
		System.out.println(totalData);

		PageBar pb =new PageBar(request,totalData,5,"/member/myList?val="+dayval);
		//list�����ö� memeberid �� ������ ���� �Ѱ���.
		System.out.println(pb.getCPage()+" "+pb.getNumPerpage());
		
		List<MemberExcList> list =new MemberService().SelectMemberExcList(pb.getCPage(),pb.getNumPerpage(),dayval);	
		//�Ĵ� ��� ����Ʈ ������ ó��
		/* ~~~~~~~~~~~~~~~~~~~~~~~~~
		 * 
		 * 
		 */
		int totalData2=new MemberService().SelectMemberMenuListCount(dayval);
		
		PageBar2 pb2 =new PageBar2(request,totalData2,5,"/member/myList?val="+dayval+"&time="+time);
		//memberid,����,�ð��� �Ѱ��� 
		List<MemberMenuList> list2 =new MemberService().SelectMemberMenuList(pb2.getCPage(),pb.getNumPerpage(),dayval,time);
	
		request.setAttribute("time", time);
		request.setAttribute("today", dayval);
		request.setAttribute("pageBar", pb.getPageBar());
		request.setAttribute("pageBar2", pb2.getPageBar());
		request.setAttribute("list", list);
		request.setAttribute("list2", list2);
		
		
		request.getRequestDispatcher("/views/member/plan/new_memberMyList.jsp").forward(request, response);
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
