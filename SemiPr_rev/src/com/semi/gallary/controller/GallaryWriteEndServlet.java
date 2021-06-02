package com.semi.gallary.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;
import com.semi.gallary.model.service.*;
import com.semi.gallary.model.vo.*;

/**
 * Servlet implementation class GallaryWriteEndServlet
 */
@WebServlet("/gallary/writeEnd")
public class GallaryWriteEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GallaryWriteEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String path = getServletContext().getRealPath("/upload/gallary");
		int maxSize = 1024 * 1024 * 50;
		String encode="UTF-8";
		FileRenamePolicy policy = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(request,path,maxSize,encode,policy);
		
		Gallary g = new Gallary();
		g.setContent(mr.getParameter("content"));
		String file = mr.getFilesystemName("imgUp");
		
		int result = new GallaryService().insertGallary(g);
		int result2 = new GallaryService().insertGFile(file);
		
		String msg ="";
		String loc="";
		if(result>0&&result>0) {
			msg="등록 성공";
			loc="/gallary/list";
		}else {
			msg="등록 실패";
			loc="";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		request.getRequestDispatcher("/view/common/msg.jsp").forward(request,response);
		
		
		
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
