package com.semi.gallary.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.common.PageBar;
import com.semi.gallary.model.service.GallaryService;
import com.semi.gallary.model.vo.Gallary;



/**
 * Servlet implementation class GallaryListServlet
 */
@WebServlet("/gallary/list")
public class GallaryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallaryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int totalData = new GallaryService().selectGallaryCount();
		String location ="/gallary/list";
		
		PageBar pb = new PageBar(request,totalData,5,location);
		
		request.setAttribute("pageBar",pb.getPageBar());
		
		List<Gallary> list=new GallaryService().selectGallaryList(pb.getCPage(),pb.getNumPerpage());
		
		request.setAttribute("list", list);
		
		
		
		
		request.getRequestDispatcher("/views/gallary/noonList.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
