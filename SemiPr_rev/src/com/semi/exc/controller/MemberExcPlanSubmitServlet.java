package com.semi.exc.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.semi.exc.model.service.ExcService;
import com.semi.member.exc.model.vo.Exercise;
import com.semi.member.exc.model.vo.MemberExercise;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class MemberExcPlanSubmitServlet
 */
@WebServlet("/member/excPlan/submit")
public class MemberExcPlanSubmitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberExcPlanSubmitServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member m = (Member)session.getAttribute("loginMember");
		String memberId = "";
		if(m==null) {
			// m null처리 해줘야됨///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			memberId="test50";
			////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		}else {
			memberId = m.getMemberId();
		}
		Exercise exc = new ExcService().getExcInfo(request.getParameter("excName"));
		
		
		MemberExercise me = new MemberExercise();
		me.setExcId(exc.getExcId());
		me.setMemberId(memberId);
		me.setReps(Integer.parseInt(request.getParameter("reps")));
		me.setSets(Integer.parseInt(request.getParameter("sets")));
		me.setWeight(Integer.parseInt(request.getParameter("weight")));
		me.setExcWeek(request.getParameter("week"));
		int result = new ExcService().insertMemberExc(me);
		String msg ="";
		if(result>0) {
			msg="등록성공";
		}else {
			msg="등록실패";
		}
		String location = "/member/excPlan?numPerpage=10";
		request.setAttribute("msg", msg);
		request.setAttribute("loc", location);
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
