package com.semi.gallary.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.semi.gallary.model.service.GallaryService;

/**
 * Servlet implementation class GallaryDeleteServlet
 */
@WebServlet("/gallary/deleteGallary")
public class GallaryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallaryDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int galNo= Integer.parseInt(request.getParameter("no"));
		System.out.println("no :" +galNo);
		String filePath =request.getParameter("src");
		int result = new GallaryService().deleteGallary(galNo);
//		int result2 = new GallaryService().deleteImg(galNo);
		
		
		System.out.println("갤러리삭제 :"+result);
		
		String msg ="";
		String loc="";
		if(result>0) {
			msg="삭제되었습니다";
			
//			File f = new File(filePath);
//			if(f.exists()) {
//				f.delete();}
						
		}else {
			msg="삭제실패";
			
			
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc","/gallary/list");
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		
		
//		response.getWriter().print(delete);
		
		


	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
