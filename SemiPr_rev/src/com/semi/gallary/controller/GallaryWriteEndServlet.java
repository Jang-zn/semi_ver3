package com.semi.gallary.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.semi.gallary.model.service.GallaryService;
import com.semi.gallary.model.vo.Gallary;

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
		if(result>0&&result2>0) {
			msg="등록 성공";
			loc="/gallary/list";
		}else {
			msg="등록 실패";
			loc="/gallary/write";
		}
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
		
		request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
		
		
		
		
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
