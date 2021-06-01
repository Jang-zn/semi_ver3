package com.semi.member.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.semi.member.model.service.*;
import com.semi.member.model.vo.*;

/**
 * Servlet implementation class MemberexcUpdateEndServlet
 */
@WebServlet("/member/myexclistupdateEnd")
public class MemberexcUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberexcUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		MemberExcList mel = new MemberExcList();
		request.setCharacterEncoding("utf-8");
		mel.setExcNo(Integer.parseInt(request.getParameter("no")));
		mel.setReps(Integer.parseInt(request.getParameter("reps")));
		mel.setSets(Integer.parseInt(request.getParameter("sets")));
		mel.setWeight(Double.parseDouble(request.getParameter("weight")));
		mel.setExcWeek(request.getParameter("week"));
		System.out.println(mel);
		System.out.println(request.getParameter("week"));
		System.out.println(request.getParameter("week"));
		System.out.println(request.getParameter("week"));
		System.out.println(request.getParameter("week"));
		int result = new MemberService().updateExcrcise(mel);
		String msg="";
		
		if(result>0) {
			msg="수정 성공";
		
		}else {
			msg="수정 실패";
		
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("/views/common/openmsg.jsp").forward(request, response); 
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
