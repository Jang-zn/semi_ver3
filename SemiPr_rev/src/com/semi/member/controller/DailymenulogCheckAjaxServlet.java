package com.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.semi.member.model.service.MemberService;
import com.semi.member.model.vo.Member;

/**
 * Servlet implementation class DailymenulogCheckAjaxServlet
 */
@WebServlet("/ajax/dailymenulogcheck")
public class DailymenulogCheckAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DailymenulogCheckAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated 	method stub
		String menudate=request.getParameter("menudate");
		menudate = menudate.replace("-", "");
		System.out.println(menudate);
		HttpSession session=request.getSession();
		Member m=(Member)session.getAttribute("logged");
		String memberid=m.getMemberId();
		int[] check = new MemberService().YNmenuCheckAll(menudate,memberid); 
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(check,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
