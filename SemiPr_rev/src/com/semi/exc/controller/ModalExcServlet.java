package com.semi.exc.controller;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.semi.exc.model.service.ExcService;

/**
 * Servlet implementation class ModalExcServlet
 */
@WebServlet("/ajax/modalE")
public class ModalExcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalExcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		int today = cal.get(cal.DATE); //오늘 날짜
		int y = cal.get(cal.YEAR);
		String year = (""+y).substring(2); //YY
		int m = cal.get(cal.MONTH);
		String month="";  //MM
		if(m>10) {
			month=""+(m+1);
		}else {
			month="0"+(m+1);
		}
		String memberId = request.getParameter("memberId");
		int d =Integer.parseInt(request.getParameter("date"));
		String date="";
		if(d<10) {
			date = year+"/"+month+"/0"+d;
		}else {
			date = year+"/"+month+"/"+d;
		}
		int reason = Integer.parseInt(request.getParameter("reason"));
		int result = new ExcService().reasonUpdate(memberId, date, reason);
		
		String msg="";
		if(result>0) {
			msg="등록 완료";
		}else {
			msg="등록 실패";
		}
		new Gson().toJson(msg, response.getWriter());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
