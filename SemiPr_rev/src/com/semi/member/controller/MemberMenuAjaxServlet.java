package com.semi.member.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.google.gson.*;
import com.semi.member.menu.model.vo.*;
import com.semi.member.model.service.*;

/**
 * Servlet implementation class MenuselectServlet
 */
@WebServlet("/ajax/selectmenu")
public class MemberMenuAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberMenuAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String Menuid=request.getParameter("Menuid");
		Menu m = new MemberService().selectMenu(Menuid);
		
		response.setContentType("application/json;charset=utf-8");
		new Gson().toJson(m,response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
