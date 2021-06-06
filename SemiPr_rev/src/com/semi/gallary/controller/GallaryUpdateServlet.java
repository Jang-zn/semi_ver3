package com.semi.gallary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.gallary.model.service.GallaryService;
import com.semi.gallary.model.vo.Gallary;

/**
 * Servlet implementation class GallaryUpdateServlet
 */
@WebServlet("/gallary/updateGallary")
public class GallaryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallaryUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int galNo=Integer.parseInt(request.getParameter("no"));
		
		
		Gallary g =new GallaryService().selectGallary(galNo);
		
		request.setAttribute("gallary",g);
		
		request.getRequestDispatcher("/views/gallary/noonUpdate.jsp")
		.forward(request, response);
	
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
